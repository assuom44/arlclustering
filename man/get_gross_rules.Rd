\name{get_gross_rules}
\alias{get_gross_rules}
\title{Get Gross Rules}
\description{
  This function executes the Apriori algorithm to generate gross association rules.
}
\usage{
  get_gross_rules(trx, minSupp, minConf, minLenRules, maxLenRules)
}
\arguments{
  \item{trx}{The transactional dataset.}
  \item{minSupp}{The minimum support threshold.}
  \item{minConf}{The minimum confidence threshold.}
  \item{minLenRules}{The minimum length of rules to consider.}
  \item{maxLenRules}{The maximum length of rules to consider.}
}
\examples{
  \dontrun{
    gross_rules <- get_gross_rules(trx, minSupp, minConf, minLenRules = 1, maxLenRules = Inf)
  }
}
