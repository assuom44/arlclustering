#' Get Transactional Dataset
#'
#' This function generates a transactional dataset from a graph.
#'
#' @description This function takes a graph object as input, extracts its characteristics, 
#' converts it to an adjacency matrix, and then to transactions. 
#' It filters out transactions with only one element and returns the resulting dataset.
#'
#' @param graph A graph object.
#'
#' @return A transactional dataset.
#'
#' @examples
#' get_trans(graph)
#' @import igraph
#' @export

get_trans <- function(graph) {
  # Display graph characteristics
  total_nodes <- igraph::vcount(graph)
  total_edges <- igraph::ecount(graph)
  average_degree <- mean(igraph::degree(graph))
  
  cat('--------------------------------------\n')
  cat('Number of Graph Components: ', total_nodes, '\n')
  cat('Number of Graph Edges     : ', total_edges, '\n')
  cat('Average Degree            : ', average_degree, '\n')
  cat('--------------------------------------\n')
  
  # Convert the graph to an adjacency matrix
  adjMat <- as.matrix(igraph::get.adjacency(graph))
  
  # Convert the adjacency matrix to transactions
  transactions <- apply(adjMat, 1, function(row) {
    nodes <- which(row == 1)
    paste(nodes, collapse = " ")
  })
  
  # Filter out transactions with only one element
  transactions <- transactions[lengths(strsplit(transactions, " ")) > 1]
  
  # Convert transactions to a transactions object
  trx <- as(transactions, "transactions")
  
  return (trx)
}








## get_trans
## a function that return the transactional dataset

#get_trans <- function (graph = p_graph) {
#  # Display graph characteristics :
#  g <- p_graph
#  total_nodes <- vcount(g)
#  total_edges <- ecount(g)
#  average_degree <- mean(degree (g))
#  # Display network Characteristics:
#  paste ('--------------------------------------')
#  paste ('Number of g components: ', total_nodes)
#  paste ('Number of g Edges     : ', total_edges)
#  paste ('Average_degree        : ', average_degree)
#  paste ('--------------------------------------')

#  # Convert the graph to an adjacency matrix:
#  adjMat <- as_adjacency_matrix(g)

#  # Convert the adjacency matrix to transactions:
#  transactions <- lapply(1:nrow(adjMat), function(i) {
#    nodes <- which(adjMat[i, ] == 1)
#    paste(nodes, collapse = " ")
#  })

#  # Create an empty array to store the final result
#  all_trans <- character(length(transactions))

#  #sorted rawdata
#  for (i in seq_along(all_trans)) {
#    #cat(i, transactions[i], "\n")
#    all_trans[i] <- paste(i, transactions[i])
#  }
#  num_elements <- sapply(strsplit(all_trans, " "), length)
#  minLenRules <- min(num_elements)
#  maxLenRules <- max(num_elements)
#  paste ('Auto-Minimum Length   : ', minLenRules)
#  paste ('Auto-Maximum Length   : ', maxLenRules)

#  # Remove transactions with only one element (Minimum Community Members)
#  all_trans <- all_trans[lengths(strsplit(all_trans, " ")) > minLenRules]

#  # all_trans conversion for apriori execution:
#  conv_all_trans <- strsplit(all_trans, " ")
#  transunique <- as(conv_all_trans, "transactions") 
#  trx <- as(unique (transunique), "transactions")
#  TransctionLength <- length(trx)
#  paste ('Checking Total Transactions after conversion: ', TransctionLength)
  
#  return (trx)
#}
