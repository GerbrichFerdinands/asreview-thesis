Dataset preprocessing
================

This notebook processes all systematic review datasets into datasets
suitable testing ASReview.

Every dataset is a .csv file with the following columns: - title -
abstract - label\_included - keywords? (only for hyperparameter
optimization, not for simulation).

Entries with missing abstracts are removed

### Set-up

## ACE

``` r
ace <- template
# paper ------------------------------------------------------------------------
ace["paper", ] <- c(2544, NA, round(2544*0.0160)) 

# raw --------------------------------------------------------------------------
# original paper not to linked directly. cannot be retrieved? 
# checked dataset online by cohen et al. 
#https://dmice.ohsu.edu/cohenaa/systematic-drug-class-review-data.html
ace["raw", ] <- c(2544, NA, 41)

# asreview ---------------------------------------------------------------------
ace_asr <- read.csv("https://raw.github.com/asreview/systematic-review-datasets/master/datasets/Cohen_EBM/output/ACEInhibitors.csv",
                     header=T)
# replace empty abstracts by NA values. 

ace_asr[ace_asr$abstract == "", "abstract"] <- NA
# stats on missingness in this data
drops["ace",] <- ace_asr %>%
           summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    na_rate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    dup_rate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)

ace["asreview", ] <- c(nrow(ace_asr),
                       NA,
                       sum(ace_asr$label_included))
```

### Create test dataset

``` r
# drop missings and duplicates. 
ace_test <- ace_asr %>%
  drop_na(abstract) %>% # drop entries with missing abstracts
  distinct(abstract, .keep_all = TRUE) # remove entries with duplicate abstracts

# data on 
ace["test", ] <- c(nrow(ace_test),
                   NA,
                   sum(ace_test$label_included))
```

### Some statistics

``` r
# missingness and duplicates in raw data on ASReview
drops["ace",]
```

    ##        n  na   narate dup duprate
    ## ace 2544 309 12.14623   0       0

``` r
ace
```

    ##          search ftext incl
    ## paper      2544    NA   41
    ## raw        2544    NA   41
    ## asreview   2544    NA   41
    ## test       2235    NA   41

## nudging dataset

``` r
# by Rosanna Nagtegaal
nudging <- template
nudging["paper", ] <- c(2006, 377, 100) 
```

``` r
# data is not public yet

# raw --------------------------------------------------------------------------
n_raw <- read.csv("../../scripting/nagtegaal_preprocessing/data/output/nagtegaal.csv")

# missing statistics 
drops["nudging",] <- n_raw %>%
          summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    na_rate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    dup_rate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)
# asreview ---------------------------------------------------------------------

# remove missing abstracts 
nudging_test <- n_raw %>%
  drop_na(abstract) %>% # drop entries with missing abstracts
  filter(abstract != "", abstract != "NA") %>%
  distinct(abstract, .keep_all = TRUE) # remove entries with duplicate abstracts

nudging["test", ] <- data_descr(nudging_test)
```

### Create test dataset

### Some statistics

``` r
drops["nudging",]
```

    ##            n  na  narate dup   duprate
    ## nudging 2019 169 8.37048   3 0.1485884

``` r
nudging
```

    ##          search ftext incl
    ## paper      2006   377  100
    ## raw           0     0    0
    ## asreview      0     0    0
    ## test       1847   382  100

## PTSD dataset

``` r
ptsd <- template 
ptsd["paper", ] <- c(6185, 363, 38) # from flowchart 

# raw --------------------------------------------------------------------------
ptsd["raw", ] 
```

    ##     search ftext incl
    ## raw      0     0    0

``` r
# asreview ---------------------------------------------------------------------
ptsd_asr <- read.csv("https://raw.github.com/asreview/systematic-review-datasets/master/datasets/Van_de_Schoot_PTSD/output/PTSD_VandeSchoot_18.csv", 
                     header=T)

ptsd["asreview", ] <- data_descr(ptsd_asr)

# statistics on duplicates from asr data to test
drops["ptsd", ] <- ptsd_asr %>%
  summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    narate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    duprate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)
```

### Create test dataset

