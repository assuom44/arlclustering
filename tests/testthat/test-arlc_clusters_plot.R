# test_arlc_clusters_plot.R

library(testthat)
library(igraph)
library(arlclustering)

# Load example data
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)
# Define support and confidence ranges
supportRange <- seq(0.1, 0.2, by = 0.1)
Conf <- 0.5
# Getting parameters
params <- arlc_get_apriori_thresholds(trans, supportRange, Conf)
grossRules <- arlc_gen_gross_rules(trans,
                                   params$minSupp,
                                   params$minConf,
                                   1,
                                   params$lenRules)
nonRR_rules <- arlc_get_NonR_rules(grossRules$GrossRules)
NonRRSig_rules <- arlc_get_significant_rules(trans, nonRR_rules$FiltredRules)
cleaned_rules <- arlc_clean_final_rules(NonRRSig_rules$FiltredRules)
clusters <- arlc_generate_clusters(cleaned_rules)




# test_that("arlc_clusters_plot works with a small graph", {
#   g <- g$graph
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Total Identified Clusters:  2")
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Community 01: 1 2 3 4 5")
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Community 02: 6 7 8 9 10")
# })
#
# test_that("arlc_clusters_plot handles empty clusters", {
#   g <- g$graph
#   clusters <- list()
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Total Identified Clusters:  0")
# })
#
# test_that("arlc_clusters_plot handles a single cluster", {
#   g <- g$graph
#   clusters <- list(1:10)
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Total Identified Clusters:  1")
#   expect_output(arlc_clusters_plot(g, "Sample Graph", clusters), "Community 01: 1 2 3 4 5 6 7 8 9 10")
# })

test_that("arlc_clusters_plot plots: generates a set of communities", {

  # Run the function to ensure it processes without error
  expect_error({
    arlc_clusters_plot(g$graph, "Karate Club", clusters$Clusters)
  }, NA)
  # Capture the console output
  output <- capture.output({
    arlc_clusters_plot(g$graph, "Karate Club", clusters$Clusters)
  })
  # Check that the output contains some key words:
  expect_true(any(grepl("Total Identified Clusters:", output)))
  expect_true(any(grepl("Community", output)))
  expect_true(length(output) > 0)

  # Check that clusters is a list
  expect_true(is.list(clusters$Clusters))

  # Check that the clusters list is not empty
  expect_true(length(clusters$Clusters) > 0)
  expect_true(length(clusters$Clusters) == clusters$TotClusters)

  # Check that each element of the list is not empty
  expect_true(all(sapply(clusters$Clusters, length) > 0))
})


