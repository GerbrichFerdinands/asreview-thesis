Optimizing Hyperparameters
==========================

To every model belongs a unique set of hyperparameters. To maximize
model performance, we need to find optimal values for the
hyperparameters. For every model the optimal hyperparameter values are
determined by optimizing on data *d*. The hyperparameters are optimized
by running several hundreds of optimization trials, in which
hyperparameter values are sampled from their possible parameter space.

Maximum model performance is defined as the average time it takes to
find an inclusion in the data, or more specific: the loss function
minimizes the average number of papers needed to screen to find an
inclusion (eg the area above the curve in the inclusion plot).

The optimization data d consists of (a subset from) the six systematic
review datasets D mentioned above. Three different approaches in
composing d are explored:

-   **one**, where hyperparameters are optimized on only one of the six
    datasets. Such hyperparameters are expected to lead to maximum
    performance in the same dataset d.
-   **n**, where hyperparameters are optimized on all six data sets.
    This optimization approach intends to serve in producing the most
    optimal hyperparameters overall.
-   **n-1**, where hyperparameters are optimized on all six datasets but
    one. Serving as a sensitivity analysis for the former condition, eg
    how sensitive are the hyperparamters to different data sets.

This results in 6+6+1=13 sets of hyperparameters for every model.
Optimization trials were visually inspected to check if an optimum
(minimal loss) has been reached. More trials were run if the loss still
seemed to go down at a quick pace. The hyperparameter sets that were
found to lead to a minimum loss value were visually inspected.

Naive Bayes + TF-IDF
====================

Loss plots
----------

Two times the same data, first plot is over trials, second sorted from
highest to lowest loss.
![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)![](README_files/figure-markdown_github/unnamed-chunk-2-2.png)

Hyperparameter values
---------------------

![](README_files/figure-markdown_github/NB_TFIDF-1.png)![](README_files/figure-markdown_github/NB_TFIDF-2.png)

Inspect outliers:

    ## # A tibble: 2 x 4
    ## # Groups:   param [2]
    ##   datasets     group param              value
    ##   <chr>        <chr> <chr>              <dbl>
    ## 1 ace.ini      one   balance_param.a    1250.
    ## 2 software.ini one   model_param.alpha 98353.

SVM + TF-IDF
============

![](README_files/figure-markdown_github/SVM_TFIDF-1.png)![](README_files/figure-markdown_github/SVM_TFIDF-2.png)![](README_files/figure-markdown_github/SVM_TFIDF-3.png)![](README_files/figure-markdown_github/SVM_TFIDF-4.png)

Logistic Regression + TF-IDF
============================

![](README_files/figure-markdown_github/LR_TFIDF-1.png)![](README_files/figure-markdown_github/LR_TFIDF-2.png)![](README_files/figure-markdown_github/LR_TFIDF-3.png)![](README_files/figure-markdown_github/LR_TFIDF-4.png)

Inspect outliers

    ## # A tibble: 3 x 4
    ## # Groups:   param [2]
    ##   datasets     group param            value
    ##   <chr>        <chr> <chr>            <dbl>
    ## 1 ace.ini      one   balance_param.a 1139. 
    ## 2 software.ini one   model_param.c     45.4
    ## 3 software.ini one   model_param.c     45.4

    ## # A tibble: 3 x 4
    ## # Groups:   param [1]
    ##   datasets                               group param                     value
    ##   <chr>                                  <chr> <chr>                     <dbl>
    ## 1 ptsd_virus_ace_wilson_nudging.ini      n-1   model_param.class_weight  7434.
    ## 2 ptsd_virus_software_wilson_nudging.ini n-1   model_param.class_weight  5506.
    ## 3 software.ini                           one   model_param.class_weight 50289.

Logistic Regression + Doc2Vec
=============================

![](README_files/figure-markdown_github/LR_D2V-1.png)![](README_files/figure-markdown_github/LR_D2V-2.png)![](README_files/figure-markdown_github/LR_D2V-3.png)![](README_files/figure-markdown_github/LR_D2V-4.png)

Random Forest + TF-IDF
======================

![](README_files/figure-markdown_github/rf_tfidf-1.png)![](README_files/figure-markdown_github/rf_tfidf-2.png)![](README_files/figure-markdown_github/rf_tfidf-3.png)![](README_files/figure-markdown_github/rf_tfidf-4.png)

Random Forest + Doc2Vec
=======================

Loss plot
---------

![](README_files/figure-markdown_github/rf_d2v_loss-1.png)![](README_files/figure-markdown_github/rf_d2v_loss-2.png)

Hyperparameter Values
---------------------

![](README_files/figure-markdown_github/rf_d2v-1.png)![](README_files/figure-markdown_github/rf_d2v-2.png)
