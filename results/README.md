Processing simulation output
================

This directory stores all files used to extract figures and statistics
from the simulation study output. The directory contains the following:

  - `extract_plots.ipynb`, a jupyter notebook producing recall curves
    from the simulation output (Figure 1 and 2 in the manuscript)
  - `extract_results.ipynb`, a jupyter notebook extracting `.json` files
    containing statistics from the `.h5` simulation output (WSS, RRF,
    ATD in table 2, 3, and 4 in the manuscript)
  - `one_seed`, containing all plots and `.json` statistics files
    produced by the two jupyter notebooks above. The plots are used in
    the manuscript, the data are further processed by this readme into
    tables before they are manuscript-ready.
  - `README.Rmd` containing R-code to transform the `.json` files into
    readable tables for the manuscript.
  - `output` contains the abovementioned tables, stored as `.RDS`
    files.  
  - the `datastats.RDS` is used in the analyses to compute adjusted ATD
    values (see code below)

# Requirements

Extracing data from the simulation output requires having several
packages installed, like ASReview version 0.9.3 \[@ASReview2020\]. All
these requirements are listed in the `requirements.txt` file. If you’ve
already installed this file in the `simulation_study` step, please skip
this. If not, you can run the following in your terminal to install all
requirements:

Additionally, to create the plots and statistics in the manuscript you
will need to install a specific branch of the asreview visualization
package. Run the following in your terminal:

And then, within the newly created directory, the following:

# Reproduce data extraction

To reproduce the results, follow the steps below. If you do not want to
download the raw simulation output, start at step 3:

1.  Run all code in the `extract_plots.ipynb` notebook to create all
    plots. This requires having the raw simulation data, to be found on
    the OSF (<https://osf.io/7mr2g/> and <https://osf.io/ag2xp/>). Note
    that you will need to adjust the paths to where you’ve stored the
    simulation output on your local computer. Also, note that creating
    figures can take quite some time, depending on your computer. Mine
    took from 30 minutes to 5 hours per figure The final figures can be
    found in the `one_seed/plots` directory.
2.  Run all code in the `extract_results.ipynb` to extract the metrics
    WSS, RRF and ATD from the raw simulation data. Note that you will
    need to adjust the paths to where you’ve stored the simulation
    output on your local computer. Also, note that extracting all
    results will take quite some time, depending on your computer. Mine
    took 48 hours. The results are stored in the `one_seed/plots`
    directory.
3.  Follow the preprocessing steps in the `README.Rmd` files to create
    tables for in the manuscript, stored in the `output` directory.

## Define functions for reading simulation output

The ATD values need to be adjusted for prior inclusions and exclusions
as the computation does not take into account that prior to the active
learning cycle, already 1 inclusion and 1 exclusion have been labelled
‘for free’.

## Load results for 15 separate trials

Compute standarad deviation from the 15 separate trials.

## Load results as means over all 15 trials

Create table for manuscript (all means over 15 runs)

| model        | wss.95\_nudging | rrf.10\_nudging | loss\_nudging | wss.95\_ptsd | rrf.10\_ptsd | loss\_ptsd | wss.95\_software | rrf.10\_software | loss\_software | wss.95\_ace | rrf.10\_ace | loss\_ace | wss.95\_virus | rrf.10\_virus | loss\_virus | wss.95\_wilson | rrf.10\_wilson | loss\_wilson |
| :----------- | --------------: | --------------: | ------------: | -----------: | -----------: | ---------: | ---------------: | ---------------: | -------------: | ----------: | ----------: | --------: | ------------: | ------------: | ----------: | -------------: | -------------: | -----------: |
| NB + TF-IDF  |            71.7 |            65.3 |           9.4 |         91.7 |         99.6 |        1.8 |             92.3 |             98.2 |            1.5 |        82.9 |        90.5 |       5.0 |          71.2 |          73.9 |         8.2 |           83.4 |           87.3 |          4.1 |
| LR + D2V     |            71.6 |            67.5 |           8.9 |         90.1 |         98.6 |        1.9 |             91.7 |             99.0 |            1.4 |        77.4 |        81.7 |       5.6 |          70.4 |          70.6 |         8.4 |           84.0 |           90.6 |          4.9 |
| LR + TF-IDF  |            66.9 |            62.1 |           9.6 |         91.7 |         99.8 |        1.7 |             92.0 |             99.0 |            1.4 |        81.1 |        88.5 |       6.1 |          70.3 |          73.7 |         8.4 |           80.5 |           89.1 |          4.5 |
| RF + D2V     |            66.3 |            62.6 |          10.4 |         88.2 |         97.1 |        3.1 |             91.0 |             99.2 |            1.6 |        68.6 |        80.8 |       7.3 |          67.2 |          67.3 |         9.3 |           77.9 |           75.5 |          7.5 |
| RF + TF-IDF  |            64.9 |            53.6 |          11.8 |         84.5 |         94.8 |        3.4 |             90.5 |             99.0 |            2.0 |        71.3 |        82.3 |       7.0 |          63.9 |          62.1 |        10.6 |           81.6 |           86.7 |          5.9 |
| SVM + D2V    |            70.9 |            67.3 |           8.9 |         90.6 |         97.8 |        2.1 |             92.0 |             99.3 |            1.4 |        78.3 |        84.2 |       6.2 |          70.7 |          73.6 |         8.5 |           82.7 |           91.5 |          4.7 |
| SVM + TF-IDF |            66.2 |            60.2 |          10.2 |         91.0 |         98.6 |        2.1 |             92.0 |             99.0 |            1.9 |        75.8 |        86.2 |       7.3 |          69.7 |          73.4 |         8.5 |           79.9 |           90.6 |          4.2 |
