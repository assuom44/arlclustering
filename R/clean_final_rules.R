# Function the clean the preprocessed rules (non redundant and significant rules)

clean_final_rules <- function (final_rules) {
  ## Cleaning generated rules for further processing :
  rules_subset <- final_rules
  
  # Convert S4 object to data frame
  df <- as(rules_subset, "data.frame")
  
  # Removing extra sign from rules structure
  clean_df <- gsub('[{}=>"]', "", df$rules)
  clean_df <- gsub("  ", ",", clean_df)
  clean_df <- gsub(" ", ",", clean_df)
  
  # Conversion rules components to numeric values
  values <- lapply(strsplit(clean_df, ","), as.numeric)

  # Sorting result
  clean_df <- lapply(values, sort)
  # Remove duplicates
  vec <- unique (clean_df)

  retunr (vec)
}
