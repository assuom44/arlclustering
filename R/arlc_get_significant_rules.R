#' Get Significant Rules
#'
#' This function filters significant rules from a set of non-redundant rules.
#'
#' @description This function takes all transactions and a set of non-redundant rules as input,
#' and returns significant rules based on a specified method and adjustment.
#'
#' @param all_trans A dataframe containing all transactions.
#' @param nonRR_rules A list of non-redundant rules.
#'
#' @return A list containing the total number of significant non-redundant rules and the significant rules themselves.
#'
#' @examples
#' \dontrun{
#' arlc_get_significant_rules(all_trans, nonRR_rules)
#' }
#' @importFrom arules is.significant
#' @export

arlc_get_significant_rules <- function(all_trans, nonRR_rules) {
  # is.significant filter Parameters
  method = "fisher"
  adjust = "bonferroni" #'bonferroni', 'holm'

  # Get significant rules
  sigR_nnRR_Rules <- nonRR_rules[!is.significant(nonRR_rules, all_trans, method, adjust)]

  if (length(sigR_nnRR_Rules) < 1) {
    #cat('Significant rule set is the same as the redundant rule set...')
    sigR_nnRR_Rules <- nonRR_rules
  }

  total_nonRedandant_signif_rules <- length(sigR_nnRR_Rules)

  return(list(TotFiltredRules = total_nonRedandant_signif_rules,
              FiltredRules = sigR_nnRR_Rules
              )
         )
}