Now, remove duplicate entries and empty abstracts to arrive at test set.

``` r
ptsd_test <- ptsd_asr %>%
  drop_na(abstract) %>% # drop entries with missing abstracts
  filter(abstract != "", abstract != "NA") %>%
  distinct(abstract, .keep_all = TRUE)# remove entries with duplicate abstracts
```

There are 38 inclusions in this dataset, should be 34.

``` r
# get rid of 4 extra inclusions (see log book)
excl <- 
  ptsd_test %>%
  filter(included == 1, 
         str_detect(authors, "Sterling, M., Hendrikz, J., Kenardy, J.") |
         str_detect(authors, "Hou") |
         str_detect(authors, "Mason") |
         str_detect(authors, "Pérez")) %>%
  select(id)

indices <- ptsd_test$id %in% excl

# get rid of 4 papers
ptsd_test[indices, "included"] <- 0
```

``` r
# finalize dataset  
ptsd_test <- ptsd_test %>%
  select(authors, title, abstract, keywords, included, inclusion_code) # select relevant columns

ptsd["test", ] <- data_descr(ptsd_test)
```

Derive statistics in final test set.

``` r
drops["ptsd", ]
```

    ##         n na narate dup  duprate
    ## ptsd 5782  0      0 750 12.97129

``` r
ptsd
```

    ##          search ftext incl
    ## paper      6185   363   38
    ## raw           0     0    0
    ## asreview   5782   356   38
    ## test       5031   328   38

## software dataset

``` r
hall <- template

# paper ------------------------------------------------------------------------
hall["paper", ] <- c(8911, NA, 104)

# raw --------------------------------------------------------------------------
h_raw <- read.csv("https://zenodo.org/record/1162952/files/Hall.csv",
                  header=T)

hall["raw", ] <- c(length(h_raw$Document.Title),
                   NA,
                   sum(h_raw$label == "yes"))
                          
# asreview ---------------------------------------------------------------------
hall_asr <- read.csv("https://raw.github.com/asreview/systematic-review-datasets/master/datasets/Four%20Software%20Engineer%20Data%20Sets/Software%20Engineering%201%20Hall.csv",
                     header=T)

hall["asreview", ] <- data_descr(hall_asr)
```

### Creating test dataset

``` r
hall_test <- hall_asr %>%
   drop_na(abstract) %>% # drop entries with missing abstracts
   filter(abstract != "") %>%
   distinct(abstract, .keep_all = TRUE)# remove entries with duplicate abstracts

hall["test", ] <- data_descr(hall_test)
```

### Statistics

``` r
drops["software", ] <- 
  hall_asr %>%
  summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    narate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    duprate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)

hall
```

    ##          search ftext incl
    ## paper      8911    NA  104
    ## raw        8911    NA  104
    ## asreview   8911    NA  104
    ## test       8896    NA  104

## Virus dataset

``` r
virus <- template
virus["paper",] <- c(2481, 132, 120)
v_raw <- read.csv("../../sims/data/virus.csv")
v_raw$abstract[v_raw$abstract == ""] <- NA

virus["raw", ] <- data_descr(v_raw)

drops["virus", ] <- 
  v_raw %>%
  summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    narate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    duprate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)

v_test <- v_raw %>%
  drop_na(abstract) %>% # drop entries with missing abstracts
   filter(abstract != "") %>%
   distinct(abstract, .keep_all = TRUE)# remove entries with duplicate abstracts

virus["test",] <- data_descr(v_test)
```

## Wilson dataset

