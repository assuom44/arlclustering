\name{Fct_CleanOverlappingTrans}
\alias{Fct_CleanOverlappingTrans}
\title{
  Extract Pure and Overlapped Communities
}
\description{
  Extracts pure and overlapped communities from a set of input sets.
}
\usage{
Fct_CleanOverlappingTrans(
  all_sets,
  genFileLog = TRUE,
  debugMode = FALSE
)
}
\arguments{
  \item{all_sets}{
    A list of sets representing communities.
  }
  \item{genFileLog}{
    Logical. Whether to generate a log file. Default is \code{TRUE}.
  }
  \item{debug
