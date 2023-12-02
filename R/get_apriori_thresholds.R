# Function to generate gross rules based on the best obtained thresholds

get_apriori_thresholds <- function (trx, supportRange, confidenceRange) {
  # suppose the parmater supportRange to be introduced as a sequence with seq(minSupport, maxSupport, by =stepSupport) 
  # suppose the parmater confidenceRange to be introduced as a sequence with seq(minConfidence, maxConfidence, by = stepConfidence)
  
  minSupp <- 0
  minConf <- 0
  bestLift <- 0
  lenRules <- 0
  
  output_list <- get_thresholds (trx, supportRange, confidenceRange) #, minLenRules, maxLenRules)
  
  #gross_rules <- output_list[best_rules]
  minSupp <- output_list[[1]]
  print (paste('Best Minimum Support   : ', format(minSupp, scientific = FALSE)))
  
  minConf <- output_list[[2]]
  print (paste('Best Minimum Confidence: ', format(output_list[[2]], scientific = FALSE)))
  
  bestLift <- output_list[[3]]
  print (paste('Best Lift              : ', format(output_list[[3]], scientific = FALSE)))
  
  lenRules <- output_list[[4]]
  print (paste ('Total gross rules     : ', lenRules))
  
  print (paste ('-- > Generated rules represents approximativelly ', round(lenRules/length(trx), digits = 0), ' times the total number of nodes'))

  return (minSupp, minConf, bestLift, lenRules, round(lenRules/length(trx), digits = 0))
}
