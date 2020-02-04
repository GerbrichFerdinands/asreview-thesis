# Notes - core team meeting - core team meeting

## e-mail from Caspar surfsarah
I was trying to understand the requested 500,000 SBUs in the context of the envisioned runs, but I'm not sure if I understand it correctly.
From what I get, a single run (on a single dataset) takes 1 day on 4 cores. That would mean 4*24=96 SBU per run is needed. As I understand it, you want to do 24,000 of those runs, meaning you would need 96*24,000 = 2,016,000 SBUs. Is that correct? If so: do you simply envision to do a subset of these computations within the pilot request, and meanwhile write a grant request for the NWO compute Call for the remaing ~1.5M SBU?
This is a perfectly valid strategy, but please then specify which part you'll do within this e-infra grant and which part you will continue as part of the normal NWO compute call (assuming the computations within the e-infra grant worked out successfully).
Regards,
Caspar
N.B. Just as an FYI: please note that Cartesius nodes have 24 cores and are exclusive. Thus, a single job requesting 4 cores would occupy a full 24-core node, leaving 20 cores idle. The solution is simple: pack together 6 of your runs in a single job. This will require some automation in terms of generating/running the job scripts. The easiest and cleanest solution is probably to use so-called array jobs (see https://slurm.schedmd.com/job_array.html)._


# Recap/decisions last week
-  logistic regression added by Raoul 
- add neural network. 

# Meeting

## data sets Jan - how to publish online?
  - by researchers themselves on OSF/FigShare. 
  - 3 files: 
    - raw data
    - abstracts inclusion
    - final inclusion
  - titel + abstract 
  - quality control?
    - empty cells
    - duplicates 
    - stay as close to the original data set as possible. 
  - student assistant can do this. 
  
## documentation
 - hours 4-8 
 - finish documentation pull request 
 
## thesis 
- nn niet met tfidf (duurt te lang? niet als eerst in ieder geval)
- first run: nb / double / tfidf
--> eerste configuratie waar we mee ad slag gaan. daarna wat andere combis proberen in trial runs (wat duurt lang/minder lang)
(elke combi is 1 in de queue)
eerst inactive learning, daarna active learning. (they are expected to be correlated but is that the case)
      metrics:
        - (criteria van albert's thesis)
        - snelheid
        - Raoul heeft een betere metric bedacht 
              - hoe lang duurt het om relevante papers te vinden?
              - gemiddelde positie van alle inclusies / totaal aantal papers.
              - nu linear kan ook kwadratisch etc.

# To do
- [x] literatuurlijst zotero
- [x] overzichtstabel van parameters afmaken
- [ ] prodigy project opzoeken
- [ ] begrippenlijst maken
- [ ] begrippenstromen: software vs manuscript + add literature 
- [ ] put thesis in bookdown 
- [ ] literatuur over query strategies, feature extraction opzoeken!
- [ ] beginnen met simulatiepipeline (1tje runnen)
- [ ] hoe meten we performance?
- [ ] pride? 



