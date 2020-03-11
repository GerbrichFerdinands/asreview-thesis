# Notes - core team meeting - core team meeting

# recap/decisions last week
- FETC amendement has been submitted
- Yu et al 2019 - interesting on stopping criteria & human mistakes 

- datasets 
  - dataset tabellen
  - ptsd - datasets on other repository
  - nagtegaal - discrepancies: 
    - 2 papers missing - they were added (abstract inclusions)
    - 18 systematic reviews 'included' in asreview file, 'excluded' in nagtegaals file. 
    - 1 paper included in nagtegaals, excl in asreview. final decision: included. 
  
- begrippen uitleggen 
  - in hoeverre alles uitleggen (svm, rf etc --> in appendix + referenties?)
  
  
# Meeting

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
- [x] review pr terry
