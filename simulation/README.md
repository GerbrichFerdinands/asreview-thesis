This is the log of simulations. There are three stages, we start with
the first where we are comparing different classifiers.

``` r
library(tidyverse)
```

    ## ── Attaching packages ───────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.0     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.5
    ## ✓ tidyr   1.0.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.5.0

    ## ── Conflicts ──────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(knitr)
library(kableExtra)
```

    ## 
    ## Attaching package: 'kableExtra'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     group_rows

``` r
conditiongrid <- readRDS("00_conditiongrid.RDS")

conditiongrid$condition %>%
  kable(format = "markdown") %>%
  pack_rows("Classifier", 1, 5) %>%
  pack_rows("Feature Extraction", 6, 10) %>%
  pack_rows("Balance Strategy", 11, 20)
```

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

------------------------------------------------------------------------

Stage 1 - Classifiers
=====================

Comparing five different classifiers

``` r
hyperparametersets <- readRDS("01_hyperparameter_sets.RDS")

hyperparametersets %>%
  kable(format = "markdown")
```

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

``` r
275 / 5 * 1000 / 60 # 916 minutes
```

    ## [1] 916.6667

1.1 Optimizing (hyper)parameters per model, per dataset (1-1)
-------------------------------------------------------------

### 1.1.1 Ace

``` r
lubridate::date("2020-03-17")
```

    ## [1] "2020-03-17"

Optimization run on own device

``` bash
# RCTW
mpirun -n 2 asreview hyper-active -m nb -b double -e tfidf -q max -d ace -n 10000 -r 8 --mpi 
```

Optimization run on Cartesius

``` bash
# RCTW
./cart_hyper_run.py hyper-active -t 10 -m rf -b double -e tfidf -q max -d ace

# SCTW

# LCTW

# NCTW
```

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
