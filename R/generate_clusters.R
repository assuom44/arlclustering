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
#' generate_clusters(vec, minSupp = 0.5, minConf = 0.6)
#' @import Fct_CleanOverlappingTrans
#' @export

generate_clusters <- function(vec, minSupp, minConf) {
  # Combine elements starting with the same value and remove duplicates
  combined_result <- lapply(vec, function(v) unique(unlist(v)))
  
  # Group segments by the starting value
  grouped_result <- split(combined_result, sapply(combined_result, `[`, 1))
  
  # Sort elements within each segment
  sorted_result <- lapply(grouped_result, function(v) sort(unique(unlist(v))))
  
  # Call external function to generate clusters
  genFileLog <- TRUE # Activate generated spool (FALSE if not)
  debugModeOption <- FALSE # Disable debug mode (TRUE if activated option)
  clusters <- Fct_CleanOverlappingTrans(sorted_result, 
                                         genFileLog = genFileLog,  
                                         debugMode  = debugModeOption) 
  
  # Display obtained clusters
  if (genFileLog) {
    cat("Total Clusters: ", length(clusters))
    for (i in 1:length(clusters)) {
      cat("\n  Set ", i, ":", paste(clusters[[i]], collapse = " "))
    }
  }
  
  return(clusters)
}

                          
                          

# This function tends to generate potential clusters based on the preprocesed rules
#generate_clusters <- function (vec, minSupp, minConf) {
#  # Init result container
#  result <- vec
  
#  # Combine elements starting with the same value and remove duplicates
#  combined_result <- lapply(result, function(vec) {
#    unique(unlist(vec))
#  })
  
#  # Group segments by the starting value
#  grouped_result <- split(combined_result, sapply(combined_result, `[`, 1))
  
#  # Sort elements within each segment
#  sorted_result <- lapply(grouped_result, function(vec) {
#    sort(unique(unlist(vec)))
#  })
  
#  best_support <- minSupp
#  best_confidence <- minConf
  
#  genFileLog <- TRUE # Activate generated spool (FALSE if not)
#  debugModeOption <- FALSE # Disable debuging mode (TRUE if activated option)
#  clusters <- Fct_CleanOverlappingTrans( sorted_result, 
#                                         genFileLog = genFileLog,  
#                                         debugMode  = debugModeOption) 

# # Display obtained clusters:
#  if (genFileLog) {
#    cat ("Total Clusters: ", length(clusters))
#    for (i in 1:length(clusters)) {
#        cat("\n  Set ", i, ":", paste(clusters[[i]], collapse = " "))
#    }
#  }

#  return (clusters)
#}
