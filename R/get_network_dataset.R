#' Get Network Dataset
#'
#' This function loads a network dataset and creates a graph object.
#'
#' @description This function takes the name of a dataset as input, loads the dataset, and creates a graph object from the data.
#'
#' @param dataset The name of the dataset to be loaded. Default is set to DS.
#'
#' @return A graph object representing the network dataset.
#'
#' @examples
#' get_network_dataset("karate")
#' @import igraph
#' @export

get_network_dataset <- function(dataset = "karate") {
  # Load dataset
  network_data <- igraphdata::get.data.graph(dataset)
  
  # Create a graph object
  graph <- igraph::graph_from_data_frame(network_data$edges, directed = FALSE)
  
  return(graph)
}





## Funciton to load network dataset

#get_network_dataset <- function (dataset = DS) {
#  # Create an empty graph object
#  graph <- graph.empty()
  
#  # Load dataset
#  network_data <- read.table(DS, header = FALSE)
  
#  # Add edges to the graph
#  graph <- graph_from_data_frame(network_data, directed = FALSE)

#  return (graph)
#}



