Hyperparameter optimization log
================

Per day, all commands sent to surfsara After a command is sent, save
that todo checklist file\!

``` r
hpsets <- readRDS("../R/01_hyperparameter_sets.RDS")

d <- colnames(hpsets)
condition <- rownames(hpsets)
classifier <- c("nb", "rf", "svm", "logistic", "nn-2-layer")
names(classifier) <- c("B", "R", "S", "L", "N")
```

# one on one optimization

## classifiers

BCTD on all datasets

``` r
# BCTD
script <- noquote(sprintf("./cart_hyper_run.py hyper-active -t 12:00:00 -m nb -b double -e tfidf -q max -d %s -r 23", d))
write.table(script, file = "scripts/one/nb_classifier.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
# job names
names(script) <- c("7846991", "7846993", "7846994", "7846997", "7846998", "7846999")
```

``` r
# check off to do list. 
hpsets["NCTD", , ] <- 9 # impossible model
hpsets["BCTD", , "one"] <- 1 # finish nb one-one-one simulations
```

The other 3 classifiers

``` r
cons <- expand.grid(c = classifier[2:4], d = d, stringsAsFactors = FALSE)
# all models
class1 <- sprintf("./cart_hyper_run.py hyper-active -t 12:00:00 -m %s -b double -e tfidf -q max -d %s -r 23", cons$c, cons$d)
write.table(class1, file = "scripts/one/three_classifiers.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)

# job names
names(class1) <- c(7847065,7847066,7847067,7847068,7847069, 7847070, 7847071,7847072, 7847074,7847075, 7847076, 7847077,7847078,7847079,7847080,7847081, 7847082,7847084)

hpsets[condition[2:4], , "one"] <- 1
```

## now with doc2vec feature extraction

``` r
cons <- expand.grid(c = classifier[2:5], d = d, stringsAsFactors = FALSE)

# a test run first maybe
# NCDD
noquote("./cart_hyper_run.py hyper-active -t 12:00:00 -m nb -b double -e doc2vec -q max -d ace -r 23") # 7847109
```

    ## [1] ./cart_hyper_run.py hyper-active -t 12:00:00 -m nb -b double -e doc2vec -q max -d ace -r 23

``` r
# todo list
hpsets[condition[6], , ] <- 9 # multinomial nb cannot deal with doc2vec (negative values!!)
```

``` r
# then all classifier * dataset combinations. 
t <- rep(c("12", "42", "42", "5-00"), length(d))
d2v1 <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e doc2vec -q max -d %s -r 23", t, cons$c, cons$d)
# one test of doc2vec 
write.table(d2v1, file = "scripts/one/doc2vec.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(d2v1) <- c("7854137", "7854187", "7854188", "7854208", 
                 "7854189", "7854190", "7854191", "7854209", 
                 "7854192", "7854193", "7854194", "7854210", 
                 "7854195", "7854196", "7854197", "7854211", 
                 "7854198", "7854199", "7854200", "7854212", 
                 "7854201", "7854202", "7854203", "7854213")

hpsets[condition[7:10], ,"one"] <- 1
```

# n

``` r
t <- c("12:00:00", "24:00:00", "48:00:00", "24:00:00")
# optimize hyperparams over all datasets
allc <- sprintf("./cart_hyper_run.py hyper-active -t %s -m %s -b double -e tfidf -q max -r 23", t, classifier[1:4])
write.table(allc, file = "scripts/n/fourclassifiers.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)

# later for more than 12 hours. 
names(allc) <- c("7848203", "7848204", "7848205", "7848206")

hpsets[condition[1:4], , "all"] <- 1
```

## doc2vec models

``` r
t <- rep(c("42", "42", "42", "5-00"))
cons <- expand.grid(c = classifier[2:5], stringsAsFactors = FALSE)

d2vall <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e doc2vec -q max -r 23", t, cons$c)

write.table(d2vall, file = "scripts/n/doc2vec.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(d2vall) <- c("7854227",  "7854228", "7854229", "7854230")

hpsets[condition[7:10], ,"all"] <- 1
```

