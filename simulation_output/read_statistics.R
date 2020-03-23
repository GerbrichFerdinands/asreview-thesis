# 03_
library(rjson)

# load datasets
D <- readRDS("simulation/00_datasets.RDS")
conditiongrid <- readRDS("simulation/00_conditiongrid.RDS")

# list for hyperopt condition one 
one <- vector('list', length(D))
names(one) <- D

# fill dataset elements with conditions 

# load results
result <- fromJSON(file = "simulation_output/statistics/testoutput.json")
