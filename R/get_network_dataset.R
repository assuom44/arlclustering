# Funciton to load network dataset

get_network_dataset <- function (dataset = DS) {
  # Create an empty graph object
  graph <- graph.empty()
  
  # Load dataset
  network_data <- read.table(DS, header = FALSE)
  
  # Add edges to the graph
  graph <- graph_from_data_frame(network_data, directed = FALSE)

  return (graph)
}



