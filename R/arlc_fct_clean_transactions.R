

arlc_fct_clean_transactions <- function(all_sets) {


  sets_to_exclude <- NULL

  # Iterate over each set
  for (i in seq_along(all_sets)) {
    current_set <- all_sets[[i]]

    if (any(sapply(sets_to_exclude, function(set) all(current_set %in% set)))) {next}

    for (j in seq_along(all_sets)) {
      if (i == j) {next}

      targeted_set <- all_sets[[j]]

      if (any(sapply(sets_to_exclude, function(set) all(targeted_set %in% set)))) {next}

      projection_set <- current_set[which(current_set %in% targeted_set)]

      if (identical(projection_set, targeted_set)) {
        sets_to_exclude <- c(sets_to_exclude, list(targeted_set))
      }
    }
  }

  # Print the merged sets
  if (length(sets_to_exclude) == 0) {
    cat('\n ***** No full overlapped sets have been detected')
    total_overlapped_clusters <- 0
  } else {
    #cat('\n ***** Total Fully Overlapped Communities: ', length(sets_to_exclude))
    total_overlapped_clusters <- length(sets_to_exclude)

    for (i in seq_along(sets_to_exclude)) {
      overlapped_clusters <- paste0("\n  Set ", i, ":", paste(sets_to_exclude[[i]], collapse = " "))
    }
  }

  filtered_sets <- all_sets[!sapply(all_sets, function(x) any(sapply(sets_to_exclude, function(y) all(x %in% y))))]
  total_non_overlapped_clusters <- length(filtered_sets)

  #cat('\n ***** Total Non Overlapped Communities: ', length(filtered_sets))
  for (i in seq_along(filtered_sets)) {
    non_overlapped_clusters <- paste0("\n  Set ", i, ":", paste(filtered_sets[[i]], collapse = " "))
  }

  return(filtered_sets)

  return(list(
    TotOverlapedCommunity = total_overlapped_clusters,
    OverlapedCommunity = overlapped_clusters,
    TotNonOverlapedCommunity = total_non_overlapped_clusters,
    NonOverlapedCommunity = non_overlapped_clusters
  ))
}
