#' Clean Transactions by Removing Overlapping Sets
#'
#' This function processes a list of sets and removes those that are fully overlapped by other sets.
#'
#' @param all_sets A list of sets where each set is a vector of elements.
#'
#' @return A list of sets with fully overlapped sets removed.
#'
#' @details The function iterates through each set and checks if it is fully overlapped by any other set. If a set is fully overlapped, it is excluded from the final list of sets. The result is a list of sets with no fully overlapped sets.
#'
#' @examples
#' \dontrun{
#' all_sets <- list(
#'   c(1, 2, 3),
#'   c(2, 3),
#'   c(4, 5),
#'   c(5, 6, 7)
#' )
#' cleaned_sets <- arlc_fct_clean_transactions(all_sets)
#' print(cleaned_sets)
#' }
#'
#' @export

arlc_fct_clean_transactions <- function(all_sets) {


  sets_to_exclude <- NULL

  # Iterate over each set
  for (i in seq_along(all_sets)) {
    current_set <- all_sets[[i]]

    if (any(sapply(sets_to_exclude, function(set) all(current_set %in% set)))) {next}  # Skip to next iteration

    for (j in seq_along(all_sets)) {
      if (i == j) {next}  # Skip to next iteration
      targeted_set <- all_sets[[j]]

      if (any(sapply(sets_to_exclude, function(set) all(targeted_set %in% set)))) {next} # Skip to next iteration

      projection_set <- current_set[which(current_set %in% targeted_set)]

      if (identical(projection_set, targeted_set)) {
        sets_to_exclude <- c(sets_to_exclude, list(targeted_set))
      }
    }
  }

  # Print the merged sets
  # if (length(sets_to_exclude) == 0) {
  #   #cat('\n ***** No full overlapped sets have been detected')
  #   total_overlapped_clusters <- 0
  # } else {
  #   #cat('\n ***** Total Fully Overlapped Communities: ', length(sets_to_exclude))
  #   total_overlapped_clusters <- length(sets_to_exclude)
  #
  #   for (i in seq_along(sets_to_exclude)) {
  #     overlapped_clusters <- paste0("\n  Set ", i, ":", paste(sets_to_exclude[[i]], collapse = " "))
  #   }
  # }

  filtered_sets <- all_sets[!sapply(all_sets, function(x) any(sapply(sets_to_exclude, function(y) all(x %in% y))))]
  #total_non_overlapped_clusters <- length(filtered_sets)

  #cat('\n ***** Total Non Overlapped Communities: ', length(filtered_sets))
  #for (i in seq_along(filtered_sets)) {
  #  non_overlapped_clusters <- paste0("\n  Set ", i, ":", paste(filtered_sets[[i]], collapse = " "))
  #}

  return(filtered_sets)

  # return(list(
  #   FilteredClusters = filtered_sets,
  #   TotOverlapedCommunity = total_overlapped_clusters,
  #   OverlapedCommunity = overlapped_clusters,
  #   TotNonOverlapedCommunity = total_non_overlapped_clusters,
  #   NonOverlapedCommunity = non_overlapped_clusters
  # ))
}
