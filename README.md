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

The examination of the plasma proteome with multifaceted neuroimaging metrics. Integration of plasma proteomic data as the input (X) with various neuroimaging measures as outcomes (Y) in a series of PLS2 models. The central proteomics matrix represents data for ~ 1,463 proteins across 4,644 individuals*, and serves as the consistent predictor set across multiple models. To the far left, the structural connectome maps white matter connectivity by tracing interconnections throughout the brain, enabling the computation of network metrics, using network metrics streamline count (SC) to assess the brain's network integrity. Adjacent, white matter microstructure will be analysed with metrics such as fractional anisotropy (FA), mean diffusivity (MD), intracellular volume fraction (ICVF), isotropic volume fraction (ISOVF), and orientation dispersion (OD), across 27 white matter tracts. Regional cortical volume and thickness across 34 areas, volume of white matter hyperintensities (WMH) and global grey and white matter volumes are also to be evaluated in their relation to proteomic variance. Each neuroimaging metric is paired with its corresponding Y matrix, illustrating the dimensions of the outcome data in relation to the uniform proteomics input. Together, these analyses represent a comprehensive examination of how peripheral protein profiles may relate to diverse aspects of brain structure and pathology. *exact numbers to be determined after data pre-processing*


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
