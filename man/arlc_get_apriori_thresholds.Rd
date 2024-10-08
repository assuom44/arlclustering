% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/arlc_get_apriori_thresholds.R
\name{arlc_get_apriori_thresholds}
\alias{arlc_get_apriori_thresholds}
\title{Get Apriori Thresholds}
\usage{
arlc_get_apriori_thresholds(trx, supportRange, Conf)
}
\arguments{
\item{trx}{A transaction dataset of class \code{transactions} from the \code{arules} package.}

\item{supportRange}{A sequence of values representing the range for minimum support.}

\item{Conf}{A sequence of values representing the range for minimum confidence.}
}
\value{
A list containing:
\item{minSupp}{The best minimum support value.}
\item{minConf}{The best minimum confidence value.}
\item{bestLift}{The highest lift value obtained.}
\item{lenRules}{The total number of gross rules generated.}
\item{ratio}{The ratio of generated rules to the total number of transactions.}
}
\description{
This function takes a transaction dataset and ranges for support and confidence,
computes the best thresholds, and returns the best minimum support, minimum confidence,
best lift, total number of gross rules, and ratio of generated rules to total number of transactions.
}
\details{
This function generates gross rules based on the best obtained thresholds.

This function iterates through the given ranges of support and confidence values,
applies the Apriori algorithm to find association rules for each pair of values, and selects
the pair that produces rules with the highest lift. The function then returns the best thresholds
along with the lift, number of rules, and their ratio to the total transactions.
}
\examples{
\donttest{
library(arlclustering)
# Create a sample transactions dataset
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering")
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")
trans <- arlc_gen_transactions(g$graph)
supportRange <- seq(0.1, 0.2, by = 0.1)
Conf <- 0.5
params <- arlc_get_apriori_thresholds(trans, supportRange, Conf)
message(params$minSupp)
message(params$minConf)
message(params$bestLift)
message(params$lenRules)
message(params$ratio)
}

}
