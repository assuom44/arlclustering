
#' Plot Graph with Custom Layout and Communities
#'
#' This function plots a graph with specified aesthetics and highlights communities.
#'
#' @param g An igraph object representing the graph.
#' @param clusters A list of clusters to highlight in the plot.
#'
#' @return No return value. The function produces a plot as a side effect.
#'
#' @examples
#' \dontrun{
#' library(igraph)
#' g <- make_ring(10)
#' arlc_clusters_plot(g$graph, g$graphLabel, c$Clusters)
#' }
#' @import igraph
#' @export

arlc_clusters_plot <- function(g, graphLabel, clusters) {

  # Plot the graph with specified parameters
  # plot( g,
  #            vertex.color = "gray",
  #            vertex.size = 10,
  #            vertex.label.cex = 1.0,
  #            vertex.label.dist = 0,
  #            vertex.label.color = "black",
  #            edge.color = "gray",
  #            edge.arrow.size = 0,
  #            main = paste('Communities in ', graphLabel),
  #            layout = layout_with_fr, #layout.fruchterman.reingold(g), kamada.kawai(); reingold.tilford(); fruchterman.reingold(); layout_nicely(),
  #            mark.groups = clusters)

  plot (g,
        mark.groups = clusters,
        vertex.color = "gray",
        vertex.label.size = .5, vertex.label.cex = .7, edge.arrow.size=.5, vertex.label.dist=0, vertex.label.color = "black",
        main=paste0("Plotting ARLClustering result on ", graphLabel),
        edge.arrow.size = 0.3, edge.color = "gray",
        layout=layout.fruchterman.reingold #layout.graphopt #layout.fruchterman.reingold #layout.kamada.kawai
  )
  #legend("topright", legend = 1:length(clusters), title = "Clusters")

}

