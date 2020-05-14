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
  - don't know, but all 5 data sets were used.

# Meeting

- Analysestrategie schrijven
  - alle modellen
  - fixed other parameters

  - voor ieder model
  - optimalisatie op 5 datasets: (55)
    - 5 x op zichzelf (maximum performance)
    - 5 x 4 op 1
    - 1 x alle 5
  - simulatie:

- ? FETC. --> amendement indienen wanneer overkoepelend project van Rens is goedgekeurd

- `.ini` bestanden schrijven (script maken die dit genereert) --> die moeten naar GitHub repo.
- bestanden die optimalisatie instellingen klaarzet.

Data sets:
- interessante dataset van Jan -> medisch. is al open.
- Sanne? nog niet af.
- min 2000, <10%

# To do

- [ ] analyseplan schrijven.
- [ ] script die `.ini`'s voor simulatie genereert.
- [ ] script die optimalisatie genereert. 

- [ ] FETC amendement indienen

simulation pipeline:

- [x] for a nb configuration, run supervised learning hyperopt on the nagtegaal dataset
- [x] repeat this configuration for all 5 datasets
- [ ] run active learning hyperopt
- [x] perform simulation study
- [ ] run default params simulation study on every nb configuration? --> simulate results.
- [ ] prodigy project opzoeken
- [ ] hoe meten we performance?
- [ ] pride tool

- [x] plannetje met Raoul over hyperparameters optimaliseren.

- Begrippenlijst
  - [ ] Models
    - [x] nb
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
- [x] offerte voor stickers
- [x] active learning table verder uitwerken
  - [x] abstrackr
  - [x] colandr
  - [x] welke statistische modellen
- [ ] contributors GitHub update 
- [ ] tabel omzetten naar word
- [ ] appendix voorbereiden met 4 kolommen. 
        - naam; website; citation; 
        - open source; link source code; machine learning; active learning 
- [ ] most interesting competitors:
  - [ ] type of machine learning
  - [ ] type of active learning 
  - [ ] what happens with your data