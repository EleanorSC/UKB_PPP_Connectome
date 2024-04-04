## ---------------------------
##
## Script Purpose: Initial data linkage 
##
##
##  The script does the following:
##  | step | action                                                                  |
##  |------|-------------------------------------------------------------------------|
##  | 1    | reads in datasets  (proteomics, neuroimaging)                           |
##  | 2    | merges datasets based on paricipant ID (eid)                            |
##  | 3    | reshapes Olink proteomic data to wide format                            |
##  | 4    | links Olink proteomic data in masterdata to protein coding              |
##  | 5    | forms master dataset for all downstream analysis scripts                |
##
## ---------DATA NEEDED---------
##  proteomics data ("olink_data.txt") # 1.74GB
##  meta_data ("UKB_PROTEOMICS_FOR_SARAH_01AUGUST2023_GD.txt") #20.8MB
##  olink_panel_data ("ST3_UKB_proteins.txt") # 152KB (containing info about UKBPPPProteinID,Olink ID,Assay Target,Protein panel,Gene symbol,UniProt etc.)
##  protein_codes_data ("coding143.tsv") #124.KB
##  neuroimaging_data ("UKBiobank_imaging.xlsx") #77.2MB
##  neuroimaging_linkage ("UKBB_proteomics_baseline_IDs") #422KB (containing eids for neuroimaging participants)
##  connectome_linkage ("subjects_37284.csv") #298KB (containing eids for connectome participants)

# Set up environment
## Load necessary libraries
library(readxl)
library(magrittr) 

## Check and load additional libraries dynamically
required_packages <- c("styler", "readr", "tidyr")
new_packages <- required_packages[!(required_packages % %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
lapply(required_packages, library, character.only = TRUE)

## Set working directory
setwd("/Users/eleanorc_worklaptop/desktop/UKB_Proteomics")

# Data Preprocessing
## Read in datasets
ST3_UKB_proteins <- read_csv("ST3_UKB_proteins.csv")
UKB_connectome_IDs <- read_csv("subjects_37284.csv")
UKB_proteomics_IDs <- read_csv("UKBB_proteomics_baseline_IDs.csv")
UKBiobank_imaging <- read_excel("UKBiobank_imaging.xlsx")

## Harmonize ID columns across datasets for merging
names(UKB_connectome_IDs)[names(UKB_connectome_IDs) == "X1000019"] <- "eid"

UKB_proteomics_IDs <- UKB_proteomics_IDs %>%
  rename(eid = eid) # Ensure eid column name consistency

## Merge datasets based on participant ID (eid)
UKB_neuroimaging_and_proteomics <- UKBiobank_imaging %>%
  inner_join(UKB_proteomics_IDs, by = "eid")

UKB_neuroimaging_connectome_and_proteomics <- UKB_neuroimaging_and_proteomics %>%
  inner_join(UKB_connectome_IDs, by = "eid")

# Load and process proteomics data
d1 <- read_csv("olink_data.txt") %>%
  filter(ins_index == "0") %>%
  select(-ins_index)

## Reshape from long to wide format
start_time <- Sys.time()
UKB_proteomic_data <- pivot_wider(d1, names_from = protein_id, values_from = result, id_cols = eid)
end_time <- Sys.time()
elapsed_time <- end_time - start_time
warning(sprintf("Reshaping took approximately %d minutes.", as.numeric(elapsed_time, units = "mins")))

#### The code took approximately 40.1 minutes to run.

# Merge metadata and decode protein IDs
meta_data <- read_csv("UKB_PROTEOMICS_FOR_SARAH_01AUGUST2023_GD.txt")
ID_codes <- read_tsv("coding143.tsv") %>%
  separate(meaning, into = c("Protein", "Protein_full_name"), sep = ";")

## Update column names with decoded protein names
UKB_proteomic_data <- UKB_proteomic_data %>%
  rename_with(~ID_codes$Protein[match(.x, ID_codes$coding)], .cols = -eid)

## Final merging to create a master dataset
MASTER_DATA <- UKB_neuroimaging_connectome_and_proteomics %>%
  inner_join(UKB_proteomic_data, by = "eid")

## Output the master dataset
write_csv(MASTER_DATA, "MASTER_DATA.csv")
