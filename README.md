# Archive "Active learning for efficient systematic reviews"
This repository contains the research archive accompanying my Master's thesis project, "_Active learning for efficient systematic reviews: Evaluating models across research areas_". 

- Author: Gerbrich Ferdinands, 14-05-2020
- Version 1.0.0
- Data collection and simulation period: January - May 2020
- Manuscript handed in on 11-05-2020

# Content
This archive is organized as such that it follows the steps needed to reproduce the study that was carried out:

1. `datasets` -  collection and preprocessing of six systematic review datasets.
2. `simulation_study` the process of simulating the systematic review was carried out in two steps:
    - `hpoptimization` - obtaining suitable hyperparameters for all models through optimization
    - `simulation` - simulating systematic reviews through active learning.
3. `results` - the simulation study output was processed and analyzed to arrive at the results discussed in the manuscript. 
4. `manuscript` - a set of Rmarkdown files who contain the written text in the manuscript and references.

Please follow the order above if you want to reproduce this study. Every subdirectory contains its own `readme` that will guide you through the process of that particular step.

This repository contains one additional folder called `other`, containing the ethical approval form by the FETC, and the grant approval by SURFsara, and minutes of weekly decisions that were made during the research process. Minutes are available until 12 March 2020 due to Utrecht University closing because of the covid-19 crisis.

### Disclaimer
Simulating a systematic review produces files that are very large in size. The total amount of storage needed for all the raw output files is over 900 GB. GitHub does not allow for repositories of this size, therefore the raw datafiles of the simulation are stored on the Open Science Framework instead. Due to a bug in OSF, the files had to be distributed over 2 projects, https://osf.io/7mr2g/ and https://osf.io/ag2xp/. 

Due to the covid-19 crisis, there is currently no access to university buildings. However, my at-home Internet connection was too slow to upload the files, therefore uploading the files required me sitting on a bench outside of a University building with my laptop for quite a couple of afternoons. Whilst during this time, I did manage to upload all raw simulation output to the OSF, I did not manage to upload all raw hyperparameter optimization files. When the university buildings open again, they will be uploaded as soon as possible. In the mean time, I hope a compressed version from the raw hyperparameter optimization files suffices. They are stored in this GitHub repository, `simulation_study/hpoptimization/trials`.

# Requirements
All computations were run on macOS Catalina 10.15.2. The steps in this repository assume you have R (3.6.1) and RStudio (1.2.5042) installed. Moreover, you will need Python version 3.7 or higher. If you don't have python you can follow the steps documented  [here](https://asreview.readthedocs.io/en/latest/installation.html#install-python). Any furher requirements are discussed in the `simulation_study` readme.

# Privacy
Only openly available data was used in this study. The study has been approved by the Ethics Committee of the Faculty of Social and Behavioural Sciences of Utrecht University, filed as an amendment under study 20-104. The approval document can be found in the `other` directory of this repository. 

# Permission and access
This research archive is openly published on GitHub, https://github.com/GerbrichFerdinands/asreview-thesis and has a CC-BY 4.0 license. Therefore it is 'Open Access' and thus available for anyone. This repository will remain online for at least 10 years. 

# Contact
This repository is maintained by Gerbrich Ferdinands. For any further questions, please e-mail me at `gerbrichferdinands@gmail.com`.