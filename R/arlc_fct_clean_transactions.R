

arlc_fct_clean_transactions <- function(all_sets, file, genFileLog = FALSE, debugMode = FALSE) {
  # Start measuring time
  start_time <- Sys.time()

  # Check if the file variable is provided and properly handle the trace file name
  if (genFileLog) {
    if (substr(file, start = nchar(file) - 3, stop = nchar(file)) == ".gml") {
      traceFileName <- paste0("output_", substr(file, start = 1, stop = nchar(file) - 4), ".spool")
    } else {
      traceFileName <- paste0("output_", file, ".spool")
    }
    sink(traceFileName, append = FALSE)
  }

  sets_to_exclude <- NULL

  # Iterate over each set
  for (i in seq_along(all_sets)) {
    if (genFileLog && debugMode) {
      cat('\nITERATION', i)
    }
    current_set <- all_sets[[i]]
    if (genFileLog && debugMode) {
      cat('->current_set:', current_set)
    }

    if (any(sapply(sets_to_exclude, function(set) all(current_set %in% set)))) {
      if (genFileLog && debugMode) {
        cat(' --> The set <current_set> already processed')
      }
      next
    }

    for (j in seq_along(all_sets)) {
      if (i == j) {
        next
      }
      if (genFileLog && debugMode) {
        cat('\n  SUB-ITERATION', j)
      }

      targeted_set <- all_sets[[j]]
      if (genFileLog && debugMode) {
        cat('    targeted_set   :', targeted_set)
      }

      if (any(sapply(sets_to_exclude, function(set) all(targeted_set %in% set)))) {
        next
      }

      projection_set <- current_set[which(current_set %in% targeted_set)]
      if (genFileLog && debugMode) {
        cat('    projection_set :', projection_set)
      }

      if (identical(projection_set, targeted_set)) {
        if (genFileLog && debugMode) {
          cat(' --> Both <target_set> & <projection_set> ARE IDENTICAL')
        }
        sets_to_exclude <- c(sets_to_exclude, list(targeted_set))
      }
    }
  }

  # Print the merged sets
  if (length(sets_to_exclude) == 0) {
    cat('\n ***** No full overlapped sets have been detected')
  } else {
    cat('\n ***** Total Fully Overlapped Communities: ', length(sets_to_exclude))
    cat("\n ==================================")
    for (i in seq_along(sets_to_exclude)) {
      cat("\n  Set ", i, ":", paste(sets_to_exclude[[i]], collapse = " "))
    }
  }

  filtered_sets <- all_sets[!sapply(all_sets, function(x) any(sapply(sets_to_exclude, function(y) all(x %in% y))))]
  cat('\n ***** Total Non Overlapped Communities: ', length(filtered_sets))
  cat("\n ==================================")
  for (i in seq_along(filtered_sets)) {
    cat("\n  Set ", i, ":", paste(filtered_sets[[i]], collapse = " "))
  }

  # Stop measuring time
  end_time <- Sys.time()
  # Calculate the elapsed time
  elapsed_time <- end_time - start_time
  # Print the elapsed time
  cat('\n=============================================')
  print(elapsed_time)

  # Close the text file
  if (genFileLog) {
    sink()
  }

  return(filtered_sets)
}
