# Archive "Active learning for efficient systematic reviews"
Gerbrich Ferdinands, 14-05-2020. version x 

This repository contains the research archive accompanying my Master's thesis project, "Active learning for efficient systematic reviews: Evaluating models across research areas". 

# Content
This archive is organized as such that it follows the steps needed to reproduce the study that was carried out:

1. `datasets` -  collection and preprocessing of six systematic review datasets.
2. `simulation_study` the process of simulating the systematic review was carried out in two steps:
    - `hpoptimization` - obtaining suitable hyperparameters for all models through optimization
    - `simulation` - simulating systematic reviews through active learning.
3. `results` - the simulation study output was processed and analyzed to arrive at the results discussed in the manuscript. 
4. `manuscript` - a set of Rmarkdown files who contain the written text in the manuscript and references.

Every subfolder contains its own `readme` that will guide you through the steps of the research. 
This repository contains one additional folder called `other`, containing the ethical approval form by the FETC, and the grant approval by SURFsara, and minutes of weekly decisions that were made during the research process. Minutes are available until 12 March 2020 due to Utrecht University closing because of the covid-19 crisis.

# Requirements
The steps in this repository assume you have R (3.6.1) and RStudio (1.2.5042) installed. Moreover, you will need Python version 3.7 or higher. If you don't have python you can follow the steps documented  ![here](https://asreview.readthedocs.io/en/latest/installation.html#install-python). Any furher requirements are discussed in the `simulation_study` readme.

# Privacy
Only openly available data was used in this study. The study has been approved by the Ethics Committee of the Faculty of Social and Behavioural Sciences of Utrecht University, filed as an amendment under study 20-104. The approval document can be found in the `other` directory of this repository. 

# Permission and access
This research archive is openly published on GitHub, https://github.com/GerbrichFerdinands/asreview-thesis and has a CC-BY 4.0 license. Therefore it is 'open access' and available for anyone. This repository will remain online for at least 10 years. 

# Contact
This repository is maintained by Gerbrich Ferdinands. For any further questions, please e-mail me at  `gerbrichferdinands@gmail.com`.