#' Get Best Apriori Thresholds
#'
#' This function determines the best Apriori thresholds for a given transaction dataset.
#'
#' @description This function takes a transaction dataset and ranges for support and confidence,
#' runs the Apriori algorithm with various combinations of support and confidence values,
#' and returns the best support, confidence, lift, and number of rules found.
#'
#' @param transactions A transaction dataset.
#' @param support_range A sequence of values representing the range for minimum support.
#' @param confidence_range A sequence of values representing the range for minimum confidence.
#'
#' @return A numeric vector containing the best support, confidence, lift, and number of rules found.
#'
#' @examples
#' get_best_thresholds(transactions, support_range = seq(0.1, 0.9, by = 0.1), 
#'                     confidence_range = seq(0.5, 0.9, by = 0.1))
#' @export

get_best_thresholds <- function(transactions, support_range, confidence_range) {
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
