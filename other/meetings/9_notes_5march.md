# Notes - core team meeting - core team meeting

# recap/decisions last week
- dataset preprocessing
  - ptsd - inclusions are inconsistent, issue has been made: https://github.com/asreview/systematic-review-datasets/issues/14
  - nagtegaal - after some back and forth e-mailing with Rosanna, we counted 375 inclusions instead of the 377 mentioned in the systematic review paper. 
  - wilson - about 1/3 of abstracts are missing, this is probably due to those papers being relatively old and therefore missing an abstract. Terry is going to investigate if this is true. I am in contact with the authors over this. https://github.com/asreview/systematic-review-datasets/issues/15


- Datasets preprocessing
  - 


- models


- contributors page has been updated 

# Meeting

- which journal


# To do
- [ ] alle 5 datasets op dataset repository?? check! 
- [ ] add fastread to table! 
- [ ] nagtegaal dataset extra column!
- [x] dataset from Jan de Boer (medical one)
- [ ] read paper burt settles 
- [x] analyseplan schrijven.
- [x] script die `.ini`'s voor simulatie genereert.
- [ ] script die optimalisatie genereert. 

- [x] FETC amendement indienen

simulation pipeline:
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
    - [x] doc2vec
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
    - [x] RRF5
    - [x] RRF10
    - [x] WSS 95
    - [ ] Raoul: hoe lang het (gemiddeld) duurt voordat je alle inclusies gevonden hebt

  Other:
- [x] contributors GitHub update (kijk naar tensorflow)
  - [x] alles kaal --> aparte contributing guidelines.
- [x] tabel omzetten naar word
- [x] appendix voorbereiden met 4 kolommen. 
        - naam; website; citation; 
        - name; open source; link source code; machine learning; active learning 
- [ ] most interesting competitors:
  - [ ] type of machine learning
  - [ ] type of active learning 
  - [ ] what happens with your data
- [x] catchy sentences with Joukje

- [ ] colandr: differences codes and site: what is up? 