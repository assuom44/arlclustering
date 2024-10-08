% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/arlc_gen_transactions.R
\name{arlc_gen_transactions}
\alias{arlc_gen_transactions}
\title{Get Transactional Dataset}
\usage{
arlc_gen_transactions(graph)
}
\arguments{
\item{graph}{A graph object.}
}
\value{
A transactional dataset.
}
\description{
This function generates a transactional dataset from a graph.
}
\examples{
\donttest{
library(arlclustering)
# Create a sample transactions dataset
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering")
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)
}
}
