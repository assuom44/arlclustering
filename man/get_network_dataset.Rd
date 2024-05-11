\name{get_network_dataset}
\alias{get_network_dataset}
\title{Load Network Dataset}
\description{
  This function loads a network dataset and converts it into a graph object.
}
\usage{
  get_network_dataset(dataset = DS)
}
\arguments{
  \item{dataset}{The name of the dataset to load.}
}
\examples{
  \dontrun{
    graph <- get_network_dataset(dataset = "your_dataset_name")
  }
}
