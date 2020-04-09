Hyperparameter optimization log
================

``` r
knitr::opts_chunk$set(echo = FALSE)
library(knitr)
```

|      | ace | nudging | ptsd | software | virus | wilson |
| :--- | --: | ------: | ---: | -------: | ----: | -----: |
| BCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| RCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| SCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| LCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| NCTD |   9 |       9 |    9 |        9 |     9 |      9 |
| BCDD |   9 |       9 |    9 |        9 |     9 |      9 |
| RCDD |   1 |       1 |    1 |        1 |     1 |      2 |
| SCDD |   2 |       2 |    2 |        2 |     2 |      2 |
| LCDD |   2 |       2 |    2 |        2 |     2 |      2 |
| NCDD |   1 |       1 |    1 |        1 |     1 |      1 |

|      | ace | nudging | ptsd | software | virus | wilson |
| :--- | --: | ------: | ---: | -------: | ----: | -----: |
| BCTD |   1 |       1 |    1 |        1 |     1 |      1 |
| RCTD |   1 |       1 |    1 |        1 |     1 |      1 |
| SCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| LCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| NCTD |   1 |       1 |    1 |        1 |     1 |      1 |
| BCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| RCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| SCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| LCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| NCDD |   1 |       1 |    1 |        1 |     1 |      1 |

|      | ace | nudging | ptsd | software | virus | wilson |
| :--- | --: | ------: | ---: | -------: | ----: | -----: |
| BCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| RCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| SCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| LCTD |   2 |       2 |    2 |        2 |     2 |      2 |
| NCTD |   1 |       1 |    1 |        1 |     1 |      1 |
| BCDD |   9 |       9 |    9 |        9 |     9 |      9 |
| RCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| SCDD |   1 |       1 |    1 |        1 |     1 |      1 |
| LCDD |   2 |       2 |    2 |        2 |     2 |      2 |
| NCDD |   1 |       1 |    1 |        1 |     1 |      1 |

-----

# one on one optimization

## classifiers

BCTD on all datasets

The other 3 classifiers

## now with doc2vec feature extraction

    ## [1] ./cart_hyper_run.py hyper-active -t 12:00:00 -m nb -b double -e doc2vec -q max -d ace -r 23

# n

## doc2vec models

# n-1

-----

# Visual inspection 30-03-2020

## classifiers

  - svm
      - ace (3x) 3 times the time.
      - nudging 7x
      - ptsd 7x
      - software 3x (of 4)
      - virus 5x
      - wilson 3x
          - all 10x
  - rf
      - software 2x
      - all 3x
  - rest is fine, over 1000 runs and seems not to improve much.

Sent in around 13 pm (30.03.2020)

## doc2vec

  - nn-2-layer - try again with -r 11. (for all datasets still doesn’t
    work )

  - rf is done
    
      - ace 3x?
      - nudging 2x
      - ptsd 6x
      - software 10 x
      - virus 1.5 x
      - wilson 1x

# asreview create-config

# export config files

(from all files in output :) )

31.03.2020 \#\#\# all all SCDD, LCDD RCDD, resend for 5 days

    ##                                                                                          7854227 
    ##           "./cart_hyper_run.py hyper-active -t 42:00:00 -m rf -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854228 
    ##          "./cart_hyper_run.py hyper-active -t 42:00:00 -m svm -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854229 
    ##     "./cart_hyper_run.py hyper-active -t 42:00:00 -m logistic -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854230 
    ## "./cart_hyper_run.py hyper-active -t 5-00:00:00 -m nn-2-layer -b double -e doc2vec -q max -r 23"

try nn2 with tfidf -r 11

checkout nn 2 layer tfidf

### one

one LCDD, for 2x the time one SCDD for 1x the time

01.04 nn-2-layer retry r-1

03.04.2020

04.04.2020

05.05.2020

send in ‘one’ nn-2-layer models again (see above) send in ‘all’ for
nn-2-layer models.

06.05.2020

    ##           hyper
    ## data       one four all
    ##   ace        2    1   1
    ##   nudging    2    1   1
    ##   ptsd       2    1   1
    ##   software   2    1   1
    ##   virus      2    1   1
    ##   wilson     2    1   1
