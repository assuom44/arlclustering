#' Get Best Apriori Thresholds
#'
#' This function finds the best support and confidence thresholds for the Apriori algorithm
#' to maximize the lift of the generated association rules.
#'
#' @param transactions A transaction dataset of class `transactions` from the `arules` package.
#' @param support_range A numeric vector specifying the range of support values to be tested.
#' @param confidence_range A numeric vector specifying the range of confidence values to be tested.
#'
#' @return A numeric vector containing the best support, best confidence, highest lift, and the number of rules found.
#' The return value is a named vector with elements \code{best_support}, \code{best_confidence}, \code{best_lift}, and \code{len_rules}.
#'
#' @details This function iterates through the given ranges of support and confidence values,
#' applies the Apriori algorithm to find association rules for each pair of values, and selects
#' the pair that produces rules with the highest lift.
#'
#' @examples
#' \dontrun{
#' library(arules)
#' data(Groceries)
#' support_range <- seq(0.001, 0.01, by = 0.001)
#' confidence_range <- seq(0.1, 0.9, by = 0.1)
#' best_thresholds <- arlc_fct_get_best_apriori_thresholds(Groceries, support_range, confidence_range)
#' print(best_thresholds)
#' }
#'
#' @importFrom arules apriori
#' @export

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
