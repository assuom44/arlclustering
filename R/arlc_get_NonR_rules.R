#' Get Non-Redundant Rules
#'
#' This function cleans the gross rules and provides non-redundant rules.
#'
#' @description This function takes a set of gross rules, removes redundant rules,
#' and returns the total number of non-redundant rules along with the non-redundant rules.
#'
#' @param gross_rules A vector or dataframe of gross rules.
#'
#' @return A list containing the total number of non-redundant rules and the non-redundant rules.
#'
#' @examples
#' \donttest{
#' library(arlclustering)
#' rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))
#' non_redundant_rules <- arlc_get_NonR_rules(rules)
#' }
#' @importFrom arules is.redundant
#' @export

arlc_get_NonR_rules <- function(gross_rules) {
  ## Cleaning rules
  # Remove redundant rules
  nonRR_rules <- gross_rules[!is.redundant(gross_rules)]
  if (length(nonRR_rules) < 1) {
    message('Non-redundant rule set is the same as the gross rule set...')
    nonRR_rules <- gross_rules
  }
  # Compute number of non-redundant rules
  total_nonRedandunt_rules <- length(nonRR_rules)

  # Return result as a list
  return(list(TotFiltredRules = total_nonRedandunt_rules,
              FiltredRules = nonRR_rules))
}
