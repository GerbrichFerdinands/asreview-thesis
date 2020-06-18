Simulation studies
==================

*This document is currently a work in progress. The results documented
here originate from Gerbrich Ferdinands’ master’s thesis which can be
found
[here](https://github.com/GerbrichFerdinands/asreview-thesis/blob/master/manuscript/manuscript/Ferdinands%2C-G---MSBBSS.pdf).*

To provide insight in how much screening effort ASReview could
potentially save, seven ASReview models were simulated on six existing
systematic review datasets. In short, for all six datasets ASReview
could have saved at least 60% of screening effort (e.g. WSS95% was \<
40%). For some datasets, ASReview was even able to detect 95% of
relevant publiations after screening only 5% of relevant publications.

### Datasets

Datasets were collected from the fields of medicine (Cohen et al. 2006;
Appenzeller‐Herzog et al. 2019), virology (Kwok et al. 2020), software
engineering (Yu, Kraft, and Menzies 2018), behavioural public
administration (Nagtegaal et al. 2019) and psychology (van de Schoot et
al. 2017), to assess generalizability of the models across research
contexts. Datasets are available in the [ASReview systematic review
datasets
repository](https://github.com/asreview/systematic-review-datasets).

Data were preprocessed from their original source into a test dataset,
containing title and abstract of the publications obtained in the
initial search. Candidate studies with missing abstracts and duplicate
instances were removed from the data. All test datasets consisted of
thousands of candidate studies, of which only only a fraction was deemed
relevant to the systematic review. For the Virus and the Nudging
dataset, the inclusion rate was about 5 percent. For the remaining six
datasets, inclusion rates were centered around 1-2 percent.
<!-- Preprocessing scripts and resulting datasets can be found on the [GitHub repository for this thesis](https://github.com/GerbrichFerdinands/asreview-thesis). Test datasets were labelled to indicate which candidate studies were included in the systematic review, thereby indicating relevant publications.  -->

**Table 1 - Statistics on the systematic review datasets**

| dataset  | Candidate publications | Relevant publications | Inclusion rate (%) |
| :------- | ---------------------: | --------------------: | -----------------: |
| Nudging  |                   1847 |                   100 |               5.41 |
| PTSD     |                   5031 |                    38 |               0.76 |
| Software |                   8896 |                   104 |               1.17 |
| Ace      |                   2235 |                    41 |               1.83 |
| Virus    |                   2304 |                   114 |               4.95 |
| Wilson   |                   2333 |                    23 |               0.99 |

### Models

To assess effect of different ASReview models, seven models were
evaluated differing in terms of the classification technique (Naive
Bayes, Linear Regression, Support Vector Machine, and Random Forest) and
the feature extraction strategy they adopt (TF-IDF and Doc2vec). The
Naive Bayes + TF-IDF model is the current default in ASReview. Note that
the ASReview GUI currently only offers freedom of choice for a
classification technique. However, the models presented here are not
exhaustive as the ASReview backend implements various other
configurations.

### Evaluation

Model performance was assessed by two different measures, Work Saved
over Sampling (WSS), and Relevant References Found (RRF).

WSS indicates the reduction in publications needed to be screened, at a
given level of recall (Cohen et al. 2006). Typically measured at a
recall level of 0.95 (Cohen et al. 2006), WSS95 yields an estimate of
the amount of work that can be saved at the cost of failing to identify
5% of relevant publications. In the current study, WSS is computed at
0.95 recall. RRF statistics are computed at 10%, representing the
proportion of relevant publications that are found after screening 10%
of all publications.

Furthermore, model performance was visualized by plotting recall curves.
Plotting recall as a function of the proportion of screened publications
offers insight in model performance throughout the entire screening
process (Cormack and Grossman 2014; Yu, Kraft, and Menzies 2018). The
curves give information in two directions. On the one hand they display
the number of publications that need to be screened to achieve a certain
level of recall (1-WSS), but on the other hand they present how many
relevant publications are identified after screening a certain
proportion of all publications (RRF).

For every simulation, the RRF10 and WSS95, are reported as means over 15
trials. To indicate the spread of performance within simulations, the
means are accompanied by an estimated standard error of the mean
\(\hat s\). To compare overall performance across datasets, median
performance is reported for every dataset, accompanied by the Median
Absolute Deviation (MAD), indicating variability between models within a
certain dataset. Recall curves are plot for every simulation,
representing the average recall over 15 trials \(\pm\) the standard
error of the mean.

## Results

First of all, models showed much higher performance for some datasets
than for others. While performance on the PTSD (Figure 2a) and the
Software dataset (Figure 2b) was quite high, performance was much lower
across models for the Nudging (Figure 1a) and Virus (Figure 2d)
datasets.

#### Recall curves

**Nudging dataset**
<embed src="../../results/one_seed/plots/nudging/inclusion_all_nudging.pdf" width="50%" style="display: block; margin: auto;" type="application/pdf" />
<embed src="../../results/one_seed/plots/nudging/inclusion_all_nudging.pdf" width="50%" style="display: block; margin: auto;" type="application/pdf" />

<img src="../../results/one_seed/plots/nudging/inclusion_all_nudging.pdf"
     style="float: left; margin-right: 10px;" /> **PTSD dataset**

**Software dataset**

**Ace dataset**

**Virus dataset**

**Wilson dataset**

**Table 2 - WSS95 values (mean, standard error) for all model-dataset
combinations, and median (MAD) for all datasets**

|              | Nudging     | PTSD        | Software    | Ace         | Virus       | Wilson      |
| :----------- | :---------- | :---------- | :---------- | :---------- | :---------- | :---------- |
| SVM + TF-IDF | 66.2 (2.90) | 91.0 (0.41) | 92.0 (0.10) | 75.8 (1.95) | 69.7 (0.81) | 79.9 (2.09) |
| NB + TF-IDF  | 71.7 (1.37) | 91.7 (0.27) | 92.3 (0.08) | 82.9 (0.99) | 71.2 (0.62) | 83.4 (0.89) |
| RF + TF-IDF  | 64.9 (2.50) | 84.5 (3.38) | 90.5 (0.34) | 71.3 (4.03) | 63.9 (3.54) | 81.6 (3.35) |
| LR + TF-IDF  | 66.9 (4.01) | 91.7 (0.18) | 92.0 (0.10) | 81.1 (1.31) | 70.3 (0.65) | 80.5 (0.65) |
| SVM + D2V    | 70.9 (1.68) | 90.6 (0.73) | 92.0 (0.21) | 78.3 (1.92) | 70.7 (1.76) | 82.7 (1.44) |
| RF + D2V     | 66.3 (3.25) | 88.2 (3.23) | 91.0 (0.55) | 68.6 (7.11) | 67.2 (3.44) | 77.9 (3.43) |
| LR + D2V     | 71.6 (1.66) | 90.1 (0.63) | 91.7 (0.13) | 77.4 (1.03) | 70.4 (1.34) | 84.0 (0.77) |
| median (MAD) | 66.9 (3.05) | 90.6 (1.53) | 92.0 (0.47) | 77.4 (5.51) | 70.3 (0.90) | 81.6 (2.48) |

**Table 3 - RRF10 values (mean, standard error) for all model-dataset
combinations, and median (MAD) for all datasets**

|              | Nudging     | PTSD        | Software    | Ace         | Virus       | Wilson       |
| :----------- | :---------- | :---------- | :---------- | :---------- | :---------- | :----------- |
| SVM + TF-IDF | 60.2 (3.12) | 98.6 (1.40) | 99.0 (0.00) | 86.2 (5.25) | 73.4 (1.62) | 90.6 (1.17)  |
| NB + TF-IDF  | 65.3 (2.61) | 99.6 (0.95) | 98.2 (0.34) | 90.5 (1.40) | 73.9 (1.70) | 87.3 (2.55)  |
| RF + TF-IDF  | 53.6 (2.71) | 94.8 (1.60) | 99.0 (0.00) | 82.3 (2.75) | 62.1 (3.19) | 86.7 (5.82)  |
| LR + TF-IDF  | 62.1 (2.59) | 99.8 (0.70) | 99.0 (0.00) | 88.5 (5.16) | 73.7 (1.48) | 89.1 (2.30)  |
| SVM + D2V    | 67.3 (3.00) | 97.8 (1.12) | 99.3 (0.44) | 84.2 (2.78) | 73.6 (2.54) | 91.5 (4.16)  |
| RF + D2V     | 62.6 (5.47) | 97.1 (1.90) | 99.2 (0.34) | 80.8 (5.72) | 67.3 (3.19) | 75.5 (14.35) |
| LR + D2V     | 67.5 (2.59) | 98.6 (1.40) | 99.0 (0.00) | 81.7 (1.81) | 70.6 (2.21) | 90.6 (5.00)  |
| median (MAD) | 62.6 (3.89) | 98.6 (1.60) | 99.0 (0.00) | 84.2 (3.71) | 73.4 (0.70) | 89.1 (2.70)  |

# References

<div id="refs" class="references hanging-indent">

<div id="ref-Appenzeller-Herzog2019">

Appenzeller‐Herzog, Christian, Tim Mathes, Marlies L. S. Heeres, Karl
Heinz Weiss, Roderick H. J. Houwen, and Hannah Ewald. 2019. “Comparative
Effectiveness of Common Therapies for Wilson Disease: A Systematic
Review and Meta-Analysis of Controlled Studies.” *Liver Int.* 39 (11):
2136–52. <https://doi.org/10.1111/liv.14179>.

</div>

<div id="ref-Cohen2006">

Cohen, A. M., W. R. Hersh, K. Peterson, and Po-Yin Yen. 2006. “Reducing
Workload in Systematic Review Preparation Using Automated Citation
Classification.” *J Am Med Inform Assoc* 13 (2): 206–19.
<https://doi.org/10.1197/jamia.M1929>.

</div>

<div id="ref-Cormack2014">

Cormack, Gordon V., and Maura R. Grossman. 2014. “Evaluation of
Machine-Learning Protocols for Technology-Assisted Review in Electronic
Discovery.” In *Proceedings of the 37th International ACM SIGIR
Conference on Research & Development in Information Retrieval*, 153–62.
SIGIR ’14. Gold Coast, Queensland, Australia: Association for Computing
Machinery. <https://doi.org/10.1145/2600428.2609601>.

</div>

<div id="ref-Kwok2020">

Kwok, Kirsty T. T., David F. Nieuwenhuijse, My V. T. Phan, and Marion P.
G. Koopmans. 2020. “Virus Metagenomics in Farm Animals: A Systematic
Review.” *Viruses* 12 (1, 1): 107. <https://doi.org/10.3390/v12010107>.

</div>

<div id="ref-Nagtegaal2019">

Nagtegaal, Rosanna, Lars Tummers, Mirko Noordegraaf, and Victor Bekkers.
2019. “Nudging Healthcare Professionals Towards Evidence-Based Medicine:
A Systematic Scoping Review.” *J. Behav. Public Adm.* 2 (2).
<https://doi.org/doi.org/10.30636/jbpa.22.71>.

</div>

<div id="ref-vandeSchoot2017">

Schoot, Rens van de, Marit Sijbrandij, Sonja D. Winter, Sarah Depaoli,
and Jeroen K. Vermunt. 2017. “The GRoLTS-Checklist: Guidelines for
Reporting on Latent Trajectory Studies.” *Struct. Equ. Model.
Multidiscip. J.* 24 (3): 451–67. <https://doi.org/10/gdpcw9>.

</div>

<div id="ref-Yu2018">

Yu, Zhe, Nicholas A. Kraft, and Tim Menzies. 2018. “Finding Better
Active Learners for Faster Literature Reviews.” *Empir. Softw. Eng.* 23
(6): 3161–86. <https://doi.org/10.1007/s10664-017-9587-0>.

</div>

</div>
