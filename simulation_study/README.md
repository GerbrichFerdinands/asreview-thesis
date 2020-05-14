Simulation study scripts
================

This directory contains all steps taken in hyperparameter optimization
and simulating automated systematic reviews. The output

# Models

We are simulating 7 models on 6 systematic review datasets. Each model
has an abbreviation to ease the programming process:

The first letter denotes the classification strategy, NB, LR, RF, or
SVM. The second letter stands for C of certainty sampling. The third
letter denotes the feature extraction strategy, TF-IDF or Doc2vec. The
fourth letter stands for D of Dynamic Resampling.

# Requirements

This study requires having several packages installed, like ASReview
version 0.9.3 (van de Schoot et al. 2020). All these requirements are
listed in the `requirements.txt` file. Assuming you have Python 3.7 or
higher, you can run the following in your bash terminal to install all
requirements:

This automatically installs asreview version 0.9.3 and several
dependencies. Moreover, a specific branch of the asreview simulation
extension should be installed. Run the following in your bash terminal:

And then, within the newly created directory, the following:

### Version information

Personal device: macos catalina 10.15.2 Cartesius supercomputer asreview
simulation branch reorganization.

# References

<div id="refs" class="references hanging-indent">

<div id="ref-ASReview2020">

Schoot, Rens van de, Jonathan de Bruin, Raoul Schram, Parisa Zahedi,
Bianca Kramer, Gerbrich Ferdinands, Albert Harkema, Qixiang Fang, and
Daniel Oberski. 2020. “ASReview: Active Learning for Systematic
Reviews,” April. <https://doi.org/10/ggssnj>.

</div>

</div>
