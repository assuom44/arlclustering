\name{get_best_thresholds}
\alias{get_best_thresholds}
\title{Get Best Apriori Thresholds}
\description{
  This function determines the best Apriori thresholds for a given transaction dataset.
}
\usage{
get_best_thresholds(
  transactions,
  support_range,
  confidence_range
)
}
\arguments{
  \item{transactions}{
    A transaction dataset.
  }
  \item{support_range}{
    A sequence of values representing the range for minimum support.
  }
  \item{confidence_range}{
    A sequence of values representing the range for minimum confidence.
  }
}
\details{
  This function takes a transaction dataset and ranges for support and confidence,
  runs the Apriori algorithm with various combinations of support and confidence values,
  and returns the best support, confidence, lift, and number of rules found.
}
\examples{
get_best_thresholds(transactions, support_range = seq(0.1, 0.9, by = 0.1),
                    confidence_range = seq(0.5, 0.9, by = 0.1))
}
\keyword{utilities}
\seealso{
  Other functions related to Apriori thresholding: \code{\link{get_gross_rules}}
}
