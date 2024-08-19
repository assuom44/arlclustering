# tests/testthat/test_arlc_gen_gross_rules.R

library(testthat)
library(arules)

#source("R/arlc_gen_gross_rules.R")  # Replace with the correct path to the R script file

# Load example data
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)
# Define support and confidence ranges
supportRange <- seq(0.1, 0.2, by = 0.1)
Conf <- 0.5
# Getting parameters
params <- arlc_get_apriori_thresholds(trans, supportRange, Conf)
minSupp <- params$minSupp
minConf <- params$minConf
minLenRules <- 1
maxLenRules <- params$lenRules


test_that("arlc_gen_gross_rules function works correctly", {
  # Run function
  result <- arlc_gen_gross_rules(trans, minSupp, minConf, minLenRules, maxLenRules)

  expect_true(is.list(result))
  expect_true("TotalRulesWithLengthFilter" %in% names(result))
  expect_true("GrossRules" %in% names(result))

  expect_true(is.numeric(result$TotalRulesWithLengthFilter))
  expect_true(inherits(result$GrossRules, "rules"))

  # Additional checks for correctness
  expect_true(length(result$GrossRules) > 0)
  expect_true(all(size(result$GrossRules) >= minLenRules))
  expect_true(all(size(result$GrossRules) <= maxLenRules))
})

# test_that("arlc_gen_gross_rules handles incorrect input types", {
#
#   expect_error(arlc_gen_gross_rules("not a transactions object", minSupp, minConf, minLenRules, maxLenRules),
#                "The transactions object must be of class 'transactions'.")
#
#   expect_error(arlc_gen_gross_rules(trans, "not a number", minConf, minLenRules, maxLenRules),
#                "minSupp must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, "not a number", minLenRules, maxLenRules),
#                "minConf must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, minConf, "not a number", maxLenRules),
#                "minLenRules must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, minConf, minLenRules, "not a number"),
#                "maxLenRules must be numeric")
# })
#
# test_that("arlc_gen_gross_rules handles NA input types", {
#
#   expect_error(arlc_gen_gross_rules(NULL, minSupp, minConf, minLenRules, maxLenRules),
#                "- Transactions object must be of class 'transactions'.")
#
#   expect_error(arlc_gen_gross_rules(trans, "not a number", minConf, minLenRules, maxLenRules),
#                "- minSupp must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, NULL, minLenRules, maxLenRules),
#                "- minConf must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, minConf, NULL, maxLenRules),
#                "- minLenRules must be numeric")
#
#   expect_error(arlc_gen_gross_rules(trans, minSupp, minConf, minLenRules, NULL),
#                "- maxLenRules must be numeric")
# })
