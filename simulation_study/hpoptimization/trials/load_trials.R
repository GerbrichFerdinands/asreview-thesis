# load data from trials.csv files and process into dataframe
losspath <- "/Volumes/Gerbrich/asreview/output/active/"
models <- list.files(losspath)
mpaths <- paste0(losspath, models)
conditions <- list.files(mpaths[3])

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

files <- paste0(mpaths[3], "/",conditions, "/trials.csv")
names(files) <- paste0(models[3], "-", conditions)
nb_tfidf <- trialsdf(files)


saveRDS(nb_tfidf, file = "simulation_study/hpoptimization/trials/nb_tfidf_trials.RDS")



files <- paste0(mpaths[5], "/",conditions, "/trials.csv")
names(files) <- paste0(models[5], "-", conditions)
rf_d2v <- trialsdf(files)
saveRDS(rf_d2v, file = "simulation_study/hpoptimization/trials/rf_d2v_trials.RDS")


# get loss column, get model name column, condition column

# save losses
