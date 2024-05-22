#' Get Network Dataset
#'
#' This function loads a network dataset from a specified GML file and computes basic graph properties.
#'
#' @description This function reads a network dataset from a GML file, assigns node names, and calculates
#' various properties of the graph such as total edges, total nodes, and average degree.
#'
#' @param file The name of the GML file to be loaded.
#' @param label A label for the graph.
#'
#' @return A list containing the graph object and its properties: total edges, total nodes, and average degree.
#'
#' @examples
#' result <- get_network_dataset("karate.gml", "Karate Club")
#' print(result$graph)
#' print(result$total_edges)
#' print(result$total_nodes)
#' print(result$average_degree)
#' @import igraph
#' @export

arlc_get_network_dataset <- function(file, label) {
  # Load the graph from the GML file
  graphG <- igraph::read.graph(file = file, format = "gml")

  # Assign names to the vertices
  graphG$names <- igraph::V(graphG)$name

  # Compute graph properties
  total_edges <- igraph::gsize(graphG)
  total_nodes <- igraph::vcount(graphG)
  average_degree <- mean(igraph::degree(graphG))

  # Create a label for the graph
  graphLabel <- paste0(label, ' Network')

  # Return a list containing the graph and its properties
  return(list(
    graph = graphG,
    graphLabel = graphLabel,
    total_edges = total_edges,
    total_nodes = total_nodes,
    average_degree = average_degree
  ))
}
