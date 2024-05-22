#' Get Transactional Dataset
#'
#' This function generates a transactional dataset from a graph dataset.
#'
#' @description This function takes a graph dataset as input, extracts its characteristics,
#' converts it to an adjacency matrix, and then to transactional dataset.
#' It filters out transactions with only one element and returns the resulting dataset.
#'
#' @param graph A graph object.
#'
#' @return A transactional dataset.
#'
#' @examples
#' get_trans(graph)
#' @import igraph
#' @import arules
#' @export

arlc_get_transactions <- function(graph) {
  # Display graph characteristics
  total_nodes <- igraph::vcount(graph)
  total_edges <- igraph::ecount(graph)
  average_degree <- mean(igraph::degree(graph))

  # Convert the graph to an adjacency matrix
  adjMat <- as.matrix(igraph::get.adjacency(graph))

  # Convert the adjacency matrix to transactions
  transactions_list <- apply(adjMat, 1, function(row) {
    nodes <- which(row == 1)
    nodes
  })

  # Filter out transactions with only one element
  transactions_list <- transactions_list[lengths(transactions_list) > 1]

  # Convert transactions list to a transactions object
  trx <- arules::as(transactions_list, "transactions")

  return (trx)
}
