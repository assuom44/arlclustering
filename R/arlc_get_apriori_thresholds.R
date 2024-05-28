#' Get Apriori Thresholds
#'
#' This function generates gross rules based on the best obtained thresholds.
#'
#' @description This function takes a transaction dataset and ranges for support and confidence,
#' computes the best thresholds, and returns the best minimum support, minimum confidence,
#' best lift, total number of gross rules, and ratio of generated rules to total number of transactions.
#'
#' @param trx A transaction dataset.
#' @param supportRange A sequence of values representing the range for minimum support.
#' @param confidenceRange A sequence of values representing the range for minimum confidence.
#'
#' @return A list containing the best minimum support, minimum confidence, best lift,
#' total number of gross rules, and ratio of generated rules to total number of transactions.
#' g <- arlc_get_network_dataset("./data/karate.gml", "Karate Club")
#' trx <- arlc_gen_transactions(g$graph)
#'
#'
#' @examples
#' arlc_get_apriori_thresholds(trx, supportRange = seq(0.1, 0.9, by = 0.1), confidenceRange = seq(0.5, 0.9, by = 0.1))
#' @export

arlc_get_apriori_thresholds <- function(trx, supportRange, confidenceRange) {
  # Initialize variables
  min_supp <- 0
  min_conf <- 0
  best_lift <- 0
  len_rules <- 0

  # Get thresholds based on support and confidence ranges
  output_list <- arlc_fct_get_best_apriori_thresholds( trx,
                                                       supportRange,
                                                       confidenceRange) #, minLenRules, maxLenRules)

  # Assign values from output_list
  min_supp <- format(output_list[[1]], scientific = FALSE)
  min_conf <- format(output_list[[2]], scientific = FALSE)
  best_lift <-  format(output_list[[3]], scientific = FALSE)
  len_rules <- output_list[[4]]

  ##print(paste('-- > Generated rules represent approximately ', round(lenRules / length(trx), digits = 0), ' times the total number of transactions'))

  # Return results as a list
  return(list(minSupp = min_supp,
              minConf = min_conf,
              bestLift = best_lift,
              lenRules = len_rules,
              #ratio = paste0(round(len_rules / length(trx), digits = 0), " times the total number of nodes")
              ratio = round(len_rules / length(trx), digits = 0)
             )
         )
}
