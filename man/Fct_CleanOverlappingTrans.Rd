\name{Fct_CleanOverlappingTrans}
\alias{Fct_CleanOverlappingTrans}
\title{Clean Overlapping Transactions}
\description{
  This function cleans overlapping transactions from a given set of sorted results.
}
\usage{
Fct_CleanOverlappingTrans(sorted_result, genFileLog = TRUE, debugMode = FALSE)
}
\arguments{
  \item{sorted_result}{A list of sorted transaction results.}
  \item{genFileLog}{Logical, if \code{TRUE}, generates a log file with the results. Default is \code{TRUE}.}
  \item{debugMode}{Logical, if \code{TRUE}, activates debugging mode. Default is \code{FALSE}.}
}
\details{
  The function processes the sorted transaction results to remove overlapping transactions.
  It can generate a log file for the cleaned transactions if \code{genFileLog} is set to \code{TRUE}.
}
\value{
  A list of cleaned transactions without overlaps.
}
\examples{
# Example usage of Fct_CleanOverlappingTrans
sorted_result <- list(c(1, 2, 3), c(2, 3, 4), c(3, 4, 5))
cleaned_transactions <- Fct_CleanOverlappingTrans(sorted_result, genFileLog = TRUE, debugMode = FALSE)
print(cleaned_transactions)
}
\seealso{
  \code{\link{another_related_function}}
}
\author{
  MED Tijani
}
\keyword{transaction}
\keyword{clean}
