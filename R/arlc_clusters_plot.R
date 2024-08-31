#' Plot Graph with Custom Layout and Communities
#'
#' This function plots a graph with specified aesthetics and highlights communities.
#'
#' @param g An igraph object representing the graph.
#' @param graphLabel A character string for the graph label to be displayed in the title.
#' @param clusters A list of clusters to highlight in the plot.
#'
#' @return The function produces a plot as a side effect.
#'
#' @examples
#' \donttest{
#' library(arlclustering)
#' g <- make_ring(10)
#' clusters <- list(1:5, 6:10)
#' arlc_clusters_plot(g, "Sample Graph", clusters)
#' }
#' @importFrom graphics legend par
#' @importFrom grDevices rainbow
#' @import  igraph
#' @export

arlc_clusters_plot <- function(g, graphLabel, clusters) {
  # Display obtained clusters
  message("Total Identified Clusters: ", length(clusters))
  message("\n =========================  ")
  for (i in 1:length(clusters)) {
    message("\n  Community ", sprintf("%02d", i), ":", paste(clusters[[i]], collapse = " "))
  }
  message("\n =========================  ")

  if (vcount(g) <= 100) {
    # Calculate the layout once
    layout <- layout_with_fr(g)
    cluster_colors <- rainbow(length(clusters))

    # Set up the plotting area to have two plots side-by-side
    oldpar <- par(mfrow = c(1, 2))  # Store current par settings
    on.exit(par(oldpar))  # Ensure par is reset when the function exits

    # Plot the original network
    plot(g,
         layout = layout,
         vertex.color = "gray",
         vertex.label.color = "black",
         vertex.label.size = 0.5,
         vertex.label.cex = 0.7,
         vertex.label.dist = 0,
         edge.arrow.size = 0.3,
         edge.color = "gray",
         main = paste0("Initial ", graphLabel))

    # Plot the network with clusters highlighted
    plot(g,
         layout = layout,
         mark.groups = clusters,
         vertex.color = "gray",
         vertex.label.color = "black",
         vertex.label.size = 0.5,
         vertex.label.cex = 0.7,
         vertex.label.dist = 0,
         main = "ARLClustering",
         edge.arrow.size = 0.3,
         edge.color = "gray")

    # Add a legend to the second plot (optional)
    legend("topleft",
           legend = 1:length(clusters),
           ncol = 5,
           fill = cluster_colors,
           title = "Clusters",
           cex = 0.6,
           inset = c(-0.1, 0),  # Adjusting the inset to place legend outside
           bty = "n",
           pt.cex = 1.0,
           xpd = TRUE)  # Allow legend to be drawn outside the plot

    # Reset to default single plot layout
    par(mfrow = c(1, 1))
  }
}
