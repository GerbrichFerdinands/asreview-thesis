# Notes - core team meeting - core team meeting

# recap/decisions last week
- FETC amendement has been submitted
- Yu et al 2019 - interesting on stopping criteria & human mistakes 

- datasets 
  - ptsd - datasets on other repository
  - nagtegaal - discrepancies: 
    - 2 papers missing - they were added (abstract inclusions)
    - 18 systematic reviews 'included' in asreview file, 'excluded' in nagtegaals file. 
    - 1 paper included in nagtegaals, excl in asreview. final decision: included. 
    - wat moet er online: csv file? raw file heeft niet zo veel zin ivm reverse engineering ? 
  
- begrippen uitleggen 
  - in hoeverre alles uitleggen (svm, rf etc --> in appendix + referenties?) - aparte appendix 
  
- simulation structure:
  - start with classifiers.
  - then doc2vec 
  - then balance strategy? 
  - optimizing hyperparameters = side project, maybe check if results aren't too different and then aggregate over 3*10(?) simulations?
  
  
# Meeting

# To do
- [4/5] alle 5 datasets op dataset repository?? check! 
- [x] add fastread to table! 
- [x] nagtegaal dataset extra column!
- [x] dataset from Jan de Boer (medical one)
- [ ] read paper burt settles 
- [x] analyseplan schrijven.
- [x] script die `.ini`'s voor simulatie genereert.
- [x] script die optimalisatie genereert. 

- [x] FETC amendement indienen

simulation pipeline:
- [ ] hoe meten we performance?
    - [x] WSS 95
    - [ ] Raoul: hoe lang het (gemiddeld) duurt voordat je alle inclusies gevonden hebt

  Other:
- [x] contributors GitHub update (kijk naar tensorflow)
  - [x] alles kaal --> aparte contributing guidelines.
- [x] tabel omzetten naar word
- [x] appendix voorbereiden met 4 kolommen. 
        - naam; website; citation; 
        - name; open source; link source code; machine learning; active learning 
- [x] most interesting competitors:
  - [x] type of machine learning
  - [x] type of active learning 
  - [x] what happens with your data
- [x] catchy sentences with Joukje
- [x] review pr terry
