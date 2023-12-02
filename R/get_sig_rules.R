# Function that return significant rules:

get_sig_rules <- function (all_trans, nonRR_rules) {
  # significant rules
  sigR_nnRR_Rules <- NULL
  sigR_nnRR_Rules <- nonRR_rules[!is.significant( nonRR_rules, 
                                                   all_trans, 
                                                   method = "fisher", 
                                                   adjust = "bonferroni" #'bonferroni', 'holm'
                                                  )]
  if (length(sigR_nnRR_Rules) < 1 ) {
    cat('rule set is null')
    sigR_nnRR_Rules <- nonRR_rules
  }
  total_nonRedandant_signif_rules <- 0
  total_nonRedandant_signif_rules <- length(sigR_nnRR_Rules)

  return (total_nonRedandant_signif_rules, sigR_nnRR_Rules)
}
