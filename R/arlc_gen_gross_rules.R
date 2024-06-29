#' Get Gross Rules
#'
#' This function generates gross association rules from transactions.
#'
#' @param transactions A transactions object.
#' @param minSupp Minimum support threshold.
#' @param minConf Minimum confidence threshold.
#' @param minLenRules Minimum length of rules.
#' @param maxLenRules Maximum length of rules.
#'
#' @return A set of gross association rules.
#'
#' @examples
#' \dontrun{
#' library(arules)
#' # Create a sample transactions dataset
#' data("Adult")
#' transactions <- as(Adult, "transactions")
#' # Generate gross rules
#' arlc_gen_gross_rules(transactions, minSupp = 0.1, minConf = 0.5, minLenRules = 1, maxLenRules = 3)
#' }
#' @export

arlc_gen_gross_rules <- function(transactions, minSupp, minConf, minLenRules, maxLenRules) {
  # Ensure the transactional data is of class transactions
  if (!inherits(transactions, "transactions")) {
    stop("The transactions object must be of class 'transactions'.")
  }
  # Ensure minSupp and minConf are numeric
  #if (!is.numeric(minSupp) || !is.numeric(minConf) || !is.numeric(minLenRules) || !is.numeric(maxLenRules) ) {
  #  stop("minSupp, minConf, minLenRules and maxLenRules must be numeric values.")
  #}

  # if (maxLenRules > length(transactions))
  # {
  #   maxLenRules <- length(transactions)
  # }
  # Execute Apriori algorithm with specified parameters
  gross_rules <- apriori(transactions,
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