``` r
wilson <- template
# paper ------------------------------------------------------------------------
wilson["paper", ] <- c(3453, 174, 26)

# raw --------------------------------------------------------------------------
# w_ftext <- read.delim("../datasets/raw/DOKU_All FT-Screening_20200116_cap.txt")
# w_incl <- read.csv("../datasets/raw/DOKU_All Included_20200116_cap.csv")
# w_all <- read.csv("../datasets/raw/DOKU_All TiAb-Screening_20200116_cap.csv")
# wilson["raw", ] <- c(nrow(w_all), nrow(w_ftext), nrow(w_incl))
wilson["raw", ] <- c(3453, 174, 26) # looked it up

# asreview ---------------------------------------------------------------------
w_asr <- read.csv("https://raw.github.com/asreview/systematic-review-datasets/master/datasets/Appenzeller-Herzog_Wilson/output/output_csv_wilson.csv", header=T)

w_asr[w_asr$abstract == "", "abstract"] <- NA
drops["wilson", ] <- w_asr %>%
   summarise(n = length(abstract),
                    na = sum(is.na(abstract)),
                    narate = sum(is.na(abstract))/length(abstract)*100,
                    dup = sum(duplicated(abstract, incomparables = NA)),
                    duprate = sum(duplicated(abstract, incomparables = NA))/length(abstract)*100)
# add inclusion_code label 
w_asr$inclusion_code <- w_asr$label_abstract_screening + w_asr$label_included
w_asr$included <- w_asr$label_included
wilson["asreview", ] <- data_descr(w_asr)
```

``` r
# create test dataset
w_test <- w_asr %>%
  drop_na(abstract) %>% # drop entries with missing abstracts
  distinct(abstract, .keep_all = TRUE) # remove entries with duplicate abstracts

wilson["test",] <- data_descr(w_test)
```

Statistics

``` r
drops["wilson",]
```

    ##           n   na  narate dup  duprate
    ## wilson 3437 1090 31.7137  14 0.407332

``` r
wilson
```

    ##          search ftext incl
    ## paper      3453   174   26
    ## raw        3453   174   26
    ## asreview   3437   174   26
    ## test       2333   155   23

# Save descriptive statistics on all datasets

``` r
# put everything together in list. 
all <- list(ace = ace,
            nudging = nudging,
            ptsd = ptsd,
            software = hall,
            wilson = wilson)

# save datafile, to serve as data for descriptive table in manuscript
saveRDS(all, file = "data_statistics/all.RDS")

saveRDS(drops, file = "data_statistics/drops.RDS")
```

# Statistics

All candidate papers, paper selected for full text screening, papers
included in final review and inclusion rate, over various versions of
the dataset.

    ## Warning in kable_markdown(x = structure(c("Dataset", "candidates_paper", : The
    ## table should have a header (column names)

    ## Warning in kable_styling(., full_width = TRUE): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "Paper", 2, 5): Please specify format in kable.
    ## kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "Raw data", 6, 9): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "ASReview data", 10, 13): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

    ## Warning in pack_rows(., "Test data set", 14, 17): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

|                   |      |         |      |          |        |
| :---------------- | :--- | :------ | :--- | :------- | :----- |
| Dataset           | ace  | nudging | ptsd | software | wilson |
| candidates\_paper | 2544 | 2006    | 6185 | 8911     | 3453   |
| fulltext\_paper   | NA   | 377     | 363  | NA       | 174    |
| incl\_paper       | 41   | 100     | 38   | 104      | 26     |
| inclrate\_paper   | 1.61 | 4.99    | 0.61 | 1.17     | 0.75   |
| candidates\_raw   | 2544 | 0       | 0    | 8911     | 3453   |
| fulltext\_raw     | NA   | 0       | 0    | NA       | 174    |
| incl\_raw         | 41   | 0       | 0    | 104      | 26     |
| inclrate\_raw     | 1.61 | NA      | NA   | 1.17     | 0.75   |
| candidates\_asr   | 2544 | 0       | 5782 | 8911     | 3437   |
| fulltext\_asr     | NA   | 0       | 356  | NA       | 174    |
| incl\_asr         | 41   | 0       | 38   | 104      | 26     |
| inclrate\_asr     | 1.61 | NA      | 0.66 | 1.17     | 0.76   |
| candidates\_test  | 2235 | 1847    | 5031 | 8896     | 2333   |
| fulltext\_test    | NA   | 382     | 328  | NA       | 155    |
| incl\_test        | 41   | 100     | 38   | 104      | 23     |
| inclrate\_test    | 1.83 | 5.41    | 0.76 | 1.17     | 0.99   |

