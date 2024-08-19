# Load necessary libraries
library(testthat)
library(arules) # Ensure this is available for is.significant
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

# Test cases
test_that("arlc_get_significant_rules: Significant rules are correctly filtered", {

  # Test with valid inputs
  result <- arlc_get_significant_rules(trans, nonRR_rules$FiltredRules)
  expect_type(result, "list")
  expect_type(result$TotFiltredRules, "integer")
  expect_s4_class(result$FiltredRules, "rules")


  #expect_named(result, c("TotFiltredRules", "FiltredRules"))
  #expect_is(result$FiltredRules, "rules")
  #expect_is(result$TotFiltredRules, "numeric")

  # Check if the output matches the expected structure
  #expect_gt(length(result$FiltredRules), 0) # Example condition

})
test_that("Function handles no significant rules correctly", {

  # Example rules
  rules <- arules::apriori(trans, parameter = list(support = 0.1, confidence = 0.5))

  # Redundant rules (for the sake of the test)
  nonRR_rules <- rules[!is.redundant(rules)]

  # Simulate no significant rules by setting a high significance threshold
  sigR_rules <- nonRR_rules[is.significant(nonRR_rules, trans, "fisher", "holm")]

  if (length(sigR_rules) == 0) {
    result <- arlc_get_significant_rules(trans, nonRR_rules)

    # Check if the result is the same as the input
    expect_equal(result$TotFiltredRules, length(nonRR_rules))
    expect_equal(as(result$FiltredRules, "data.frame"), as(nonRR_rules, "data.frame"))
  }
})
