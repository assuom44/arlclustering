library(testthat)
library(arules)
library(arlclustering)

# Load the Karate Club dataset from the arules package for testing
# Load example data
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)

# Define support and confidence ranges for the tests
supportRange <- seq(0.1, 0.2, by = 0.1)
Conf <- 0.5

# Define a test case for the function arlc_get_apriori_thresholds
test_that("arlc_get_apriori_thresholds returns correct results", {

  # Run the function
  result <- arlc_get_apriori_thresholds(trans, supportRange, Conf)

  # Check that the result is a list
  expect_type(result, "list")

  # Check that the list has the correct names
  expect_named(result, c("minSupp", "minConf", "bestLift", "lenRules", "ratio"))

  # Check that the elements are of the expected types
  expect_type(result$minSupp, "character")  # because it's formatted as non-scientific
  expect_type(result$minConf, "character")  # because it's formatted as non-scientific
  expect_type(result$bestLift, "character") # because it's formatted as non-scientific
  expect_type(result$lenRules, "double")
  expect_type(result$ratio, "double")

  # Check that the ratio is a non-negative value
  expect_true(result$ratio >= 0)

  # Check that the function runs without error for different inputs
  expect_error(arlc_get_apriori_thresholds(trans, supportRange, Conf), NA)
})