Descriptives on missingness and duplicate abstracts in the ASReview test
data set.

    ## Warning in kable_styling(., full_width = TRUE): Please specify format in
    ## kable. kableExtra can customize either HTML or LaTeX outputs. See https://
    ## haozhu233.github.io/kableExtra/ for details.

|          |    n |   NA | NA rate (%) | duplicates | duplicate rate (%) |
| :------- | ---: | ---: | ----------: | ---------: | -----------------: |
| ace      | 2544 |  309 |       12.15 |          0 |               0.00 |
| nudging  | 2019 |  169 |        8.37 |          3 |               0.15 |
| ptsd     | 5782 |    0 |        0.00 |        750 |              12.97 |
| software | 8911 |    0 |        0.00 |         15 |               0.17 |
| virus    | 2481 |  176 |        7.09 |          1 |               0.04 |
| wilson   | 3437 | 1090 |       31.71 |         14 |               0.41 |

# Write all test dataset files

``` r
# ace
write.csv(ace_test %>%  select(authors, title, abstract, keywords, label_included), "test_datasets/ace.csv")

# nudging (no keywords available)
write.csv(nudging_test %>% select(title, abstract, included), "test_datasets/nudging.csv")

# ptsd
write.csv(ptsd_test %>% select(authors, title, abstract, keywords, included), "test_datasets/ptsd.csv")

# hall (no keywords available )
write.csv(hall_test, "test_datasets/software.csv")

# virus 
write.csv(v_test %>% select(authors, title, abstract, keywords, included), "test_datasets/virus.csv")

# wilson
write.csv(w_test %>% select(authors, title, abstract, keywords, included), "test_datasets/wilson.csv")
```

# write test dataset files for simulation (removing keywords)

``` r
# ace
write.csv(ace_test %>%  select(authors, title, abstract, label_included), "sim_datasets/ace.csv")
# nudging (no keywords available)
write.csv(nudging_test %>% select(title, abstract, included), "sim_datasets/nudging.csv")
# ptsd
write.csv(ptsd_test %>% select(authors, title, abstract, included), "sim_datasets/ptsd.csv")
# hall (no keywords available )
write.csv(hall_test, "sim_datasets/software.csv")
# virus 
write.csv(v_test %>% select(authors, title, abstract, included), "sim_datasets/virus.csv")
# wilson
write.csv(w_test %>% select(authors, title, abstract, included), "sim_datasets/wilson.csv")
```

To check:

``` bash
asreview stat test_datasets/*
```

returns

    ************  ace.csv  ************
    
    Number of papers:            2235
    Number of inclusions:        41 (1.83%)
    Number of exclusions:        2194 (98.17%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        123
    Average abstract length:     1623
    Average number of keywords:  15.0
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
    
    
    ************  nudging.csv  ************
    
    Number of papers:            1847
    Number of inclusions:        100 (5.41%)
    Number of exclusions:        1747 (94.59%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        109
    Average abstract length:     1831
    Average number of keywords:  None
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
    
    
    ************  ptsd.csv  ************
    
    Number of papers:            5031
    Number of inclusions:        38 (0.76%)
    Number of exclusions:        4993 (99.24%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        104
    Average abstract length:     1537
    Average number of keywords:  9.9
    Number of missing titles:    1 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
    
    
    ************  software.csv  ************
    
    Number of papers:            8896
    Number of inclusions:        104 (1.17%)
    Number of exclusions:        8792 (98.83%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        81
    Average abstract length:     896
    Average number of keywords:  None
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
    
    
    ************  virus.csv  ************
    
    Number of papers:            2304
    Number of inclusions:        114 (4.95%)
    Number of exclusions:        2190 (95.05%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        103
    Average abstract length:     1345
    Average number of keywords:  20.3
    Number of missing titles:    0 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
    
    
    ************  wilson.csv  ************
    
    Number of papers:            2333
    Number of inclusions:        23 (0.99%)
    Number of exclusions:        2310 (99.01%)
    Number of unlabeled:         0 (0.00%)
    Average title length:        83
    Average abstract length:     1325
    Average number of keywords:  31.3
    Number of missing titles:    1 (of which 0 included)
    Number of missing abstracts: 0 (of which 0 included)