# n-1

-----

# Visual inspection 30-03-2020

## classifiers

``` bash
# script to show all lisa.err files to see if processes done yes/no
.catlisaerr.sh
```

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

<!-- end list -->

``` r
hpsets[condition[c(1,4)], , c("one", "all")] <- 2
hpsets[condition[c(2,3)],  d[c(1:2, 5:6)], "one"] <- 2
```

Sent in around 13 pm (30.03.2020)

``` r
# svm extra time 
cons <- expand.grid(c = classifier[3], stringsAsFactors = FALSE, d= d)
cons$t <- c("36", rep("84", 2), "48", "60", "36")
extrasvm1 <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e tfidf -q max -d %s -r 23", cons$t, cons$c, cons$d)
names(extrasvm1) <- c("7867379","7867380", "7867382", "7867383", "7867384", "7867387")

cons <- expand.grid(c=classifier[2], stringsAsFactors = FALSE, d=d[3:4])

cons$t <- c("06", "24")

extrarf1 <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e tfidf -q max -d %s -r 23", cons$t, cons$c, cons$d)
names(extrarf1) <- c("7867388", "7867389")

# later check rf - ptsd - one
hpsets[condition[2], d[3], "one"] <- 2

cons <- data.frame(c = classifier[2:3], t = c("5-00", "5-00"))
extraall <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e tfidf -q max -r 23", cons$t, cons$c)
names(extraall) <- c("7867412", "7873506")

# save scripts for reproducibility 
write.table(c(extrasvm1, extrarf1), file = "scripts/one/extratime_classifier.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
write.table(extraall, file = "scripts/n/extratime_classifier.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
```

## doc2vec

``` bash
# bash script to print all hyperopt results. 
./show.sh
```

  - nn-2-layer - try again with -r 11. (for all datasets still doesn’t
    work )

<!-- end list -->

``` r
# redo nn-2-layer with doc2vec. 
#./cart_hyper_run.py hyper-active -t 01:00:00 -m nn-2-layer -b double -e doc2vec -q max -d ace -r 11 7867616 test for an hour 
hpsets[condition[10], , "one"] <- 8 # error
cons <- expand.grid(c = classifier[5], stringsAsFactors = FALSE, d=d)
cons$t <- "5-00:00:00"
nn2dv1 <- sprintf("./cart_hyper_run.py hyper-active -t %s -m %s -b double -e doc2vec -q max -d %s -r 11", cons$t, cons$c, cons$d)
write.table(nn2dv1, file = "scripts/one/nn2d2v.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(nn2dv1) <- c("7872280", "7872281", "7872282", "7872283", "7872284", "7872285")
hpsets[condition[10], , "one"] <- 1 # sent in again
# this can be turnt of afer 52 hours. (thursday morning) 02.04

nn2d2vall <- c("./cart_hyper_run.py hyper-active -t 5-00:00:00 -m nn-2-layer -b double -e doc2vec -q max -r 4")
write.table(nn2d2vall, file = "scripts/n/nn2d2v.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(nn2d2vall) <- "7873511"
```

  - rf is done
      - ace 3x?
      - nudging 2x
      - ptsd 6x
      - software 10 x
      - virus 1.5 x
      - wilson 1x

<!-- end list -->

``` r
# redo random forest d2v
t <- rep(c("36", "24", "72", "5-00", "18", "12"))
x_d2v_rf <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m rf -b double -e doc2vec -q max -d %s -r 23", t, d)
# one test of doc2vec 
write.table(x_d2v_rf, file = "scripts/one/x_d3v_rf.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(x_d2v_rf) <- c("7867607", "7867608", "7867609", "7867610", "7867611", "7867612")
```

# asreview create-config

# export config files

