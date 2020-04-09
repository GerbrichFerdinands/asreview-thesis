# script to load results from ini folder. 
library(ini)
library(tidyverse)
  
files <- list.files("simulation_study/hpoptimization/config/config")

gethps <- function(files){
  # Function extracting all hyperparametersets for a certain model in files. 
  for(f in files){
    ini <- read.ini(paste0("simulation_study/hpoptimization/config/config/", f))
    
    # first file creates a template 
    if (f == files[1]){
      res <- unlist(ini) 
      # add other files to the list 
    } else {
      res <- do.call(Map, list(c, res, unlist(ini)))
    }
  }
  # create a dataframe
  res <- as.data.frame(res)
  res <- res %>% select(!starts_with("global_settings"))
  rownames(res) <- substring(files, regexpr("-", files) + 1)
  res <- res %>% rownames_to_column("datasets")
  return(res)
}
# different models 

sctd <- files[str_detect(files, "svm") & str_detect(files, "tfidf")] %>%
  gethps()

scdd <- files[str_detect(files, "svm") & str_detect(files, "doc2vec")] %>%
  gethps() 

bctd <- files[str_detect(files, "nb") & str_detect(files, "tfidf")] %>%
  gethps() 
bctd <- bctd %>% mutate_at(vars(-datasets), function(x) as.numeric(as.character(x)))


lctd <- files[str_detect(files, "logistic") & str_detect(files, "tfidf")] %>%
  gethps() 
#lctd <- lctd %>% rownames_to_column("datasets")
lctd <- lctd %>% mutate_at(vars(-datasets), function(x) as.numeric(as.character(x)))

lcdd <- files[str_detect(files, "logistic") & str_detect(files, "doc2vec")] %>%
  gethps() 
lcdd <- lcdd %>% mutate_at(vars(-datasets), function(x) as.numeric(as.character(x)))


rctd <- files[str_detect(files, "rf") & str_detect(files, "tfidf")] %>%
  gethps() 
rctd <- rctd %>% mutate_at(vars(-datasets), function(x) as.numeric(as.character(x)))

rcdd <- files[str_detect(files, "rf") & str_detect(files, "doc2vec")] %>%
  gethps() 
rcdd <- rcdd %>% mutate_at(vars(-datasets), function(x) as.numeric(as.character(x)))


########
library(ggplot2)
library(gridExtra)
# analyze results 

addGroup <- function(data){
  one <- data$datasets %in% c("ace.ini", "nudging.ini", "ptsd.ini", "software.ini", "virus.ini", "wilson.ini")
  n <- data$datasets == "ptsd_virus_ace_software_wilson_nudging.ini"
  n_1 <- !(one | n)
  
  data$group <- rep("0", length(one))
  
  data[one, "group"] <- "one"
  data[n, "group"] <- "n"
  data[n_1, "group"] <- "n-1"
  return(data)
}

#params <- names(lctd)[-1]
#plots <- vector("list")
#names(plots) <- params

#lctd <- addGroup(lctd)

boundaries <- readRDS("simulation_study/hpoptimization/config/boundaries.RDS")

prepData <- function(data){
  data <- addGroup(data)
  c <- c(2, ncol(data)-1)
  data <- pivot_longer(data, cols = c[1]:c[2], names_to = "param")
  data <- left_join(data, boundaries)
  return(data)
}

php <- function(data){
  data %>%
    ggplot(aes(x = value, y = "", color = group)) +
    geom_jitter(height = 0.2) +
    facet_wrap(vars(param), nrow = 8, scales = "free_x") +
    geom_vline(aes(xintercept = lb), color = "grey") +
    geom_vline(aes(xintercept = ub), color = "grey") 
}

# compute variance of hyperparameters 
paramstats <- function(data){
  data %>% 
    group_by(param, group) %>%
    summarise(variance = var(value), 
              sd = sd(value),
              mean = mean(value),
              median = median(value))
}


## plot for lctd 
lctd <- prepData(lctd)

# lcdd 
lcdd <- prepData(lcdd)

# bctd
#bctd <- prepData(bctd)

# rctd
rctd <- prepData(rctd)

# rcdd 
rcdd <- prepData(rcdd)

# sctd

# scdd

# inspect 


# put al results in a list 
hps <- list(svm_tfidf = sctd, svm_d2v = scdd,
            nb_tfidf = bctd, 
            lr_tfidf = lctd, 
            lr_d2v = lcdd, 
            rf_tfidf = rctd, 
            rf_d2v = rcdd, all.names = TRUE)

saveRDS(hps, file = "simulation_study/hpoptimization/config/hpresults.RDS")
