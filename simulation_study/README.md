Simulation study scripts
================

This directory contains all steps taken in hyperparameter optimization
and simulating automated systematic reviews.

# Models

We are simulating 7 models on 6 systematic review datasets. Each model
has an abbreviation to ease the programming process:

``` r
conditiongrid <- readRDS("R/00_conditiongrid.RDS")
conditiongrid <- conditiongrid[c(1:4,7:9),]
conditiongrid %>%
  mutate(Model = c("NB + TF-IDF", "LR + D2V", "LR + TF-IDF", "RF + D2V", "RF + TF-IDF", "SVM + D2V", "SVM + TF-IDF" )) %>%
  mutate(Abbreviation = condition) %>%
  select(Model, Abbreviation) %>%
  kable(format = "markdown")
```

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
# install visualization package 
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