(from all files in output :) )

``` r
d4 <- c(paste(d[1:5], collapse=","), 
        paste(d[2:6], collapse=","), 
        paste(d[c(3:6,1)], collapse = ","), 
        paste(d[c(4:6, 1:2)], collapse=","),
        paste(d[c(5:6, 1:3)], collapse = ","),
        paste(d[c(6, 1:4)], collapse = ","))
cons <- expand.grid(c = classifier, d = d4, f=c("tfidf", "doc2vec"), stringsAsFactors = FALSE)
cons <- cons[!(cons$c == "nb" & cons$f == "doc2vec"), ]
cons$r <- ifelse(cons$c == "nn-2-layer", "11", "23")
cons$t <- ifelse(cons$c == "nb", "12", "5-00")
# all models
n_1 <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e %s -q max -d %s -r %s", cons$t, cons$c, cons$f, cons$d, cons$r)
write.table(n_1, file = "scripts/n-1/all_models.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)

# job names
names(n_1) <- c("7873344", "7873345", "7873346", "7873347", "7873348",
                "7873360", "7873361", "7873363", "7873364", "7873365",
                "7873378", "7873379", "7873381", "7873382", "7873383",
                "7873392", "7873393", "7873394", "7873396",
                "7873396",
                "7873397", "7873398", "7873399", "7873400", "7873401",
                "7873407", "7873408", "7873409", "7873411", "7873413",
                "7873425", "7873427", "7873429", "7873431", "7873433",
                "7873446", "7873448", "7873450", "7873453", 
                "7873455",
                "7873460", "7873461", "7873462", "7873463",
                "7873464",
                "7873466", "7873467", "7873468", "7873469", "7873470", 
                "7873471", "7873472", "7873473", "7873474")
                
                
hpsets[c(1:5, 6:10),,"four"] <- 1
```

31.03.2020 \#\#\# all all SCDD, LCDD RCDD, resend for 5 days

``` r
# more time for doc2vec all datasets - svm + logistic 
d2vall
```

    ##                                                                                          7854227 
    ##           "./cart_hyper_run.py hyper-active -t 42:00:00 -m rf -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854228 
    ##          "./cart_hyper_run.py hyper-active -t 42:00:00 -m svm -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854229 
    ##     "./cart_hyper_run.py hyper-active -t 42:00:00 -m logistic -b double -e doc2vec -q max -r 23" 
    ##                                                                                          7854230 
    ## "./cart_hyper_run.py hyper-active -t 5-00:00:00 -m nn-2-layer -b double -e doc2vec -q max -r 23"

``` r
cons <- expand.grid(c = classifier[2:4], stringsAsFactors = FALSE)
d2vall_x <- sprintf("./cart_hyper_run.py hyper-active -t 5-00:00:00 -m %s -b double -e doc2vec -q max -r 23", cons$c)
write.table(d2vall_x, file = "scripts/n/d2v_all_x.txt", sep = "\t", quote = FALSE,
            row.names = FALSE)
names(d2vall_x) <- c("7873497", "7873499","7873500")
```

try nn2 with tfidf -r 11

checkout nn 2 layer tfidf

### one

one LCDD, for 2x the time one SCDD for 1x the time

``` r
cons <- expand.grid(c = classifier[3:4], d = d, stringsAsFactors = FALSE)
cons$t <- ifelse(cons$c=="logistic", "96", "48")
d2v1_x <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m %s -b double -e doc2vec -q max -d %s -r 23", cons$t, cons$c, cons$d)
write.table(d2v1_x, file = "scripts/one/d2vone_x.txt", sep="\t", quote = FALSE, row.names = FALSE)

names(d2v1_x) <- c("7877706", "7877707", "7877708", "7877709", "7877710",
                   "7877711", "7877712", "7877713", "7877714", "7877715", "7877716", 
                   "7877717")
```

``` r
hpsets[condition[2], d[4] , "one"] <- 2
```

