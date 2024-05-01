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
#' get_NonR_rules(gross_rules)
#' @export

get_NonR_rules <- function(gross_rules) {
  ## Cleaning rules
  # Remove redundant rules
  nonRR_rules <- gross_rules[!is.redundant(gross_rules)]
  
  # Compute number of non-redundant rules
  total_nonRedandunt_rules <- length(nonRR_rules)
  
  # Return result as a list
  return(list(total_nonRedandunt_rules = total_nonRedandunt_rules, nonRR_rules = nonRR_rules))
}




## Function that clean the gross rules and provide non Redundant Rules

#get_NonR_rules <- function (gross_rules) {
#  ## Cleaning rules
#  # 1. Non redendant rules
#  nonRR_rules <- NULL
#  nonRR_rules <- gross_rules[!is.redundant(gross_rules)]
  
#  # Compute number of Non Redundant rules:
#  total_nonRedandunt_rules <- 0
#  total_nonRedandunt_rules <- length(nonRR_rules)

#  return (total_nonRedandunt_rules, nonRR_rules)
#}
