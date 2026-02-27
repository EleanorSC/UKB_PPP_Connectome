# UKB_PPP_Connectome


Code repository for:

**Conole et al. (2026)**  
*A data-driven approach to characterising the proteome–connectome in UK Biobank*

---

## Overview

This repository contains analysis pipelines examining associations between the plasma proteome and neuroimaging-derived measures of brain structure in UK Biobank.

The primary analytical framework uses **Partial Least Squares (PLS2)** to characterise multivariate proteome–brain relationships. Comparative approaches include:

- Principal Component Analysis (PCA)
- Penalised regression–derived ProteinScores

The goal is to identify interrelated sets of plasma proteins that map onto gradients of brain structural heterogeneity and to determine whether peripheral biological signatures reflect systematic variation in adult brain microstructure and large-scale organisation.

---

![Main relationships](images/figure_1.png)

**Figure 1. Multivariate modelling framework linking the plasma proteome to neuroimaging phenotypes.**  
Plasma proteomic data (X matrix; ~1,463 proteins across ~4,644 individuals, final sample determined post–quality control) were integrated with multiple neuroimaging outcome domains (Y matrices) using a series of Partial Least Squares (PLS2) models. The proteomics matrix served as a common predictor set across all models.

Neuroimaging outcomes included:

- **Structural connectome metrics** derived from white matter tractography, including streamline count (SC) as an index of network integrity  
- **White matter microstructure measures** across 27 major tracts, including fractional anisotropy (FA), mean diffusivity (MD), intracellular volume fraction (ICVF), isotropic volume fraction (ISOVF), and orientation dispersion (OD)  
- **Regional cortical volume and thickness** across 34 cortical regions  
- **White matter hyperintensity (WMH) volume** as a marker of small vessel disease  
- **Global grey and white matter volumes**

Each imaging domain was modelled as a distinct Y matrix aligned to the same proteomic predictor space, enabling systematic evaluation of shared and domain-specific proteome–brain structure relationships.

## Research Aims

### Aim 1 — Proteome–Brain Structure Associations

- Are plasma protein concentrations associated with:
  - Global grey matter volume
  - Global white matter volume
  - Global fractional anisotropy (FA)
  - Global mean diffusivity (MD)

- What is the relationship between plasma protein levels and regional cortical volume variation?

- How does the plasma proteome relate to:
  - White matter microstructure
  - Structural connectome measures

- Do plasma protein profiles associate with markers of small vessel disease (e.g., white matter hyperintensity volume)?

---

### Aim 2 — Functional Interpretation

- Which biological pathways are enriched among proteins associated with neuroimaging phenotypes?
- What do these pathways suggest about mechanisms relevant to brain health and disease?

---

### Aim 3 — Lifestyle and Vascular Modulation

- How do lifestyle factors and vascular risk markers influence proteome–brain structure associations?

---

### Aim 4 — Comparative Predictive Utility

- Do top-contributing proteins outperform generalised inflammatory signatures in predicting neuroimaging outcomes?
- How do these proteins compare to composite ProteinScores developed for inflammatory conditions?

---



## PLS2
![Study workflow](images/study_workflow.png)

Simplified workflow of PLS2 as a method of dimensionality reduction in characterising the proteome-connectome. Top panel shows how PLS2 finds relevant components that maximise the covariance between the response (X) and predictor (Y) variables, quantifying patterns of correlated covariance between plasma proteomic profiles and neuroimaging metrics. The matrices (top left) represent the raw data inputs, with proteomic data matrix as predictors (X) and neuroimaging data matrix as outcomes (Y). PLS2 matrix decomposition generates latent variables (LVs) that encapsulate the shared variance between the proteomic and neuroimaging datasets, yielding Proteomics-Scores and Brain-Scores for each individual. The extraction of latents is determined based off plotting error across dimensions, identifying the optimal number of LVs that minimize the prediction error; cross-validation enables us to pinpointing the optimal count of latent variables that balance model complexity and predictive accuracy, as shown by the plot of Root Mean Squared Error of Prediction (RMSEP) against the number of dimensions, Together, these components streamline the identification of parsimonious biological relationships within multidimensional biomedical data.
