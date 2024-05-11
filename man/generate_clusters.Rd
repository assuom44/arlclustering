\name{generate_clusters}
\alias{generate_clusters}
\title{Generate Clusters}
\description{
  This function generates potential clusters based on the preprocessed rules.
}
\usage{
  generate_clusters(vec, minSupp, minConf)
}
\arguments{
  \item{vec}{The preprocessed rules.}
  \item{minSupp}{The minimum support threshold.}
  \item{minConf}{The minimum confidence threshold.}
}
\examples{
  \dontrun{
    clusters <- generate_clusters(cleaned_rules, minSupp, minConf)
  }
}
