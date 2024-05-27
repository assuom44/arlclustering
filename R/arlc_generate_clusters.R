#' Generate Clusters
#'
#' This function generates potential clusters based on preprocessed rules.
#'
#' @description This function takes a vector of preprocessed rules, combines elements
#' starting with the same value, groups segments by the starting value, sorts elements
#' within each segment, and returns potential clusters.
#'
#' @param vec A vector of preprocessed rules.
#' @param minSupp The minimum support threshold for generating clusters.
#' @param minConf The minimum confidence threshold for generating clusters.
#'
#' @return A list of potential clusters.
#'
#' @examples
#' arlc_generate_clusters(vec, minSupp = 0.5, minConf = 0.6)
#' @export

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
  #   cat("Total Clusters: ", length(clusters))
  #   for (i in 1:length(clusters)) {
  #     cat("\n  Set ", i, ":", paste(clusters[[i]], collapse = " "))
  #   }
  # }

  #return(clusters)
  return(list(
     TotClusters = length(clusters),
     Clusters = clusters
  ))
}
