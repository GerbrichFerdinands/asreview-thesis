Simulations log
================

# create config files

#### 01.04.2020

``` bash
# get config files from surfsara to hard drive 
scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/config /Volumes/Gerbrich/asreview/config/optimization_output
```

Manually update config files to simulation Push finished ones to GH
repository Fetch github repo on surfsara

``` r
sims[condition[c(1,2,4)], d, "one"] <- 1 # simulation configs are up
```

# Run simulations

## hp = one

#### BCTD

``` r
bctd <- createLines(condition[1], d=d, hp = "one")
```

    ## Joining, by = "c"

    ## Warning: Column `c` joining character vector and factor, coercing into character
    ## vector

``` r
write.table(bctd, file = "scripts/one/bctd.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(bctd) <- c("7883184", "7883202", "7883207", "7883209", "7883213", "7883214")
```

#### RCTD, LCTD

``` r
rctd_lctd <- createLines(condition[c(2,4)], d=d, hp = "one")
```

    ## Joining, by = "c"

    ## Warning: Column `c` joining character vector and factor, coercing into character
    ## vector

``` r
write.table(rctd_lctd, file = "scripts/one/rctd_lctd.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
#one_rctd_virus etc 
names(rctd_lctd) <- c(rep("0", 6), "7949940", "7949952", "7949953", "7949954", "7949956", "7949959")
```

``` r
sims[condition[c(1,2,4)], d, "one"] <- 2 # simulations are running 
```

# transfer simulation files to harddrive

``` bash
scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/config /Volumes/Gerbrich/asreview/config/optimization_output

./cart_simulate.py simdata/wilson.csv --config_file simconfig/one/LCTD/logistic_max_double_tfidf-wilson.ini --state_file simoutput/one/LCTD/wilson/results.h5 -r 15
```

``` r
transfer("one", condition[c(1,2,4)])
```

    ## [1] "scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/simoutput/one/BCTD /Volumes/Gerbrich/asreview/simoutput/one/BCTD"
    ## [2] "scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/simoutput/one/RCTD /Volumes/Gerbrich/asreview/simoutput/one/RCTD"
    ## [3] "scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/simoutput/one/LCTD /Volumes/Gerbrich/asreview/simoutput/one/LCTD"

``` r
# output is on harddrive
sims[condition[1], , "one"] <- 3
```

#### 02.04.2020

get config files ‘all’ BCTD, LCTD.

scp -r
<gerbrich@cartesius.surfsara.nl>:asreview/simulations/automated-systematic-review-simulations/scripts/config
/Volumes/Gerbrich/asreview/config/optimization\_output

``` r
# output is on harddrive
sims[condition[2], , "one"] <- 3
```

#### 03.04.2020

SCDD model

``` r
# get config files
# manually transform
# push to github 
sims[condition[8], d, "one"] <- 1 # simulation configs are up

# run simulations 
scdd <- createLines(condition[8], d, "one")
```

    ## Joining, by = "c"

    ## Warning: Column `c` joining character vector and factor, coercing into character
    ## vector

``` r
write.table(scdd, file = "scripts/one/scdd.txt", sep = "\t", quote = FALSE,
           row.names = FALSE)
 names(scdd) <- c("7950186", "7950187", "7950188", "7950189", "7950190", "7950191")
 sims[condition[8], d, "one"] <- 2 # simulations are running 
```

``` r
# sctd <- createLines(condition[3], d, "one")
# write.table(sctd, file = "scripts/one/sctd.txt", sep = "\t", quote = FALSE,
#             row.names = FALSE)
# names(sctd) <- c("7945897", "7945899", "7945902", "7945903", "7945910", "7945912")
# sims[condition[3], d, "one"] <- 2 # simulations are running 
# 
# rcdd <- createLines(condition[7], d, "one")
# write.table(rcdd, file = "scripts/one/rcdd.txt", sep = "\t", quote = FALSE,
#             row.names = FALSE)
# names(rctd) <- c("")
# sims[condition[7], d, "one"] <- 2 # simulations are running 
# 
# lcdd <- createLines(condition[8], d, "one")
```

10.04.2020

``` r
# LCTD and SCDD both failedsimulations both failed? 

# ran again 
# transfer to harddrive
transfer("one", condition[4])
```

    ## [1] "scp -r gerbrich@cartesius.surfsara.nl:asreview/simulations/automated-systematic-review-simulations/scripts/simoutput/one/LCTD /Volumes/Gerbrich/asreview/simoutput/one/LCTD"

``` r
#sims[condition[4], , "one"] <- 3 # output is on harddrive
```

Repeat all failed simulations

``` r
# run again 
# transfer to harddrive 
# transfer("one", condition[8])
#sims[condition[8], , "one"] <- 3 # output is on harddrive
```

### all

``` r
# manually transform
# push to github 
sims[condition[4], , "all"] <- 1 # configs are on github 
```

``` r
# run simulations 
# lctd_n <- createLines(condition[4], d, "all")
# write.table(lctd_n, file = "scripts/n/lctd_n.txt", sep = "\t", quote = FALSE,
#             row.names = FALSE)
# names(lctd_n) <- c()
# #sims[condition[4], d, "all"] <- 2 # simulations are running 
# 
# # transfer to harddrive 
# transfer("n", condition[4])
#sims[condition[8], , "one"] <- 3 # output is on harddrive
```

-----

``` r
# get config files
# manually transform
# push to github 
sims[condition[1], d, "one"] <- 1 # simulation configs are up
# run simulations 
createLines()
sims[condition[1], d, "one"] <- 2 # simulations are running 
# transfer to harddrive 
transfer()
sims[condition[1], , "one"] <- 3 # output is on harddrive
```
