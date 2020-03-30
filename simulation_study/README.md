This is the log of simulations.

Simulations
===========

Hyperparameter optimization
---------------------------

There are three stages, we start with the first where we are comparing
different classifiers.

| condition | stage      |
|:----------|:-----------|
| BCTW      | classifier |
| RCTW      | classifier |
| SCTW      | classifier |
| LCTW      | classifier |
| NCTW      | classifier |
| BCDW      | doc2vec    |
| RCDW      | doc2vec    |
| SCDW      | doc2vec    |
| LCDW      | doc2vec    |
| NCDW      | doc2vec    |
| BCTU      | AU         |
| RCTU      | AU         |
| SCTU      | AU         |
| LCTU      | AU         |
| NCTU      | AU         |
| BCDU      | AU         |
| RCDU      | AU         |
| SCDU      | AU         |
| LCDU      | AU         |
| NCDU      | AU         |

### Version information

Personal device: macos catalina 10.15.2

Cartesius supercomputer asreview 0.7.2 asreview simulation branch
reorganization.

------------------------------------------------------------------------

Stage 1 - Classifiers
=====================

Comparing five different classifiers

R - 275 secs 119% - 5 datasets

    ## [1] 916.6667

1.1 Optimizing (hyper)parameters per model, per dataset (1-1)
-------------------------------------------------------------

    ## [1] "2020-03-17"

Optimization run on Cartesius

------------------------------------------------------------------------

    ## [1] "2020-03-18"

Store config files from job 7768402, SCTW model.

Transfer config files to my computer home directory

------------------------------------------------------------------------

    ## [1] "2020-03-19"

### simulations with nb

### extract simulation results nb

------------------------------------------------------------------------

    ## [1] "2020-03-22"

Sent hyperparameters for optimization

------------------------------------------------------------------------

    ## [1] "2020-03-23"

Checkout hyperopt SCTW Nudging dataset doesn’t optimize well?

### Checkout results first hyperopt

LCTW - no output? RCTW - only ‘current’

NCDW - loss still going down, sent in for another 12 hours.

Resimulate BCTW models. - create-config file from trials.pkl:
n\_instances 20, 1/1 - how to overrule this parameters? (not possible
through cli)

Optimize BCTW model 6 datasets (for paper)

------------------------------------------------------------------------

    ## [1] "2020-03-24"

Process BCTW models simulations into table - python script to extract
statistics

Create checklist table for simulations

Checkout what happened with NCDW and other errors in hpcbatch

Simulate SCTW models

Process SCTW models into table

Simulate LCTW, RCTW and NCTW models

Create a nice plot

Send first version of table

------------------------------------------------------------------------

| model | hyperopt | ace | nudging | ptsd | software | wilson |
|:------|:---------|:----|:--------|:-----|:---------|:-------|
| BCTW  | one      | ✅   | ✅       | ✅    | ✅        | ✅      |
| RCTW  | one      | ⌛   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCTW  | one      | ✅   | ❓       | ⏲    | ✅        | ✅      |
| LCTW  | one      | ⌛   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCTW  | one      | ❌   | ❌       | ❌    | ❌        | ❌      |
| BCDW  | one      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| RCDW  | one      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCDW  | one      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| LCDW  | one      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCDW  | one      | ⏲   | 🔳       | 🔳    | 🔳        | 🔳      |
| BCTW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| RCTW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCTW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| LCTW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCTW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| BCDW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| RCDW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCDW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| LCDW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCDW  | four     | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| BCTW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| RCTW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCTW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| LCTW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCTW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| BCDW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| RCDW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| SCDW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| LCDW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |
| NCDW  | all      | 🔳   | 🔳       | 🔳    | 🔳        | 🔳      |

Stage 2 - Feature extraction
----------------------------

Comparing tfidf with doc2vec

Stage 3 - Balance strategy
--------------------------

Redo all the analyses with a different balance strategy (aggressive
undersampling?) Probably won’t have time for this.

The data
========

On 17 march 2020:

    ************  ace.csv  ************

    Number of papers:            2235
    Number of inclusions:        41 (1.83%)
    Number of exclusions:        2194 (98.17%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        123
    Average abstract length:     1623
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)


    ************  nudging.csv  ************

    Number of papers:            1847
    Number of inclusions:        100 (5.41%)
    Number of exclusions:        1747 (94.59%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        109
    Average abstract length:     1831
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)


    ************  ptsd.csv  ************

    Number of papers:            5031
    Number of inclusions:        38 (0.76%)
    Number of exclusions:        4993 (99.24%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        104
    Average abstract length:     1537
    Number of missing titles:    1 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)


    ************  software.csv  ************

    Number of papers:            8896
    Number of inclusions:        104 (1.17%)
    Number of exclusions:        8792 (98.83%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        81
    Average abstract length:     896
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)


    ************  wilson.csv  ************

    Number of papers:            2333
    Number of inclusions:        23 (0.99%)
    Number of exclusions:        2310 (99.01%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        83
    Average abstract length:     1325
    Number of missing titles:    1 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
