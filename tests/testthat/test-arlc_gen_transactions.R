library(testthat)
library(igraph)
library(arules)

sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed
g <- arlc_get_network_dataset(sample_gml_file, "Karate Club")

test_that("arlc_gen_transactions returns a transactions object", {
  trans <- arlc_gen_transactions(g$graph)
  expect_s4_class(trans, "transactions")
})

test_that("arlc_gen_transactions handles an empty graph", {
  g <- make_empty_graph()
  trans <- arlc_gen_transactions(g)
  expect_equal(length(trans), 0)
})


