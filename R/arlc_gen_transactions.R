#' Get Transactional Dataset
#'
#' This function generates a transactional dataset from a graph dataset.
#'
#' @description This function takes a graph dataset as input, extracts its characteristics,
#' converts it to an adjacency matrix, and then to transactional dataset.
#' It filters out transactions with only one element and returns the resulting dataset.
#'
#' @param graph A graph object which could be loaded via the following call:
#' g <- arlc_get_network_dataset("./data/karate.gml", "Karate Club")
#'
#' @return A transactional dataset.
#'
#' @examples
#' trans <- arlc_gen_transactions(g$graph)
#'
#' @importFrom grDevices rainbow
#' @importFrom graphics legend par
#' @importFrom methods as
#' @importFrom stats median sd
#' @export

arlc_gen_transactions <- function(graph) {
  # Build the adjacency matriw
  adjMat <- as_adjacency_matrix(graph)
  #adjMat <- as.matrix(graph, "adjacency")
  transactions <- apply(adjMat, 1, function(row) paste(which(row == 1), collapse = " "))

  # Create an empty array to store the final result
  transactions_list <- character(length(transactions))

  for (i in seq_along(transactions_list)) {transactions_list[i] <- paste(i, transactions[i])}

  # Filter out transactions with only one element
  num_elements <- sapply(strsplit(transactions_list, " "), length)
  transactions_list <- transactions_list[lengths(strsplit(transactions_list, " ")) >= min(num_elements)]
  conv_all_trans <- strsplit(transactions_list, " ")
  transunique <- as(conv_all_trans, "transactions")
  trx <- as(unique (transunique), "transactions")

  return (trx)
}
