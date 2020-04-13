# load data from trials.csv files and process into dataframe
losspath <- "/Volumes/Gerbrich/asreview/output/active/"
models <- list.files(losspath)
mpaths <- paste0(losspath, models)
conditions <- list.files(mpaths[1])
paste0(mpaths, "/",conditions, "/trials.csv")


for(m in mpaths) {
  
}

test <- do.call(read_csv, file = paste0(mpaths, "/",conditions, "/trials.csv"))

# get loss column, get model name column, condition column

# save losses
saveRDS(test, file = "simulation_study/hpoptimization/trials/trials.RDS")