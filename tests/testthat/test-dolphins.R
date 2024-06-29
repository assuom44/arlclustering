# tests/testthat/test-dolphins.R

library(testthat)
library(arlclustering)
#library(igraph)
library(arules)
library(microbenchmark)
library(ggplot2)

test_that("Dolphins Network Analysis", {
  # Define the path to the dataset
  dataset_path <- system.file("extdata", "dolphins.gml", package = "arlclustering")
  if (dataset_path == "") {
    stop("dolphins.gml file not found in the package")
  }
  # Ensure the file exists
  expect_true(file.exists(dataset_path))

  timings <- list()

  # Load the network dataset
  timings[["Load Network"]] <- microbenchmark(
    #g <- arlc_get_network_dataset(dataset_path, "Dolphins Network"),
    g <- arlc_get_network_dataset(dataset_path, "Dolphins"),
    times = 1
  )

  # Ensure the dataset is loaded correctly
  expect_true(!is.null(g))
  expect_true("graph" %in% names(g))
  expect_true("graphLabel" %in% names(g))

  # Generate transactions from the graph
  timings[["Generate Transactions"]] <- microbenchmark(
    transactions <- arlc_gen_transactions(g$graph),
    times = 1
  )
  expect_true(!is.null(transactions))
  expect_s4_class(transactions, "transactions")

  # Get apriori thresholds
  timings[["Get Apriori Thresholds"]] <- microbenchmark(
    params <- arlc_get_apriori_thresholds(transactions,
                                          supportRange = seq(0.05, 0.07, by = 0.01),  #minSup= 0.06 ; minConf= 0.5 ; minLen= 2 ; maxLen= 13
                                          0.5),
    times = 1
  )
  expect_true(!is.null(params))
  expect_true("minSupp" %in% names(params))
  expect_true("minConf" %in% names(params))
  expect_true("lenRules" %in% names(params))

  # Generate gross rules
  timings[["Generate Gross Rules"]] <- microbenchmark(
    grossRules <- arlc_gen_gross_rules(transactions,
                                       minSupp = params$minSupp,
                                       minConf = params$minConf,
                                       minLenRules = 2,
                                       maxLenRules = params$lenRules),
    times = 1
  )
  expect_true(!is.null(grossRules$GrossRules))
  expect_true("GrossRules" %in% names(grossRules))

  # Get non-redundant rules
  timings[["Filter gross from redundant rules"]] <- microbenchmark(
    NonRedRules <- arlc_get_NonR_rules(grossRules$GrossRules),
    times = 1
  )

  expect_true(!is.null(NonRedRules$FiltredRules))
  expect_true("FiltredRules" %in% names(NonRedRules))

  # Get significant non-redundant rules
  timings[["Filter redundant from non-significant rules"]] <- microbenchmark(
    NonRSigRules <- arlc_get_significant_rules(transactions,
                                               NonRedRules$FiltredRules),
    times = 1
  )
  expect_true(!is.null(NonRSigRules$FiltredRules))
  expect_true("FiltredRules" %in% names(NonRSigRules))

  # Clean final rules
  timings[["Clean Final Rules"]] <- microbenchmark(
    cleanedRules <- arlc_clean_final_rules(NonRSigRules$FiltredRules),
    times = 1
  )
  expect_true(!is.null(cleanedRules))

  # Generate clusters
  timings[["Generate Clusters"]] <- microbenchmark(
    c <- arlc_generate_clusters(cleanedRules),
    times = 1
  )
  expect_true(!is.null(c))
  expect_true("Clusters" %in% names(c))

  # Plot clusters
  timings[["Plot Clusters"]] <- microbenchmark(
    plot <- arlc_clusters_plot(g$graph,
                               g$graphLabel,
                               c$Clusters),
    times = 1
  )
  #expect_true(!is.null(plot))

  # Combine timings into a data frame for plotting
  timing_data <- do.call(rbind, lapply(names(timings), function(name) {
    data.frame(
      Step = name,
      Time = summary(timings[[name]])$mean / 1e6  # Convert to milliseconds
    )
  }))

  # Plot the timing data
  ggplot(timing_data, aes(x = Step, y = Time)) +
    geom_bar(stat = "identity") +
    labs(title = "Execution Time of Steps in Dolphins Network Analysis",
         x = "Step",
         y = "Time (ms)") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
