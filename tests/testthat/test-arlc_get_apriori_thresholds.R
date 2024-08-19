# Load the required packages
library(testthat)
library(arules)

# Load the script containing the function (adjust the path if necessary)
#source("R/arlc_get_apriori_thresholds.R")

# Load example data
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)


# Define support and confidence ranges
supportRange <- seq(0.1, 0.2, by = 0.1)
Conf <- 0.5

# Define the test context
test_that("arlc_get_apriori_thresholds works correctly", {

  # Run the function
  result <- arlc_get_apriori_thresholds(trans, supportRange, Conf)

  # Check if the output is a list
  expect_type(result, "list")

  # Check if all expected elements are in the list
  expect_true(all(c("minSupp", "minConf", "bestLift", "lenRules", "ratio") %in% names(result)))

  # Check if the values are numeric (or can be converted to numeric)
  expect_true(is.numeric(as.numeric(result$minSupp)))
  expect_true(is.numeric(as.numeric(result$minConf)))
  expect_true(is.numeric(as.numeric(result$bestLift)))
  expect_true(is.numeric(result$lenRules))
  expect_true(is.numeric(result$ratio))

  # Check if the support and confidence values are within the specified ranges
  expect_true(as.numeric(result$minSupp) %in% supportRange)
  expect_true(as.numeric(result$minConf) %in% Conf)

  # Check if the ratio is calculated correctly
  expect_equal(result$ratio, round(result$lenRules / length(trans), digits = 0))
})

