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
#' result <- arlc_get_network_dataset("../data/karate.gml", "Karate Club")
#' print(result$graph)
#' print(result$graphName)
#' print(result$totalEdges)
#' print(result$totalNodes)
#' print(result$averageDegree)
#' @import igraph
#' @export

arlc_get_network_dataset <- function(file_path, label) {

    # Check if file exists and is readable
    if (!file.exists(file_path)) {
      stop("File does not exist: ", file_path)
    }
    if (file.access(file_path, 4) != 0) {
      stop("File is not readable: ", file_path)
    }

    # Attempt to read the GML file
    tryCatch({
      g <- igraph::read.graph(file_path, format = "gml")
      cat("Successfully loaded the network:", network_name, "\n")
      return(g)
    }, error = function(e) {
      stop("Error in reading GML file: ", file_path, "\n", e$message)
    })



  #stopifnot("label should be not null" = length(label) == 0)
  # Load the graph from the GML file
  graphG <- igraph::read.graph(file = file_path, format = "gml")

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
    graphName = graphLabel,
    graphLabel = graphLabel,
    totalEdges = total_edges,
    totalNodes = total_nodes,
    averageDegree = average_degree
  ))
}
