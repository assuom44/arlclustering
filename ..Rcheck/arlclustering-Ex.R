pkgname <- "arlclustering"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('arlclustering')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("arlc_calculate_mode")
### * arlc_calculate_mode

flush(stderr()); flush(stdout())

### Name: arlc_calculate_mode
### Title: Calculate the Mode of a Vector
### Aliases: arlc_calculate_mode

### ** Examples

arlc_calculate_mode(c(1, 2, 2, 3, 4))



cleanEx()
nameEx("arlc_clean_final_rules")
### * arlc_clean_final_rules

flush(stderr()); flush(stdout())

### Name: arlc_clean_final_rules
### Title: Clean Final Rules
### Aliases: arlc_clean_final_rules

### ** Examples

## Not run: 
##D library(arules)
##D # Create a sample transactions dataset
##D data("Adult")
##D transactions <- as(Adult, "transactions")
##D # Generate rules
##D rules <- apriori(transactions, parameter = list(supp = 0.5, conf = 0.9))
##D # Clean the final rules
##D cleaned_rules <- arlc_clean_final_rules(rules)
## End(Not run)



cleanEx()
nameEx("arlc_clusters_plot")
### * arlc_clusters_plot

flush(stderr()); flush(stdout())

### Name: arlc_clusters_plot
### Title: Plot Graph with Custom Layout and Communities
### Aliases: arlc_clusters_plot

### ** Examples

## Not run: 
##D library(igraph)
##D g <- make_ring(10)
##D clusters <- list(1:5, 6:10)
##D arlc_clusters_plot(g, "Sample Graph", clusters)
## End(Not run)



cleanEx()
nameEx("arlc_convert_date_format")
### * arlc_convert_date_format

flush(stderr()); flush(stdout())

### Name: arlc_convert_date_format
### Title: Convert a Date to a Different Format
### Aliases: arlc_convert_date_format

### ** Examples

arlc_convert_date_format("2023-01-01", "%Y-%m-%d", "%d-%m-%Y")



cleanEx()
nameEx("arlc_count_na")
### * arlc_count_na

flush(stderr()); flush(stdout())

### Name: arlc_count_na
### Title: Count NA Values in a Data Frame
### Aliases: arlc_count_na

### ** Examples

arlc_count_na(data.frame(a = c(1, NA, 3), b = c(NA, NA, 3)))



cleanEx()
nameEx("arlc_df_summary")
### * arlc_df_summary

flush(stderr()); flush(stdout())

### Name: arlc_df_summary
### Title: Create a Summary of a Data Frame
### Aliases: arlc_df_summary

### ** Examples

arlc_df_summary(data.frame(a = c(1, 2, 3, 4, 5), b = c(5, 4, 3, 2, 1)))



cleanEx()
nameEx("arlc_fct_clean_transactions")
### * arlc_fct_clean_transactions

flush(stderr()); flush(stdout())

### Name: arlc_fct_clean_transactions
### Title: Clean Transactions by Removing Overlapping Sets
### Aliases: arlc_fct_clean_transactions

### ** Examples

## Not run: 
##D all_sets <- list(
##D   c(1, 2, 3),
##D   c(2, 3),
##D   c(4, 5),
##D   c(5, 6, 7)
##D )
##D cleaned_sets <- arlc_fct_clean_transactions(all_sets)
##D print(cleaned_sets)
## End(Not run)




cleanEx()
nameEx("arlc_fct_get_best_apriori_thresholds")
### * arlc_fct_get_best_apriori_thresholds

flush(stderr()); flush(stdout())

### Name: arlc_fct_get_best_apriori_thresholds
### Title: Get Best Apriori Thresholds
### Aliases: arlc_fct_get_best_apriori_thresholds

### ** Examples

## Not run: 
##D library(arules)
##D data(Groceries)
##D support_range <- seq(0.01, 0.03, by = 0.01)
##D confidence <- 0.5
##D best_thresholds <- arlc_fct_get_best_apriori_thresholds(Groceries, support_range, confidence)
##D print(best_thresholds)
## End(Not run)




cleanEx()
nameEx("arlc_file_exists_readable")
### * arlc_file_exists_readable

flush(stderr()); flush(stdout())

### Name: arlc_file_exists_readable
### Title: Check if a File Exists and is Readable
### Aliases: arlc_file_exists_readable

### ** Examples

arlc_file_exists_readable("example.txt")



cleanEx()
nameEx("arlc_gen_gross_rules")
### * arlc_gen_gross_rules

flush(stderr()); flush(stdout())

### Name: arlc_gen_gross_rules
### Title: Get Gross Rules
### Aliases: arlc_gen_gross_rules

### ** Examples

## Not run: 
##D library(arules)
##D # Create a sample transactions dataset
##D data("Adult")
##D transactions <- as(Adult, "transactions")
##D # Generate gross rules
##D arlc_gen_gross_rules(transactions, minSupp = 0.1, minConf = 0.5, minLenRules = 1, maxLenRules = 3)
## End(Not run)



cleanEx()
nameEx("arlc_gen_transactions")
### * arlc_gen_transactions

flush(stderr()); flush(stdout())

### Name: arlc_gen_transactions
### Title: Get Transactional Dataset
### Aliases: arlc_gen_transactions

### ** Examples

## Not run: 
##D library(igraph)
##D library(arules)
##D g <- make_ring(10)
##D trans <- arlc_gen_transactions(g)
## End(Not run)



cleanEx()
nameEx("arlc_generate_clusters")
### * arlc_generate_clusters

