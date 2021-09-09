# arlclustering: an R package for ARL Clustering method for Social Network Analysis (Community detection)

Welcome to the website for my R package, `arlclustering`!  This package is created as part of the Advanced Data Science oriented to a research paper based on Community Detection.  The purpose of this package is to use github for the implementation tasks.

### Used Dataset
The used dataset for this research paper is a manual dataset representing a synthetic social network, based on interactions of users. The highlited link is represented with the shared relationships of the network users.

### `plot_candy()` function
The main function of this package is called `plot_candy`.  The function takes in the following parameters:

### `first_function()` function

### `second_function()` function


1) `df`: The name of the data frame
2) `n`: The number of top candies to plot (default is 10)
3) `candy_name_col`: The name of the column in the data frame `df` containing the candy names
4) `rank_col`: The name of the column in the data frame `df` containing the candy rankings

The output of the function is a `ggplot` object, depicting the top `n` ranked candies in the dataset.

### Using the package
In order to use the package, you must first install it from this GitHub repo, which can be done using the `devtools` package:

```
library(devtools)
devtools::install_github('[USERNAME]/arlclustering')
```
Next, you must load the R package:

```
library(arlclustering)
```

Here's an example of how to use :
1) the `plot_candy()` function:
```
plot_candy(candy_data, candy_name_col = "competitorname", rank_col = "winpercent")
```
2) The first function
```
first_function(candy_data, candy_name_col = "competitorname", rank_col = "winpercent")
```
3) The second function
```
second_function(candy_data, candy_name_col = "competitorname", rank_col = "winpercent")
```


