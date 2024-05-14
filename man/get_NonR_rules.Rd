\name{get_NonR_rules}
\alias{get_NonR_rules}
\title{
  Get Non-Redundant Rules
}
\description{
  This function cleans the gross rules and provides non-redundant rules.
}
\usage{
get_NonR_rules(gross_rules)
}
\arguments{
  \item{gross_rules}{
    A vector or dataframe of gross rules.
  }
}
\details{
  This function takes a set of gross rules, removes redundant rules, and returns the total number of non-redundant rules along with the non-redundant rules.
}
\value{
  A list containing the total number of non-redundant rules and the non-redundant rules.
}
\examples{
gross_rules <- c("A -> B", "B -> C", "A -> D", "C -> D", "B -> A")
get_NonR_rules(gross_rules)
}
\seealso{
  Other functions related to rule cleaning: \code{\link{clean_final_rules}}, \code{\link{generate_clusters}}
}
\keyword{utilities}