flush(stderr()); flush(stdout())

### Name: arlc_generate_clusters
### Title: Generate Clusters
### Aliases: arlc_generate_clusters

### ** Examples

## Not run: 
##D # Create a sample vector
##D vec <- list(c(1, 2, 3), c(2, 3, 4), c(5, 6))
##D # Generate clusters
##D clusters <- arlc_generate_clusters(vec)
## End(Not run)



cleanEx()
nameEx("arlc_generate_date_sequence")
### * arlc_generate_date_sequence

flush(stderr()); flush(stdout())

### Name: arlc_generate_date_sequence
### Title: Generate a Sequence of Dates
### Aliases: arlc_generate_date_sequence

### ** Examples

arlc_generate_date_sequence("2023-01-01", "2023-01-10", "day")



cleanEx()
nameEx("arlc_generate_uid")
### * arlc_generate_uid

flush(stderr()); flush(stdout())

### Name: arlc_generate_uid
### Title: Generate a Unique Identifier
### Aliases: arlc_generate_uid

### ** Examples

arlc_generate_uid()
arlc_generate_uid(15)



cleanEx()
nameEx("arlc_get_NonR_rules")
### * arlc_get_NonR_rules

flush(stderr()); flush(stdout())

### Name: arlc_get_NonR_rules
### Title: Get Non-Redundant Rules
### Aliases: arlc_get_NonR_rules

### ** Examples

## Not run: 
##D library(arlclustering)
##D rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))
##D non_redundant_rules <- arlc_get_NonR_rules(rules)
## End(Not run)



cleanEx()
nameEx("arlc_get_apriori_thresholds")
### * arlc_get_apriori_thresholds

flush(stderr()); flush(stdout())

### Name: arlc_get_apriori_thresholds
### Title: Get Apriori Thresholds
### Aliases: arlc_get_apriori_thresholds

### ** Examples

## Not run: 
##D library(arules)
##D data(Groceries)
##D supportRange <- seq(0.1, 0.9, by = 0.1)
##D Conf <- 0.5
##D result <- arlc_get_apriori_thresholds(Groceries, supportRange, Conf)
##D print(result)
## End(Not run)




cleanEx()
nameEx("arlc_get_network_dataset")
### * arlc_get_network_dataset

flush(stderr()); flush(stdout())

### Name: arlc_get_network_dataset
### Title: Get Network Dataset
### Aliases: arlc_get_network_dataset

### ** Examples

## Not run: 
##D file_path <- system.file("extdata", "karate.gml", package = "arlclustering")
##D loaded_karate <- arlc_get_network_dataset(file_path, "Karate Club")
##D print(loaded_karate$graph)
##D print(loaded_karate$graphLabel)
##D print(loaded_karate$totalEdges)
##D print(loaded_karate$graphEdges)
##D print(loaded_karate$totalNodes)
##D print(loaded_karate$graphNodes)
##D print(loaded_karate$averageDegree)
## End(Not run)



cleanEx()
nameEx("arlc_get_significant_rules")
### * arlc_get_significant_rules

flush(stderr()); flush(stdout())

### Name: arlc_get_significant_rules
### Title: Get Significant Rules
### Aliases: arlc_get_significant_rules

### ** Examples

## Not run: 
##D arlc_get_significant_rules(all_trans, nonRR_rules)
## End(Not run)



cleanEx()
nameEx("arlc_is_numeric_vector")
### * arlc_is_numeric_vector

flush(stderr()); flush(stdout())

### Name: arlc_is_numeric_vector
### Title: Check if a Vector is Numeric
### Aliases: arlc_is_numeric_vector

### ** Examples

arlc_is_numeric_vector(c(1, 2, 3))
arlc_is_numeric_vector(c(1, "a", 3))



cleanEx()
nameEx("arlc_list_to_df")
### * arlc_list_to_df

flush(stderr()); flush(stdout())

### Name: arlc_list_to_df
### Title: Convert List of Vectors to Data Frame
### Aliases: arlc_list_to_df

### ** Examples

lst <- list(a = c(x = 1, y = 2), b = c(x = 3, y = 4))
arlc_list_to_df(lst)



cleanEx()
nameEx("arlc_log_message")
### * arlc_log_message

flush(stderr()); flush(stdout())

### Name: arlc_log_message
### Title: Log Messages to a File
### Aliases: arlc_log_message

### ** Examples

arlc_log_message("This is a test message", "log.txt")



cleanEx()
nameEx("arlc_measure_time")
### * arlc_measure_time

flush(stderr()); flush(stdout())

### Name: arlc_measure_time
### Title: Measure Execution Time of a Function
### Aliases: arlc_measure_time

### ** Examples

arlc_measure_time(Sys.sleep, 1)



cleanEx()
nameEx("arlc_normalize_vector")
### * arlc_normalize_vector

flush(stderr()); flush(stdout())

### Name: arlc_normalize_vector
### Title: Normalize a Numeric Vector
### Aliases: arlc_normalize_vector

### ** Examples

arlc_normalize_vector(c(1, 2, 3, 4, 5))



cleanEx()
nameEx("arlc_replace_na")
### * arlc_replace_na

flush(stderr()); flush(stdout())

### Name: arlc_replace_na
### Title: Replace NA with a Specified Value
### Aliases: arlc_replace_na

### ** Examples

arlc_replace_na(c(1, NA, 3), 0)
arlc_replace_na(data.frame(a = c(1, NA, 3), b = c(NA, NA, 3)), 0)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
