# get_trans
# a function that return the transactional dataset

get_trans <- function (graph = p_graph) {
  # Display graph characteristics :
  g <- p_graph
  total_nodes <- vcount(g)
  total_edges <- ecount(g)
  average_degree <- mean(degree (g))
  # Display network Characteristics:
  paste ('--------------------------------------')
  paste ('Number of g components: ', total_nodes)
  paste ('Number of g Edges     : ', total_edges)
  paste ('Average_degree        : ', average_degree)
  paste ('--------------------------------------')

  # Convert the graph to an adjacency matrix:
  adjMat <- as_adjacency_matrix(g)

  # Convert the adjacency matrix to transactions:
  transactions <- lapply(1:nrow(adjMat), function(i) {
    nodes <- which(adjMat[i, ] == 1)
    paste(nodes, collapse = " ")
  })

  # Create an empty array to store the final result
  all_trans <- character(length(transactions))

  #sorted rawdata
  for (i in seq_along(all_trans)) {
    #cat(i, transactions[i], "\n")
    all_trans[i] <- paste(i, transactions[i])
  }
  num_elements <- sapply(strsplit(all_trans, " "), length)
  minLenRules <- min(num_elements)
  maxLenRules <- max(num_elements)
  paste ('Auto-Minimum Length   : ', minLenRules)
  paste ('Auto-Maximum Length   : ', maxLenRules)

  # Remove transactions with only one element (Minimum Community Members)
  all_trans <- all_trans[lengths(strsplit(all_trans, " ")) > minLenRules]

  # all_trans conversion for apriori execution:
  conv_all_trans <- strsplit(all_trans, " ")
  transunique <- as(conv_all_trans, "transactions") 
  trx <- as(unique (transunique), "transactions")
  TransctionLength <- length(trx)
  paste ('Checking Total Transactions after conversion: ', TransctionLength)
  
  return (trx)
}
