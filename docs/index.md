# arlclustering: an R package for ARL Clustering method for Social Network Analysis (Community detection)

This paper presents ARLClustering, an R package that introduces a novel approach for community detection in social networks using data mining techniques, particularly the Apriori algorithm. Building on the foundation of existing research, ARLClustering leverages association rules to identify and analyze meaningful communities based on node interactions. The package provides a suite of functions tailored for social network analysis and data mining, tested on various synthetic and real-world datasets such as the Karate Club, Dolphins, LesMiserables, and facebook networks. By addressing the gap in open-source implementations of association rule-based community detection, ARLClustering serves as a crucial tool for both researchers and practitioners. It bridges theoretical insights with practical utility, promoting advancements in methodologies for community detection in social networks.

## Used Dataset

The used dataset for this research paper is a manual dataset representing a synthetic social network, based on interactions of users.

-   Karate Club social network: N=34; E=78
-   Dolphins social network: N=62; E=159
-   LesMiserables social network: N=77; E=254
-   Word Adjacencies social network: N=112; E=425
-   Facebook L1 Organization: N=5793; E=45266
-   NetScience network: N=1589; E=2742
-   Facebook Friend social network: N=362; E=1988.

## Using the package

In order to use the package, you must first install it from this GitHub repo, which can be done using the `devtools` package:

```         
library(devtools)
devtools::install_github('assuom44/arlclustering')
```

### Network dataset preparation:

Next, you must load the R package:

```         
library(arlclustering)
g <- arlc_get_network_dataset(file, "Label")
```

**Table 1**: Summary of returned values by the function arlc_get_network_dataset

| Returned values  | Description                 |
|------------------|-----------------------------|
| g\$graphLabel    | Graph Label                 |
| g\$graph         | Graph structure             |
| g\$totalNodes    | Total of nodes in the graph |
| g\$totalEdges    | Total of edges in the graph |
| g\$averageDegree | Average degree of the graph |

### Generating transactions:

```         
transactions <- arlc_gen_transactions(g$graph)
```

**Table 2**: Summary of returned values by the function arlc_gen_transactions

| Returned values | Description                             |
|-----------------|-----------------------------------------|
| transactions    | A vector of unique transactionnal items |

### Association rules extraction:

```         
params <- arlc_get_apriori_thresholds ( transactions,
                                        supportRange, 
                                        confidenceRange)
```

**Table 3**: Summary of returned values by the arlc_get_apriori_thresholds function

| Returned values  | Description                           |
|------------------|---------------------------------------|
| params\$minSupp  | The best minimum support              |
| params\$minConf  | The best minimum confidence           |
| params\$bestLift | The best Lift                         |
| params\$lenRules | The length of the gross rules set     |
| params\$ratio    | The total rules per total nodes ratio |

```         
grossRules <- arlc_gen_gross_rules ( transactions,
                                     minSupp     = params$minSupp,
                                     minConf     = params$minConf,
                                     minLenRules = 1,
                                     maxLenRules = params$lenRules)
```

**Table 4**: Summary of returned values by the arlc_gen_gross_rules function

| Returned values                        | Description                |
|----------------------------------------|----------------------------|
| grossRules\$TotalRulesWithLengthFilter | The total generated rules  |
| grossRules\$GrossRules                 | The set of the gross rules |

### Gross rules processing:

```         
NonRedRules <- arlc_get_NonR_rules(grossRules$GrossRules)
```

**Table 5**: Summary of returned values by the arlc_get_NonR_rules function

| Returned values              | Description                             |
|------------------------------|-----------------------------------------|
| NonRedRules\$TotFiltredRules | The total number of non-redundant rules |
| NonRedRules\$FiltredRules    | The set of the non-redundant rules      |

```         
NonRSigRules <- arlc_get_significant_rules(transactions, NonRedRules$FiltredRules)
```

**Table 6**: Summary of returned values by the arlc_get_significant_rules function

| Returned values               | Description                                             |
|--------------------------|----------------------------------------------|
| NonRSigRules\$TotFiltredRules | The total number of non-redundant and significant rules |
| NonRSigRules\$FiltredRules    | The set of the non-redundant and significant rules      |

```         
cleanedRules <- arlc_clean_final_rules(NonRSigRules$FiltredRules)
```

**Table 7**: Summary of returned values by the arlc_clean_final_rules function

| Returned values | Description              |
|-----------------|--------------------------|
| cleanedRules    | The set of cleaned rules |

### Community detection:

```         
clusters <- arlc_generate_clusters(cleanedRules)
```

**Table 8**: Summary of returned values by the arlc_generate_clusters function

| Returned values       | Description                             |
|-----------------------|-----------------------------------------|
| clusters\$TotClusters | The total number of identified clusters |
| clusters\$Clusters    | The set of clusters                     |

### Community Visualization:

```         
plot <- arlc_clusters_plot(g$graph, g$graphLabel, c$Clusters)
```

The current function permits to display the content of the identified clusters. For clarity, we plot for networks with less than 100 nodes, otherwise we display the items of the cluster set, where the output in this case is similar to the following:

```{=tex}
Total Identified Clusters:  12
 =========================  
  Community  01 : 1 2 3 4 8 14
  Community  02 : 2 3 4 8 9 14
  Community  03 : 3 4 8 14 31 32 34
  Community  04 : 5 6
  Community  05 : 7 11
  Community  06 : 9 14 32 33
  Community  07 : 14 20
  Community  08 : 24 32 34
  Community  09 : 28 33
  Community  10 : 29 33
  Community  11 : 30 34
  Community  12 : 33 34
 ========================= 
```
## Contribution

Contributions to the `ARLClustering` package are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on GitHub.

## **License**

`ARLClustering` is released under the GPL-3 license.
