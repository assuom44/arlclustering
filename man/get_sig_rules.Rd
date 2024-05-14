\name{get_sig_rules}
\alias{get_sig_rules}
\title{
  Get Significant Rules
}
\description{
  This function filters significant rules from a set of non-redundant rules.
}
\usage{
get_sig_rules(
  all_trans,
  nonRR_rules,
  method = "fisher",
  adjust = "bonferroni"
)
}
\arguments{
  \item{all_trans}{
    A dataframe containing all transactions.
  }
  \item{nonRR_rules}{
    A list of non-redundant rules.
  }
  \item{method}{
    The method used to determine significance (e.g., "fisher").
  }
  \item{adjust}{
    The adjustment method for p-values (e.g., "bonferroni").
  }
}
\details{
  This function takes all transactions and a set of non-redundant rules as input, and returns significant rules based on a specified method and adjustment.
}
\examples{
# Example usage of get_sig_rules
get_sig_rules(all_transactions, non_redundant_rules, method = "fisher", adjust = "bonferroni")
}
\seealso{
  Other functions related to association rule mining: \code{\link{get_trans}}, \code{\link{clean_final_rules}}
}
