Untitled
================

Script for reading simulation files

Script for reading results

Parse

Apply over all datasets and models

    ## # A tibble: 42 x 9
    ## # Groups:   dataset [6]
    ##    dataset  wss.95 wss.99 wss.100 rrf.5 rrf.10 rrf.20  loss model       
    ##    <chr>     <dbl>  <dbl>   <dbl> <dbl>  <dbl>  <dbl> <dbl> <chr>       
    ##  1 software   92.0   94.0    81.0  99.0   99.3  100    1.37 SVM + D2V   
    ##  2 software   91.7   93.1    83.6  97.9   99.0  100    1.37 LR + D2V    
    ##  3 software   92.0   91.8    86.4  96.2   99.0  100    1.39 LR + TF-IDF 
    ##  4 software   92.3   88.6    83.1  96.2   98.2  100    1.45 NB + TF-IDF 
    ##  5 software   91.0   90.1    77.6  97.0   99.2   99.9  1.61 RF + D2V    
    ##  6 ptsd       91.7   89.6    89.6  97.3   99.8  100    1.74 LR + TF-IDF 
    ##  7 ptsd       91.7   89.6    89.3  97.3   99.6  100    1.78 NB + TF-IDF 
    ##  8 ptsd       90.1   88.3    87.3  95.0   98.6  100    1.92 LR + D2V    
    ##  9 software   92.0   91.0    46.0  97.2   99.0   99.0  1.94 SVM + TF-IDF
    ## 10 software   90.5   89.1    64.6  96.6   99.0   99.1  2.05 RF + TF-IDF 
    ## # … with 32 more rows

Create table

    ## 
    ## Attaching package: 'expss'

    ## The following object is masked from 'package:flextable':
    ## 
    ##     set_caption

    ## The following objects are masked from 'package:stringr':
    ## 
    ##     fixed, regex

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, compute, contains, first, last, na_if, recode, vars

    ## The following objects are masked from 'package:purrr':
    ## 
    ##     keep, modify, modify_if, transpose, when

    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     contains, nest

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     vars

    ## # A tibble: 7 x 13
    ##   model wss.95_ace wss.95_nudging wss.95_ptsd wss.95_software wss.95_virus
    ##   <chr>      <dbl>          <dbl>       <dbl>           <dbl>        <dbl>
    ## 1 NB +…       82.9           71.7        91.7            92.3         71.2
    ## 2 LR +…       77.4           71.6        90.1            91.7         70.4
    ## 3 LR +…       81.1           66.9        91.7            92.0         70.3
    ## 4 RF +…       68.6           66.3        88.2            91.0         67.2
    ## 5 RF +…       71.3           64.9        84.5            90.5         63.9
    ## 6 SVM …       78.3           70.9        90.6            92.0         70.7
    ## 7 SVM …       75.8           66.2        91.0            92.0         69.7
    ## # … with 7 more variables: wss.95_wilson <dbl>, loss_ace <dbl>,
    ## #   loss_nudging <dbl>, loss_ptsd <dbl>, loss_software <dbl>, loss_virus <dbl>,
    ## #   loss_wilson <dbl>

    ## $`95`
    ## [1] 91.69509
    ## 
    ## $`100`
    ## [1] 89.65997

Now again for with seed
