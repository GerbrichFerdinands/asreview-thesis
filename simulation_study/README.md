Simulation study scripts
================

This directory contains all steps taken in hyperparameter optimization
and simulating automated systematic reviews.

# Content

This repository contains:

  - `hpoptimization` documentation on how hyperparameters were optimized
    plus the resulting parameters.
  - `simulation` documentation on how the models were simulated on the
    systematic review datasets.
  - `R` containing R-scripts called upon in the current readme, to
    structure the whole simulation process.

To reproduce the research, first follow the steps in `hpoptimization`,
then those in `simulation`. If you wish to skip the hyperparameter
optimization step, this is possible since the results of the
hyperparameter optimization are available in this repository.

# Models

We are simulating 7 models on 6 systematic review datasets. Each model
has an abbreviation to ease the programming process:

| Model        | Abbreviation |
| :----------- | :----------- |
| NB + TF-IDF  | BCTD         |
| LR + D2V     | RCTD         |
| LR + TF-IDF  | SCTD         |
| RF + D2V     | LCTD         |
| RF + TF-IDF  | RCDD         |
| SVM + D2V    | SCDD         |
| SVM + TF-IDF | LCDD         |

The first letter denotes the classification strategy, NB, LR, RF, or
SVM. The second letter stands for C of certainty sampling. The third
letter denotes the feature extraction strategy, TF-IDF or Doc2vec. The
fourth letter stands for D of Dynamic Resampling.

For every model, first the hyperparameters were optimized. The scripts
and results for that can be found in the `hpoptimization` directory. The
`simulation` directory contains scripts for simulating an automated
systematic review, using the hyperparameters obtained in the
optimization.

# Requirements

This study requires having several packages installed, like ASReview
version 0.9.3 (van de Schoot et al. 2020). All these requirements are
listed in the `requirements.txt` file. Assuming you have Python 3.7 or
higher, you can run the following in your bash terminal to install all
requirements:

``` bash
pip install -r requirements.txt
```

This automatically installs asreview version 0.9.3 and several
dependencies. Moreover, a specific branch of the asreview simulation
extension should be installed. Run the following in your bash terminal:

``` bash
git clone https://github.com/GerbrichFerdinands/asreview-thesis-simulation.git
```

And then, within the newly created directory, the following:

``` bash
pip install . 
```

# References

<div id="refs" class="references hanging-indent">

<div id="ref-ASReview2020">

Schoot, Rens van de, Jonathan de Bruin, Raoul Schram, Parisa Zahedi,
Bianca Kramer, Gerbrich Ferdinands, Albert Harkema, Qixiang Fang, and
Daniel Oberski. 2020. “ASReview: Active Learning for Systematic
Reviews,” April. <https://doi.org/10/ggssnj>.

</div>

</div>
