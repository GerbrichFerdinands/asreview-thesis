
# notes 16-01-2020 core team meeting


## Overleg met Raoul via slack (14-01-2020):

- balance strategies maar 1;
- lstm / dense__ laten?
- 105 combinaties

## Core team meeting 16-01-2020
hoeveelheid trainingsdata: 10/10 = standaard simulate

doc2vec - bereken similarity tussen documenten obv 1/2 layer nn

surfsara zonder lstm

LSTM en dense_nn (neurale) er uit
wel noemen maar er uit. klassieke modellen; rf, nb, svm

te variëren parameters (update tabel)
hoeveelheid trainingsdata: 3x:  10/10, 10/5, 5/5
model: 3 stuks:
query: 7.
balance: 1 (niet noemen -> als we die niet variëren mag die er uit)
fe kies er 2: - doc2vec = exotisch, tfidf = klassiek/base (maar doen er 5)

nb alleen tfidf (want alleen positieve waardes)

? wat wil je als tussenresultaten opslaan van je runs?
--> in hoeverre preprocessen en in hoeverre zelf doen?

- Raoul:
    - probabilities volgordes van alle runs bijv. (dan heb je later alle vrijheid om te analyseren!)
    - in niet active learning dan is double hetzelfde als triple volgens Raoul.

active learning en niet active learning

- datasets:
    - de papers met alleen titel maar geen abstract moeten er uit gefilterd worden.
    - er moet dus een extra versie van dataset (begin met ptsd) waar deze papers er uit gegooid zijn.

    - reproduceerbare code
    - uiteindelijk een tool die dataset converteert (bijv. ShinyApp)

nieuw model: logistische regressie!

duidelijk logboek bijhouden waar alle code etc te vinden is!

## Met Raoul (16-01-2020)
sklearn modellen
je kan zelf hyperparams toevoegen line 42 nb bijv.

fe = van text naar matrix
  - tfidf is standaard
  - doc2vec

active/inactive/clusters

training/test data hetzelfde over 10 runs (zelfde indices).

balance_strategies.

querystrategieen

...
nb / double / tfidf --> eerste configuratie waar we mee ad slag gaan.
inactive.py --help --> simulatie


?Wat heb je nodig voor analyse in R?
  training indices moeten er uit komen

Lisa toegang, 30.000 uur om mee te oefenen. (volgende week bespreken)

## To do list.
- [ ] literatuurlijst zotero
- [ ] overzichtstabel van parameters afmaken
- [ ] begrippenlijst maken
- [ ] begrippenstromen: software vs manuscript.
- [ ] literatuur over query strategies, feature extraction opzoeken!
- [ ] beginnen met simulatiepipeline (1tje runnen)
- [ ] hoe meten we performance?
      metrics:
        - (criteria van albert's thesis)
        - snelheid
        - Raoul heeft een betere metric bedacht s
              - hoe lang duurt het om relevante papers te vinden?
              - gemiddelde positie van alle inclusies / totaal aantal papers.
              - nu linear kan ook kwadratisch etc.
