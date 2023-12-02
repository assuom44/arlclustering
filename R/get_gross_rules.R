# Function that execute the apriori algorithm to get the gross rules
#    This function is using the output of the previous function get_thresholds ()

get_gross_rules <- function (trx, minSupp, minConf, minLenRules, maxLenRules) {
  # Preparing apriori parameters into one variable:
  params <- list(support=minSupp, confidence=minConf, minlen=minLenRules, maxlen=maxLenRules)
  # Apriori Execution:
  gross_rules <- apriori(trx, parameter=params, target="rules")
  # Computing total gross rules
  total_rules_with_length_filter <- length(gross_rules)

  return (total_rules_with_length_filter, gross_rules)
}
