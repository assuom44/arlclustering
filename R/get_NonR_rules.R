# Function that clean the gross rules and provide non Redundant Rules

get_NonR_rules <- function (gross_rules) {
  ## Cleaning rules
  # 1. Non redendant rules
  nonRR_rules <- NULL
  nonRR_rules <- gross_rules[!is.redundant(gross_rules)]
  
  # Compute number of Non Redundant rules:
  total_nonRedandunt_rules <- 0
  total_nonRedandunt_rules <- length(nonRR_rules)

  return (total_nonRedandunt_rules, nonRR_rules)
}
