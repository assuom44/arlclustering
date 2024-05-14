#' Clean Final Rules
#'
#' Cleans the preprocessed rules by removing redundant and significant rules.
#'
#' @description This function takes a set of preprocessed rules, removes redundant
#' and significant rules, and returns a cleaned vector of rules.
#'
#' @param final_rules A dataframe containing the preprocessed rules.
#'
#' @return A cleaned vector of rules.
#'
#' @examples
#' clean_final_rules(final_rules)
#' @import stringr
#' @export

clean_final_rules <- function(final_rules) {
  ## Cleaning generated rules for further processing :

  # Convert S4 object to data frame
  #df <- as(rules_subset, "data.frame")
  df <- as.data.frame(final_rules)

  # Removing extra characters from rules structure
  #   clean_df <- gsub('[{}=>"]', "", df$rules)
  #   clean_df <- gsub("  ", ",", clean_df)
  #   clean_df <- gsub(" ", ",", clean_df)
  clean_df <- gsub('[{}=>"]', "", df$rules)
  clean_df <- gsub("\\s+", ",", clean_df)

  # Splitting rules into components and converting to numeric values
  #values <- lapply(strsplit(clean_df, ","), as.numeric)
  values <- lapply(strsplit(clean_df, ","), as.numeric)

  # Sorting and removing duplicates
  vec <- unique(lapply(values, function(x) sort(unique(x))))

  return(vec)
}
