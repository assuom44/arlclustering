# Load the packages
library(testthat)
library(arlclustering)
library(arules)

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

# Define the test cases
test_that("arlc_get_NonR_rules function works correctly", {

  # Test that the function returns a list
  nonRR_rules <- arlc_get_NonR_rules(grossRules$GrossRules)
  expect_type(nonRR_rules, "list")

  # Test that the list contains the correct elements
  expect_true("TotFiltredRules" %in% names(nonRR_rules))
  expect_true("FiltredRules" %in% names(nonRR_rules))

})

# Additional tests could be written to cover edge cases and more specific scenarios
