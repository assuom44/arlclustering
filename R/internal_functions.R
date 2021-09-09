#' Construct select input elements
#'
#' @description This two functions are called to build list of select inputs
#'

getNetworks <- function(x){
  tmp <- c("Zachary Karate Club Social Network" = "Zachary",
           "Krackhard Kite Social Network" = "Krackhardt kite",
           "UK Faculty Friendship" = "UKfaculty",
           "Nonline" = "Nonline",
           "Petersen" = "Petersen",
           "Test Source function" = "Test")
  return(tmp)
}


getAlg <- function(x) {
  tmp <- c( "No Clustering" = "no_clustering",
            "Fast Greedy" = "cluster_fast_greedy",
            "Walktrap" = "cluster_walktrap",
            "Spinglass" = "cluster_spinglass",
            "Leading Eigen" = "cluster_leading_eigen",
            "Label Propagation" = "cluster_label_prop",
            "Infomap" = "cluster_infomap",
            "Optimal" = "cluster_optimal",
            "Louvain" = "cluster_louvain")
  return (tmp)
}
