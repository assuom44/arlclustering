#' Clean Final Rules
#'
#' This function cleans the final set of association rules.
#'
#' @param final_rules A set of final rules to be cleaned.
#'
#' @return A cleaned set of rules.
#'
#' @examples
#' \dontrun{
#' library(arules)
#' # Create a sample transactions dataset
#' data("Adult")
#' transactions <- as(Adult, "transactions")
#' # Generate rules
#' rules <- apriori(transactions, parameter = list(supp = 0.5, conf = 0.9))
#' # Clean the final rules
#' cleaned_rules <- arlc_clean_final_rules(rules)
#' }
#' @import methods
#' @export

arlc_clean_final_rules <- function(final_rules) {
  # Convert S4 object to data frame
  df <- as(final_rules, "data.frame")
  #head(df$rules) # v
  clean_df <- gsub('[{}=>"]', "", df$rules)
  clean_df <- gsub("  ", ",", clean_df)
  clean_df <- gsub(" ", ",", clean_df)
  #head(clean_df[1])
  values <- lapply(strsplit(clean_df, ","), as.numeric)
  clean_df <- lapply(values, sort)
  vec <- unique (clean_df)

  return(vec)
}