01.04 nn-2-layer retry r-1

``` r
cons <- expand.grid(c = classifier[5], fe = c("tfidf", "doc2vec"), d = d, stringsAsFactors = FALSE)

nn_test <- sprintf("./cart_hyper_run_asrnn.py hyper-active -t 5-00:00:00 -m %s -b double -e %s -q max -d %s -r 2", cons$c, cons$fe, cons$d)
write.table(nn_test, file = "scripts/one/nn_test.txt", sep="\t", quote = FALSE, row.names = FALSE)

names(nn_test) <- c("7891389", "7891390", "7891391", "7891392", "7891393", "7891394", "7891395", "7891396", "7891402", "7891407", "7891408", "7891411")
# ./cart_hyper_run_asrnn.py hyper-active -t 55 -m nn-2-layer -b double -e doc2vec -q max -d wilson -r 2 # 7886988, 
#./cart_hyper_run.py hyper-active -t 55 -m nn-2-layer -b double -e doc2vec -q max -d ace -r 2 # 7883466
# ssh tcn560
# top 

# send again on fat nodes on 04.04
nn_test2 <- sprintf("./cart_hyper_run_asrnn.py hyper-active -t 5-00:00:00 -m %s -b double -e %s -q max -d %s -r 31", cons$c, cons$fe, cons$d)
write.table(nn_test2, file = "scripts/one/nn_test2.txt", sep="\t", quote = FALSE, row.names = FALSE)

names(nn_test2) <- c("7904508", "7904509", "7904510", "7904511", "7904512", "7904513", "7904514", "7904515", "7904516",
                    "7904518", "7904519", "7904520")
```

``` r
# cancel all logistic 4-1 sets 
#  7873347, 7873448, 7873460, 7873464, 7873469, 7873473
hpsets["LCTD", , "four"] <- 2
```

03.04.2020

``` r
# svm d2v one are done! 
hpsets["SCDD",, "one"] <- 2
```

``` r
# all - BCTD gets a few extra
hpsets["BCTD",, "all"] <- 1 # 7893274 (12 hours)
# all - LCTD is done
```

04.04.2020

``` r
# rf all is done 
hpsets["RCTD",,"all"] <- 2 
hpsets["BCTD",, "all"] <- 2 
```

05.05.2020

``` r
# all 
# LCDD 24 more hours
# ./cart_hyper_run.py hyper-active -t 24:00:00 -m logistic -b double -e doc2vec -q max -r 23 
# 7904435
```

send in ‘one’ nn-2-layer models again (see above) send in ‘all’ for
nn-2-layer models.

``` r
cons <- expand.grid(c = classifier[5], fe = c("tfidf", "doc2vec"), stringsAsFactors = FALSE)
nn_test_all <- sprintf("./cart_hyper_run_asrnn.py hyper-active -t 5-00:00:00 -m %s -b double -e %s -q max -r 31", cons$c, cons$fe)
write.table(nn_test_all, file = "scripts/n/nn_test_all.txt", sep="\t", quote = FALSE, row.names = FALSE)
names(nn_test_all) <- c("7904535", "7904536")

hpsets[condition[c(5,10)], , "all"] <- 1
```

06.05.2020

``` r
# SCTD optimization
hpsets[condition[3], c("ptsd", "software"), "one"] <- 2
hpsets[condition[3], , "all" ] <- 2
hpsets[condition[3], , "four"] <- 2

# RCDD 
hpsets[condition[7], "wilson","one"] <- 2 
# other sent for a bit more 
x_d2v_rf_3 <- sprintf("./cart_hyper_run.py hyper-active -t %s:00:00 -m rf -b double -e doc2vec -q max -d %s -r 23", rep("24",5), d[1:5])

write.table(x_d2v_rf_3, file = "scripts/one/d2v_rf_3.txt", sep="\t", quote = FALSE, row.names = FALSE)
```
