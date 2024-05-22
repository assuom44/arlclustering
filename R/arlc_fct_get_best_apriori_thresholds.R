
arlc_fct_get_best_apriori_thresholds <- function(transactions, support_range, confidence_range) {
  # Initialize variables to store the best support, confidence, lift, and rules
  best_support <- 0
  best_confidence <- 0
  best_rules <- NULL
  best_lift <- 0
  len_rules <- 0

  # Loop through the support and confidence values
  for (support in support_range) {
    for (confidence in confidence_range) {
      # Run Apriori algorithm with the current support and confidence
      gross_rules <- apriori(
        transactions,
        parameter = list(support=support, confidence=confidence),
        target = "rules",
        control = list(verbose = FALSE)
      )

      # Check if rules are found and if they have higher lift than the previous best rules
      if (length(gross_rules) > 0 && max(gross_rules@quality$lift) > best_lift) {
        best_support <- support
        best_confidence <- confidence
        best_lift <- max(gross_rules@quality$lift)
        best_rules <- gross_rules
      }
    }
  }

  # Calculate the number of rules found
  len_rules <- length(best_rules)

  # Return the best support, confidence, lift, and number of rules found
  return(c(best_support, best_confidence, best_lift, len_rules))
}
