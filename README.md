# arlclustering: an R package for ARL Clustering method for Social Network Analysis (Community detection)

Welcome to the website for my R package, `arlclustering`!  This package is created as part of the Advanced Data Science oriented to a research paper based on Community Detection.  The purpose of this package is to use github for the implementation tasks.

## Used Dataset
The used dataset for this research paper is a manual dataset representing a synthetic social network, based on interactions of users. The highlited link is represented with the shared relationships of the network users.

# ARLClustering R Package

## Overview
ARLClustering is an R package designed for community detection in networks using Association Rules Mining (ARM) techniques. This package provides functions to preprocess network data, generate association rules, and identify clusters within the network based on these rules.

## Installation
You can install the ARLClustering package directly from GitHub using the `devtools` package:
```R
devtools::install_github("assuom44/arlclustering")
```
## Functions
An overview of the main functions provided by the ARLClustering package, using the synthetic networks provided with the package:

### `get_network_dataset()` function
Loads a network dataset and converts it into a graph object.
```R
g <- arlc_get_network_dataset("./data/karate.gml", "Karate Club")
g <- arlc_get_network_dataset("./data/dolphins.gml", "Dolphins Network")
g <- arlc_get_network_dataset("./data/lesmiserables.gml", "LesMiserables Network")
g <- arlc_get_network_dataset("./data/word_adjacencies.gml", "Word Adjacencies Network")
g <- arlc_get_network_dataset("./data/ChanFacebook.gml", "Chan Facebook Network")
g <- arlc_get_network_dataset("./data/netscience.gml", "NetScience Network")
g <- arlc_get_network_dataset("./data/facebook.gml", "Facebook Network")
g <- arlc_get_network_dataset("./data/power_grid.gml", "PowerGrid Network")

```

### `arlc_gen_transactions()` function
Generates a transactional dataset from a graph for association rule mining.
```R
trx <- arlc_gen_transactions(g$graph)
```

### `arlc_get_apriori_thresholds()` function
Finds the best thresholds for the Apriori algorithm based on the provided dataset.
```R
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.1, 0.9, by = 0.1), confidenceRange = seq(0.5, 0.9, by = 0.1))
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1))
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1))
```

### `arlc_gen_gross_rules()` function
Executes the Apriori algorithm to generate gross association rules.
```R
grossRules <- arlc_gen_gross_rules(trx, minSupp = params$minSupp, minConf = params$minConf, minLenRules = 1, maxLenRules = params$lenRules)
```

### `arlc_get_NonR_rules ()` function
Eliminate non redundant rules from the gross rules generated from previous step.
```R
NonRedRules <- arlc_get_NonR_rules (grossRules$GrossRules)
```

### `arlc_get_significant_rules ()` function
Choose significant rules from the non redundant rules generated from previous step.
```R
NonRSigRules <- arlc_get_significant_rules (trx, NonRedRules$nonRR_rules)
```

### `arlc_clean_final_rules()` function
Cleans the preprocessed rules to remove redundancy and insignificance.
```R
cleanedRules <- arlc_clean_final_rules (NonRSigRules$sigR_nnRR_Rules)
```
### `arlc_generate_clusters()` function
Generates potential clusters based on the preprocessed rules.
```R
c <- arlc_generate_clusters (cleanedRules) 
```

### `arlc_clusters_plot()` function
Displays the obtained result as a plot.
```R
arlc_clusters_plot(g$graph, g$graphLabel, c$Clusters)
```

## Contribution
Contributions to the ARLClustering package are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on GitHub.

# Triggering version bump
# Triggering version bump2
