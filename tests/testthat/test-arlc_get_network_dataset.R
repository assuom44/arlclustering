# Load the required packages
library(testthat)
library(igraph)
library(arlclustering)  # Adjust the package name as needed

# Define the path to a sample GML file for testing
sample_gml_file <- system.file("extdata", "karate.gml", package = "arlclustering") # Adjust as needed

# Test cases for arlc_get_network_dataset
test_that("arlc_get_network_dataset loads the graph and computes properties correctly", {
  # Skip test if the sample GML file is not available
  skip_if_not(file.exists(sample_gml_file), "Sample GML file not found")

  # Call the function with a valid GML file
  result <- arlc_get_network_dataset(sample_gml_file, "Karate Club")

  # Check if the result is a list
  expect_type(result, "list")

  # Check if the graph object is of class igraph
  expect_s3_class(result$graph, "igraph")

  # Check if the graph label is correct
  expect_equal(result$graphLabel, "Karate Club Network")

  # Check if the total edges are correct
  expect_equal(result$totalEdges, gsize(result$graph))

  # Check if the total nodes are correct
  expect_equal(result$totalNodes, vcount(result$graph))

  # Check if the average degree is correct
  expect_equal(result$averageDegree, mean(degree(result$graph)))
})

test_that("arlc_get_network_dataset handles non-existent files correctly", {
  # Expect an error when a non-existent file is provided
  expect_error(arlc_get_network_dataset("non_existent_file.gml", "Non Existent"), "The network file does not exist")
})

test_that("arlc_get_network_dataset handles unreadable files correctly", {
  # Create a temporary file and make it unreadable
  temp_file <- tempfile()
  file.create(temp_file)
  Sys.chmod(temp_file, "0000")

  # Ensure the file is deleted and permissions are restored after the test
  on.exit({
    Sys.chmod(temp_file, "0600")
    unlink(temp_file)
  })

  # Expect an error when an unreadable file is provided
  expect_error(arlc_get_network_dataset(temp_file, "Unreadable File"), "The network file is not readable")
})
