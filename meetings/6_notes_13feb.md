# Notes - core team meeting - core team meeting

# Recap last week

## Pipeline

  1. hyperparameter optimization (cross-validate over datasets?)

  - supervised learning   
  - select "best" configurations for next optimization round:
  - active learning
  - select "best" configurations to perform simulation study with

  2. Simulation study

- **future: maybe repeat with LOOCV?**
- then we can repeat this for all configurations.

### Questions
- For which models were hyperparameters already optimized? 

# Meeting


# To do
simulation pipeline:

- [x] for a nb configuration, run supervised learning hyperopt on the nagtegaal dataset
- [ ] repeat this configuration for all 5 datasets
- [ ] run active learning hyperopt
- [ ] perform simulation study

- [ ] run default params simulation study on every nb configuration? --> simulate results.

- [ ] prodigy project opzoeken
- [ ] hoe meten we performance?
- [ ] pride tool

    -
- [x] plannetje met Raoul over hyperparameters optimaliseren.

- Begrippenlijst
  - [ ] Models
    - [ ] nb
    - [ ] Random Forests
    - [ ] SVM
    - [ ] lr 
    - [ ] dnn
  - [ ] Feature extraction Strategy
    - [x] tfidf
    - [ ] doc2vec
    - [ ] sbert
    - [ ] embeddingIdf
  - [ ] Balance Strategy
    - [ ] double
  - [ ] Query Strategy
    - [ ] cluster
    - [ ] max
    - [ ] cluster * random 
    - [ ] cluster * uncertainty
    - [ ] max * cluster
    - [ ] max * random
    - [ ] max * uncertainty
  - [ ] Metrics
    - [ ] RRF5
    - [ ] RRF10
    - [ ] WSS 95
    - [ ] Raoul: hoe lang het (gemiddeld) duurt voordat je alle inclusies gevonden hebt

  Other:
- [ ] offerte voor stickers
- [ ] active learning table verder uitwerken
  - [ ] abstrackr
  - [ ] colandr
  - [ ] welke statistische modellen
