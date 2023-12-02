# This function tends to generate potential clusters based on the preprocesed rules

generate_clusters <- function (vec, minSupp, minConf) {
  # Init result container
  result <- vec
  
  # Combine elements starting with the same value and remove duplicates
  combined_result <- lapply(result, function(vec) {
    unique(unlist(vec))
  })
  
  # Group segments by the starting value
  grouped_result <- split(combined_result, sapply(combined_result, `[`, 1))
  
  # Sort elements within each segment
  sorted_result <- lapply(grouped_result, function(vec) {
    sort(unique(unlist(vec)))
  })
  
  best_support <- minSupp
  best_confidence <- minConf
  
  genFileLog <- TRUE # Activate generated spool (FALSE if not)
  debugModeOption <- FALSE # Disable debuging mode (TRUE if activated option)
  clusters <- Fct_CleanOverlappingTrans( sorted_result, 
                                         genFileLog = genFileLog,  
                                         debugMode  = debugModeOption) 

  # Display obtained clusters:
  if (genFileLog) {
    cat ("Total Clusters: ", length(clusters))
    for (i in 1:length(clusters)) {
        cat("\n  Set ", i, ":", paste(clusters[[i]], collapse = " "))
    }
  }

  return (clusters)
}
