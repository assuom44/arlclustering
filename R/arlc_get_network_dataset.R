#' Get Network Dataset
#'
#' This function loads a network dataset from a specified GML file and computes basic graph properties.
#'
#' @description This function reads a network dataset from a GML file, assigns node names, and calculates
#' various properties of the graph such as total edges, total nodes, and average degree.
#'
#' @param file_name The file name
#' @param label A label for the graph.
#'
#' @return A list containing the graph object and its properties: total edges, total nodes, and average degree.
#'
#' @examples
#' loaded_karate <- arlc_get_network_dataset("./data/karate.gml", "Karate Club")
#' loaded_karate
#' print(loaded_karate$graph)
#' print(loaded_karate$graphLabel)
#' print(loaded_karate$totalEdges)
#' print(loaded_karate$graphEdges)
#' print(loaded_karate$totalNodes)
#' print(loaded_karate$graphNodes)
#' print(loaded_karate$averageDegree)
#'
#' loaded_dolphins <- arlc_get_network_dataset("./data/dolphins.gml", "Dolphins")
#' loaded_dolphins
#' print(loaded_dolphins$graph)
#' print(loaded_dolphins$graphLabel)
#' print(loaded_dolphins$totalEdges)
#' print(loaded_dolphins$graphEdges)
#' print(loaded_dolphins$totalNodes)
#' print(loaded_dolphins$graphNodes)
#' print(loaded_dolphins$averageDegree)
#'
#' @import igraph
#' @export

arlc_get_network_dataset <- function(file_name, label) {

  # Check if file exists and is readable
  if (!file.exists(file_name)) {
    stop("The network file does not exist: ", file_name)
  }
  file_path <- system.file("extdata", file_name, package = "ARLClustering")

  # --------------------------------------------------------------------------------------
  # Attempt to read the GML file
  tryCatch({
    # Load the graph from the GML file
    graphG <- read.graph(file = file_path, format = "gml")

    # Assign names to the vertices
    graphG$names <- V(graphG)
    graphG$edges <- E(graphG)

    # Compute graph properties
    total_edges <- gsize(graphG)
    total_nodes <- vcount(graphG)
    average_degree <- mean(degree(graphG))

    # Create a label for the graph
    graph_label <- paste0(label, ' Network')

    # Return a list containing the graph and its properties
    return(list(
      graph = graphG,
      graphLabel = graph_label,
      totalEdges = total_edges,
      graphEdges = graphG$edges,
      totalNodes = total_nodes,
      graphNodes = graphG$names,
      averageDegree = average_degree
    ))
  }, error = function(e) {
    stop("Error in reading GML file: ", file_path, "\n", e$message)
  })
}
