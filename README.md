# ARLClustering Package

`ARLClustering` is an R package designed for network data analysis, leveraging association rules to examine node interactions within networks. This package introduces a novel approach to community detection using data-mining techniques to highlight communities within the social network.

## Key Features:

-   **Community Detection**: Implements an innovative method for identifying communities within a network through association rule learning.
-   **Synthetic Datasets**: Includes synthetic social network datasets for testing and validating the effectiveness of the proposed approach. The following are the used datasets:
    -   Karate Club social network.
    -   Dolphins social network.
    -   LesMiserables social network.
    -   Word Adjacencies social network.
    -   Chan Facebook social network.
    -   NetScience network.
    -   Facebook social network.
    -   PowerGrid network.
-   **Step-by-Step Implementation**: Guides users through the entire process, from loading the network dataset to identifying potential clusters.

## **Overview**

Community detection is a critical aspect of network analysis, providing insights into the modular structure of networks. **`ARLClustering`** package enhances this process by applying data-mining techniques to uncover hidden patterns and relationships among nodes. It provides functions to preprocess network data, generate association rules, and identify clusters within the network based on these rules.

This package is particularly useful for researchers and practitioners in fields such as social network analysis, biology, and communication networks, who require useful tools for applying their community detection analysis.

## Installation

You can install the `ARLClustering` package directly from GitHub using the `devtools` package:

``` r
devtools::install_github("assuom44/arlclustering")
```

## Functions

An overview of the main functions provided by the `ARLClustering` package:

-   `get_network_dataset():`Loads a network dataset and converts it into a graph object.

-   `arlc_gen_transactions():`Generates a transactional dataset from a graph for association rule mining.

-   `arlc_get_apriori_thresholds():`Finds the best thresholds for the Apriori algorithm based on the provided dataset.

-   `arlc_gen_gross_rules():`Executes the Apriori algorithm to generate gross association rules.

-   `arlc_get_NonR_rules():`Eliminate non redundant rules from the gross rules generated from previous step.

-   `arlc_get_significant_rules``():`Choose significant rules from the non redundant rules generated from previous step.

-   `arlc_clean_final_rules``():`Cleans the preprocessed rules to remove redundancy and insignificance.

-   `arlc_generate_clusters``():`Generates potential clusters based on the preprocessed rules.

-   `arlc_clusters_plot``():`Displays the obtained result as a plot if the total number of nodes less than 70. Otherwise, it displays the list of the identified communities.

## **Example Usage**

Here is examples of the `arlc_get_network_dataset` call for each of the provided synthetic network datasets, the network is loaded then on variable `g`:

``` r
g <- arlc_get_network_dataset("./inst/extdata/karate.gml", "Karate Club")
g <- arlc_get_network_dataset("./inst/extdata/dolphins.gml", "Dolphins Network")
g <- arlc_get_network_dataset("./inst/extdata/lesmiserables.gml", "LesMiserables Network")
g <- arlc_get_network_dataset("./inst/extdata/word_adjacencies.gml", "Word Adjacencies Network")
g <- arlc_get_network_dataset("./inst/extdata/ChanFacebook.gml", "Chan Facebook Network")
g <- arlc_get_network_dataset("./inst/extdata/netscience.gml", "NetScience Network")
g <- arlc_get_network_dataset("./inst/extdata/facebook.gml", "Facebook Network")
g <- arlc_get_network_dataset("./inst/extdata/power_grid.gml", "PowerGrid Network")
```

Generating the transactions into the variable trx:

``` r
trx <- arlc_gen_transactions(g$graph)
```

Getting the apriori parameters, the computed parameters will be used for generating the best rule set. Here is an example of each of the provided dataset examples:

``` r
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.1, 0.9, by = 0.1), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- Kerate
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- Dolphins
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- LesMiserables
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- WordAdjacency
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- ChanFacebook
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.003, 0.004, by = 0.001), confidenceRange = seq(0.5, 0.7, by = 0.1)) -- NetScience
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- Facebook
params <- arlc_get_apriori_thresholds(trx, supportRange = seq(0.05, 0.06, by = 0.01), confidenceRange = seq(0.5, 0.9, by = 0.1)) -- PowerGrid

```

Generating the gross rules using the computed apriori parameters. The result is stored in the the variable `grossRules`:

``` r
grossRules <- arlc_gen_gross_rules(trx, minSupp = params$minSupp, minConf = params$minConf, minLenRules = 1, maxLenRules = params$lenRules)
```

Filtering the generated gross rules through non redundant and significant rules. The final result is stored in the variable `NonRSigRules`:

``` r
NonRedRules <- arlc_get_NonR_rules (grossRules$GrossRules)
```

``` r
NonRSigRules <- arlc_get_significant_rules (trx, NonRedRules$nonRR_rules)
```

Cleaning the obtained result:

``` r
cleanedRules <- arlc_clean_final_rules (NonRSigRules$sigR_nnRR_Rules)
```

Generating clusters:

``` r
c <- arlc_generate_clusters (cleanedRules) 
```

Displaying results:

``` r
arlc_clusters_plot(g$graph, g$graphLabel, c$Clusters)
```

## Contribution

Contributions to the `ARLClustering` package are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on GitHub.

## **License**

`ARLClustering` is released under the GPL-3 license.
