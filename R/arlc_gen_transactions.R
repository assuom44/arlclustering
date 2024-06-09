#' Get Transactional Dataset
#'
#' This function generates a transactional dataset from a graph.
#'
#' @param graph A graph object.
#'
#' @return A transactional dataset.
#'
#' @examples
#' \dontrun{
#' library(igraph)
#' library(arules)
#' g <- make_ring(10)
#' trans <- arlc_gen_transactions(g)
#' }
#' @importFrom igraph get.adjacency
#' @importFrom methods as
#' @importFrom arules as
#' @export

arlc_gen_transactions <- function(graph) {
  if (!"igraph" %in% class(graph)) {
    stop("The input must be an igraph object.")
  }

  # Convert the graph to an adjacency matrix
  adjMat <- as.matrix(igraph::get.adjacency(graph))

  # Convert the adjacency matrix to transactions
  transactions_list <- apply(adjMat, 1, function(row) {
    nodes <- which(row == 1)
    if (length(nodes) > 1) {
      nodes
    } else {
      NULL
    }
  })

  # Remove NULL values
  transactions_list <- transactions_list[!sapply(transactions_list, is.null)]

  # Ensure transactions_list is a list
  transactions_list <- lapply(transactions_list, as.vector)

  # Remove duplicate transactions
  transunique <- unique(transactions_list)

  # Convert to a transactions object
  trx <- arules::as(transunique, "transactions")

  return(trx)
}
