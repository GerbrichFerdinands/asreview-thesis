# this script is for checking all the raw vs preprocessed data, that are on datasets GH repo. 
library(tidyverse)
template <- data.frame(search = rep(0,3),
                       ftext = rep(0, 3), 
                       incl = rep(0,3),
                       row.names = c("paper", "raw", "asreview"))

################################################################################
## Nagtegaal dataset ###########################################################
################################################################################ 
# original ---------------------------------------------------------------------
nagtegaal <- data.frame(paper = c(2006, 377, 100), 
                        raw = rep(0, 3), 
                        asreview = rep(0,3),
                        row.names = c("search", "ftext", "incl"))
nagtegaal <- t(nagtegaal)

# raw --------------------------------------------------------------------------
# see nagtegaal.R file
# asreview ---------------------------------------------------------------------
abstracts <- readxl::read_xlsx("data/nagtegaal.xlsx")
table(abstracts$included)
# duplicated abstracts ?? 
anyDuplicated(abstracts$abstract)
abstracts[duplicated(abstracts$abstract),]

nagtegaal["asreview",] <- c(length(abstracts$included),
                            NA,
                            sum(abstracts$included)
                            )

################################################################################
## Wilson dataset ##############################################################
################################################################################
wilson <- template
wilson["paper", ] <- c(3453, 174, 26)

# raw --------------------------------------------------------------------------
w_ftext <- read.csv("../datasets/raw/DOKU_All FT-Screening_20200116_cap.csv")
w_incl <- read.csv("../datasets/raw/DOKU_All Included_20200116_cap.csv")
w_all <- read.csv("../datasets/raw/DOKU_All TiAb-Screening_20200116_cap.csv")
wilson["raw", ] <- c(nrow(w_all), nrow(w_ftext), nrow(w_incl))

# asreview ---------------------------------------------------------------------
w_asr <- read.csv("https://raw.github.com/asreview/systematic-review-datasets/master/datasets/Appenzeller-Herzog_Wilson/output/output_csv_wilson.csv",
                  header=T)

wilson ["asreview",] <- c(nrow(w_asr), 
                          sum(w_asr$label_abstract_screening, na.rm = TRUE),
                          sum(w_asr$label_included))
wilson
# difference in asreview and raw data is because of 16 duplicates. 
wilson[2,1] - wilson[3,1]

################################################################################
## PTSD dataset ################################################################
################################################################################
ptsd <- template 
ptsd["paper", ] <- c(6185, 363, 34) # from flowchart 

# raw --------------------------------------------------------------------------
ptsd["raw", ] 

# asreview ---------------------------------------------------------------------
ptsd_asr <- read.csv(file = "../hyperoutput/data/ptsd.csv")
ptsd["asreview", ] <- c(length(ptsd_asr$included),
                        sum(ptsd_asr$aas_included),
                        sum(ptsd_asr$included))

################################################################################
## hall dataset ################################################################
################################################################################
hall <- template
hall["paper", ] <- c(2073, 311+80+2, 208)
# or do it in the paper from the Yu et al study? yes. 
hall["paper", ] <- c(8911, NA, 106)

# raw --------------------------------------------------------------------------
h_raw <- read.csv(file = "../datasets/Original/Hall.csv")

hall["raw", ] <- c(length(h_raw$Document.Title),
                   NA,
                   sum(h_raw$label == "yes"))
                          
# asreview ---------------------------------------------------------------------
hall_asr <- read.csv(file = "../hyperoutput/data/hall.csv")
hall["asreview", ] <- c(length(hall_asr$included),
                        NA,
                        sum(hall_asr$included))

################################################################################
## ace dataset #################################################################
################################################################################
ace <- template
ace["paper", ] <- c(2544, NA, round(2544*0.0160)) 

# raw --------------------------------------------------------------------------
# original paper not to linked directly. cannot be retrieved? 
# checked dataset online by cohen et al. 
#https://dmice.ohsu.edu/cohenaa/systematic-drug-class-review-data.html
ace["raw", ] <- c(2544, NA, 41)

# asreview ---------------------------------------------------------------------
ace_asr <- read.csv(file = "../hyperoutput/data/ace.csv")

ace["asreview", ] <- c(length(ace_asr$included_final),
                       NA,
                       sum(ace_asr$included_final))

# put everything together in list. 
all <- list(nudging = nagtegaal,
            wilson = wilson,
            ptsd = ptsd,
            software = hall,
            ace = ace)
