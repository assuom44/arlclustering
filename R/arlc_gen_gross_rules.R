#' Get Gross Rules
#'
#' This function executes the Apriori algorithm to generate gross rules based on the given parameters.
#'
#' @description This function takes a transaction dataset and minimum support, confidence, minimum length, and maximum length of rules,
#' and executes the Apriori algorithm to generate gross rules.
#'
#' @param trx A transaction dataset.
#' @param minSupp Minimum support threshold for the Apriori algorithm.
#' @param minConf Minimum confidence threshold for the Apriori algorithm.
#' @param minLenRules Minimum length of the rules to be generated.
#' @param maxLenRules Maximum length of the rules to be generated.
#'
#' @return A list containing the total number of gross rules with length filter and the gross rules themselves.
#'
#' @examples
#' arlc_gen_gross_rules(transactions, minSupp = 0.1, minConf = 0.5, minLenRules = 1, maxLenRules = 3)
#' @import arules
#' @export

arlc_gen_gross_rules <- function(trx, minSupp, minConf, minLenRules, maxLenRules) {
  # Ensure the transactional data is of class transactions
  if (!inherits(trx, "transactions")) {
    stop("The trx object must be of class 'transactions'.")
  }
  # Ensure minSupp and minConf are numeric
  #if (!is.numeric(minSupp) || !is.numeric(minConf) || !is.numeric(minLenRules) || !is.numeric(maxLenRules) ) {
  #  stop("minSupp, minConf, minLenRules and maxLenRules must be numeric values.")
  #}

  # Execute Apriori algorithm with specified parameters
  gross_rules <- apriori(trx,
                         parameter = list(support = as.numeric(minSupp),
                                          confidence = as.numeric(minConf),
                                          minlen = as.numeric(minLenRules),
                                          maxlen = as.numeric(maxLenRules)),
                         target = "rules")

  # Compute the total number of gross rules with length filter
  total_rules_with_length_filter <- length(gross_rules)

  # Return the total number of gross rules with length filter and the gross rules themselves
  return(list(TotalRulesWithLengthFilter = total_rules_with_length_filter,
              GrossRules = gross_rules))
}
