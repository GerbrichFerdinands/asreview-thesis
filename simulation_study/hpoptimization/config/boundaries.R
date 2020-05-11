

boundaries <- 
  data.frame(param = c("balance_param.a", # exp(normal(0,1))
                    
                     # Governs the weight of the 1's. Higher values mean linearly more 1's
                     #in your training sample.
                     
                     "balance_param.alpha", # uniform 0-2
                     
                     #  Governs the scaling the weight of the 1's, as a function of the
                     # ratio of ones to zeros. A positive value means that the lower the
                     # ratio of zeros to ones, the higher the weight of the ones.
                     
                     "balance_param.b",  # uniform 0-1
                     
                     # Governs how strongly we want to sample depending on the total
                     # number of samples. A value of 1 means no dependence on the total
                     # number of samples, while lower values mean increasingly stronger
                     # dependence on the number of samples.
                     
                     "feature_param.ngram_max", # uniform integer, 1, 2, or 3
                     
                     "feature_param.split_ta", # 0 or 1. (whether titles and abstracts are split)
                     
                     "feature_param.use_keywords", # random integer, 0 or 1, 
                     
                     # Doc2Vec
                     # vector_size: int
                     # Output size of the vector.
                     "feature_param.vector_size", # integer, round(uniform(31.5, 127.5-eps) / 8) * 8. eps = 1e-7 
                    
                     # epochs: int
                     # Number of epochs to train the doc2vec model.
                     "feature_param.epochs", # int : hp.quniform("fex_epochs", 20, 50, 1),
                     
                     # min_count: int
                     # Minimum number of occurences for a word in the corpus for it to
                     # be included in the model.
                     "feature_param.min_count", # : hp.quniform("fex_min_count", 0.5, 2.499999, 1),
                    
            
                     # window: int
                     # Maximum distance over which word vectors influence each other.
                     "feature_param.window", #: hp.quniform("fex_window", 4.5, 9.4999999, 1),
                     
                     # dm_concat: int
                     # Whether to concatenate word vectors or not.
                     # See paper for more detail.
                     "feature_param.dm_concat", # : hp.randint("fex_dm_concat", 2),
                     
                     # dm: int
                     # Model to use.
                     # 0: Use distribute bag of words (DBOW).
                     # 1: Use distributed memory (DM).
                     # 2: Use both of the above with half the vector size and concatenate
                     # them.
                     "feature_param.dm", # : hp.randint("fex_dm", 3),
                     
                     
                     # dbow_words: int
                     # Whether to train the word vectors using the skipgram method.
                     "feature_param.dbow_words", # : hp.randint("fex_dbow_words", 2),
                     
                    
                      # whether keywords are included in the feature matrix. 
                     
                     #MODEL parameters
                     
                     # Logistic
                     "model_param.c", # exp(normal(0,1)), constrained to be positive
                     
                     
                     # class_weight: float
                     # Class weight of the inclusions.
                     "model_param.class_weight", # exp(normal(0,1)), constrained to be positive
                      
                     # SVM 
                     
                     # gamma: str
                     # Gamma parameter of the SVM model.
                     # class_weight:
                     #   class_weight of the inclusions.
                     # C:
                     #   C parameter of the SVM model.
                    "model_param.c", # exp(normal(0,2))

                    "model_param.gamma", # ["auto", "scale"],
                     # kernel:
                     #   SVM kernel type.
                    "model_param.kernel", # ["linear", "rbf", "poly", "sigmoid"]
             
                    # NB
                    "model_param.alpha", # exp(normal(0,1))
             
                    # RF 
                    # random_state: int, RandomState
                    # Set the random state of the RNG. ('none')
                    
                    # max_features: int
                    # Number of features in the model.
                    "model_param.max_features",  #quniform(6,10,1)
                    
                    #n_estimators: int
                    # Number of estimators.
                    "model_param.n_estimators" #quniform(10,100,1)
                    ),
           
           lb = c(0, 0, 0, 
                  1, 0, 0,
                  32, 0, 0, 4, 0, 0, 0, 
                  0, 0, 
                  0, NA, NA, 0, 6, 10),
           ub = c(NA, 2, 1,
                  3, 1, 1, 
                  127, NA, 2, 9, 1, 3, 2,
                  NA, NA, 
                  NA, NA, NA, NA, 10, 100))
boundaries$param <- factor(boundaries$param)

saveRDS(boundaries , file = "simulation_study/hpoptimization/config/boundaries.RDS")
View(lctd)

lctd %>%
  filter(group == "one") %>%
  arrange(param) %>%
  View
