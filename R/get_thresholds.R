# Function for getting the best apriori thresholds:

get_thresholds <- function (transactions, support_range, confidence_range){
  # Initialize variables to store the best support, confidence, and rules
  best_support <- 0
  best_confidence <- 0
  best_rules <- NULL
  best_lift <- 0
  len_rules <- 0

  #invisible({
  # Loop through the support and confidence values
  for (support in support_range) {
    for (confidence in confidence_range) {
      # Run Apriori algorithm with the current support and confidence
      gross_rules <- apriori(
        transactions,
        parameter = list(support=support, confidence=confidence),#, minlen=minLenRules, maxlen=maxLenRules),
        target="rules",
        control = list( verbose = T)
      )

      # Check if the current rules have higher lift than the previous best rules
      if (length(gross_rules) > 0 && max(gross_rules@quality$lift) > best_lift) {
        best_support <- support
        best_confidence <- confidence
        best_lift <- max(gross_rules@quality$lift)
        best_rules <- gross_rules
      }
    }
  }
  #})
  len_rules <- length(best_rules)
  best_sup <- best_support
  best_conf <- best_confidence

  return (c(best_sup, best_conf, best_lift, len_rules))
}
