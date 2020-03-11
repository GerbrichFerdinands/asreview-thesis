conditiongrid <- readRDS("manuscript/drafts/simulation/00_conditiongrid.RDS")

# datasets (5)
D <- c("ace", "nudging", "ptsd", "software", "wilson")

conditiongrid %>% add_column(ace = 0L,
                             nudging = 0L,
                             ptsd = 0L,
                             software = 0L,
                             wilson = 0L)

# optimize hyperparameters (11 sets (1+2*5)) 
opt <- c("all", "four", "one")

# 300 sets of hyperparameters
expand.grid(conditiongrid$condition, D, opt)

# pick hyperparameter sets for every model 


# simulate 

conditiongrid

conditiongrid$pathString <- paste("tree", 
                                  conditiongrid$condition,)