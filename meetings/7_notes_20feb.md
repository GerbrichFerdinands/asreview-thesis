# Notes - core team meeting - 20 februari
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
- [ ] e-mail Lars Tummers/Rosanna Nagtegaal about dataset
- [ ] dataset from Jan de Boer (medical one)
- [ ] read paper burt settles 
- [x] analyseplan schrijven.
- [x] script die `.ini`'s voor simulatie genereert.
- [ ] script die optimalisatie genereert. 

- [ ] FETC amendement indienen

simulation pipeline:
- [ ] prodigy project opzoeken
- [ ] hoe meten we performance?
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
- [ ] contributors GitHub update (kijk naar tensorflow)
  - [ ] alles kaal --> aparte contributing guidelines.
- [ ] tabel omzetten naar word
- [ ] appendix voorbereiden met 4 kolommen. 
        - naam; website; citation; 
        - name; open source; link source code; machine learning; active learning 
- [ ] most interesting competitors:
  - [ ] type of machine learning
  - [ ] type of active learning 
  - [ ] what happens with your data
- [ ] catchy sentences with Joukje

- [ ] colandr: differences codes and site: what is up? 