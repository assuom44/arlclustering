\name{get_apriori_thresholds}
\alias{get_apriori_thresholds}
\title{Get Apriori Thresholds}
\description{
  This function finds the best thresholds for the Apriori algorithm based on the provided dataset.
}
\usage{
  get_apriori_thresholds(trx, support_range, confidence_range)
}
\arguments{
  \item{trx}{The transactional dataset.}
  \item{support_range}{A sequence specifying the range of support values to consider.}
  \item{confidence_range}{A sequence specifying the range of confidence values to consider.}
}
\examples{
  \dontrun{
    minSupp <- 0.1
    minConf <- 0.5
    best_thresholds <- get_apriori_thresholds(trx, support_range = seq(0.1, 0.5, by = 0.1), confidence_range = seq(0.5, 1, by = 0.1))
  }
}
