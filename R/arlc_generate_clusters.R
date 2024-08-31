#' Generate Clusters
#'
#' This function generates potential clusters based on preprocessed rules.
#'
#' @description This function takes a vector of preprocessed rules, combines elements
#' starting with the same value, groups segments by the starting value, sorts elements
#' within each segment, and returns potential clusters.
#'
#' @param vec A vector of preprocessed rules.
#'
#' @return A list of unique and potential clusters.
#'
#' @examples
#' \donttest{
#' library(arlclustering)
#' # Create a sample vector
#' vec <- list(c(1, 2, 3), c(2, 3, 4), c(5, 6))
#' # Generate clusters
#' clusters <- arlc_generate_clusters(vec)
#' }
#' @importFrom graphics legend par
#' @importFrom grDevices rainbow
#' @importFrom igraph plot.igraph layout_with_fr
#' @export
#'

arlc_generate_clusters <- function(vec) {
  # Combine elements starting with the same value and remove duplicates
  combined_result <- lapply(vec, function(v) unique(unlist(v)))

  # Group segments by the starting value
  grouped_result <- split(combined_result, sapply(combined_result, `[`, 1))

  # Sort elements within each segment
  sorted_result <- lapply(grouped_result, function(v) sort(unique(unlist(v))))

  # Call external function to generate clusters
  clusters <- arlc_fct_clean_transactions(sorted_result)

  # Display obtained clusters
  # if (genFileLog) {
  #   message("Total Clusters: ", length(clusters))
  #   for (i in 1:length(clusters)) {
  #     message("\n  Set ", i, ":", paste(clusters[[i]], collapse = " "))
  #   }
  # }

  #return(clusters)
  return(list(
     TotClusters = length(clusters),
     Clusters = clusters
  ))
}
