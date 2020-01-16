# Gerbrich Ferdinands, 14-01-2020
# document all parameters in asreview software

#path <- "~/Downloads/automated-systematic-review-unsupervised/asreview"

#params <- list.files(path, recursive = TRUE, include.dirs = TRUE)

# library(httr)
# req <- GET("https://api.github.com/repos/qubixes/automated-systematic-review/tree/unsupervised")
# stop_for_status(req)
# filelist <- unlist(lapply(content(req)$tree, "[", "path"), use.names = F)
# grep("/unsupervised", filelist, value = TRUE, fixed = TRUE)

#params[str_detect(params, ".py", negate = TRUE)]

# model parameters -------------------------------------------------------------

  # categorical variables ------------------------------------------------------
  params <- list(
    model = c("lstm_base",
              "lstm_pool", 
              "nb", # naive bayes
              "rf", # random forest 
              "svm",
              "dense_nn"),
    
    query_strategy = c("cluster",
                       "max",
                       "max * cluster",
                       "max * uncertainty",
                       "max * random",
                       "cluster * uncertainty",
                       "cluster * random"
                       #"uncertainty",
                       #"random",
                       #"mixed"
                       ), # is not implemented
    
    balance_strategy = c(#"simple",
                         #"double",
                         "triple"
                         #"undersample"s
                         ),
    
    feature_extraction = c("doc2vec",
                           "tfidf", 
                           "sbert", 
                           "embeddingIdf", # ?
                           "embeddingLSTM") # only for lstm
  )
  
  # numerical variables --------------------------------------------------------
  n_instances <- 1 # number of papers queried each query 
  n_prior_included <- 10 
  n_prior_excluded <- 10 

# hyperparameters --------------------------------------------------------------

  