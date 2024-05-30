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
#' arlc_clean_final_rules(final_rules)
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
