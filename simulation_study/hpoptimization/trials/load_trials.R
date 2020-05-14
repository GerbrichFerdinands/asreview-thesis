library(tidyverse)
# load data from trials.csv files and process into dataframe

# This is the storage location of the raw hyperparameter output onmy personal harddrive, the raw data will be published on the OSF when university buildings open again (see the readme file in the root directory).
losspath <- "/Volumes/Gerbrich/asreview/output/active/"

models <- list.files(losspath)
# get rid of neural network 2-layer models s
models <- models[c(-4, -5)]
mpaths <- paste0(losspath, models)

# add group (n-1, n, one) to dataset. 
addGroup <- function(data){
  one <- data$datasets %in% c("ace", "nudging", "ptsd", "software", "virus", "wilson")
  n <- data$datasets == "ptsd_virus_ace_software_wilson_nudging"
  n_1 <- !(one | n)
  
  data$group <- rep("0", length(one))
  
  data[one, "group"] <- "one"
  data[n, "group"] <- "n"
  data[n_1, "group"] <- "n-1"
  return(data)
}

# extract hyperparameter data from trials.csv files 
trialsdf <- function(files){
  tdf <- lapply(files, read_csv)
  tdf <- map(tdf, `[`, c("loss", "trial"))
  tdf <- tdf %>% map(~ mutate(.x, index = 1:nrow(.x)))
  
  tdf <- bind_rows(tdf, .id = "model")
  tdf <- separate(tdf, model, sep = "-", into = c("model", "datasets"))
  tdf <- addGroup(tdf)
  tdf$group <- as.factor(tdf$group)
  return(tdf)
}

# more readable names for differnet models 
names <- c("lr_d2v", "lr_tfidf", "nb_tfidf", "rf_d2v", "rf_tfidf", "svm_d2v", "svm_tfidf")

for(m in mpaths){
  conditions <- list.files(m)
  files <- paste0(m, "/",conditions, "/trials.csv")
  names(files) <- paste0(models[m==mpaths], "-", conditions)
  trials <- trialsdf(files)
  saveRDS(trials, file = paste0("simulation_study/hpoptimization/trials/", names[m==mpaths], "-trials.RDS"))
}

