\name{get_trans}
\alias{get_trans}
\title{Generate Transactional Dataset}
\description{
  This function generates a transactional dataset from a graph for association rule mining.
}
\usage{
  get_trans(graph = p_graph)
}
\arguments{
  \item{graph}{The graph object from which to generate the transactional dataset.}
}
\examples{
  \dontrun{
    trx <- get_trans(graph)
  }
}
