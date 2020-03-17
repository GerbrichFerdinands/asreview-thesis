This is the log of simulations. There are three stages, we start with
the first where we are comparing different classifiers.

    ## Warning in pack_rows(., "Classifier", 1, 5): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "Feature Extraction", 6, 10): Please specify format
    ## in kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "Balance Strategy", 11, 20): Please specify format
    ## in kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

| x    |
|:-----|
| BCTW |
| RCTW |
| SCTW |
| LCTW |
| NCTW |
| BCDW |
| RCDW |
| SCDW |
| LCDW |
| NCDW |
| BCTU |
| RCTU |
| SCTU |
| LCTU |
| NCTU |
| BCDU |
| RCDU |
| SCDU |
| LCDU |
| NCDU |

### Version information

Personal device

Cartesius supercomputer

------------------------------------------------------------------------

Stage 1 - Classifiers
=====================

Comparing five different classifiers

| model | hyperopt |  ace|  nudging|  ptsd|  software|  wilson|
|:------|:---------|----:|--------:|-----:|---------:|-------:|
| BCTW  | one      |    0|        0|     0|         0|       0|
| RCTW  | one      |    0|        0|     0|         0|       0|
| SCTW  | one      |    0|        0|     0|         0|       0|
| LCTW  | one      |    0|        0|     0|         0|       0|
| NCTW  | one      |    0|        0|     0|         0|       0|
| BCTW  | four     |    0|        0|     0|         0|       0|
| RCTW  | four     |    0|        0|     0|         0|       0|
| SCTW  | four     |    0|        0|     0|         0|       0|
| LCTW  | four     |    0|        0|     0|         0|       0|
| NCTW  | four     |    0|        0|     0|         0|       0|
| BCTW  | all      |    0|        0|     0|         0|       0|
| RCTW  | all      |    0|        0|     0|         0|       0|
| SCTW  | all      |    0|        0|     0|         0|       0|
| LCTW  | all      |    0|        0|     0|         0|       0|
| NCTW  | all      |    0|        0|     0|         0|       0|

R - 275 secs 119% - 5 datasets

    ## [1] 916.6667

1.1 Optimizing (hyper)parameters per model, per dataset (1-1)
-------------------------------------------------------------

### 1.1.1 Ace

    ## [1] "2020-03-17"

Optimization run on own device

Optimization run on Cartesius

### 1.1.2 Nudging

### 1.1.3 PTSD

### 1.1.4 Software

### 1.1.5 Wilson

Stage 2 - Feature exraction
===========================

Comparing tfidf with doc2vec

Stage 3 - Balance strategy
==========================

Redo all the analyses with a different balance strategy (aggressive
undersampling?) Probably won’t have time for this.
