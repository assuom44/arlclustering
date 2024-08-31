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
#' \donttest{
#' library(arlclustering)
#' all_sets <- list(
#'   c(1, 2, 3),
#'   c(2, 3),
#'   c(4, 5),
#'   c(5, 6, 7)
#' )
#' cleaned_sets <- arlc_fct_clean_transactions(all_sets)
#' message(cleaned_sets)
#' }
#'
#' @export

arlc_fct_clean_transactions <- function(all_sets) {
  # Sort each set to handle unordered sets
  sorted_sets <- lapply(all_sets, sort)

  # Remove exact duplicates
  unique_sets <- unique(sorted_sets)

  # Initialize a list to keep track of sets that are not subsets of others
  non_subsets <- list()

  # Check for subsets
  for (i in seq_along(unique_sets)) {
    is_subset <- FALSE
    for (j in seq_along(unique_sets)) {
      if (i != j && all(unique_sets[[i]] %in% unique_sets[[j]])) {
        is_subset <- TRUE
        break
      }
    }
    if (!is_subset) {
      non_subsets <- c(non_subsets, list(unique_sets[[i]]))
    }
  }

  return(non_subsets)
}


