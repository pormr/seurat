% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/clustering.R
\name{FindClusters}
\alias{FindClusters}
\alias{FindClusters.default}
\alias{FindClusters.Seurat}
\title{Cluster Determination}
\usage{
FindClusters(object, ...)

\method{FindClusters}{default}(
  object,
  modularity.fxn = 1,
  initial.membership = NULL,
  node.sizes = NULL,
  resolution = 0.8,
  method = deprecated(),
  algorithm = 1,
  n.start = 10,
  n.iter = 10,
  random.seed = 0,
  group.singletons = TRUE,
  temp.file.location = NULL,
  edge.file.name = NULL,
  verbose = TRUE,
  ...
)

\method{FindClusters}{Seurat}(
  object,
  graph.name = NULL,
  cluster.name = NULL,
  modularity.fxn = 1,
  initial.membership = NULL,
  node.sizes = NULL,
  resolution = 0.8,
  method = NULL,
  algorithm = 1,
  n.start = 10,
  n.iter = 10,
  random.seed = 0,
  group.singletons = TRUE,
  temp.file.location = NULL,
  edge.file.name = NULL,
  verbose = TRUE,
  ...
)
}
\arguments{
\item{object}{An object}

\item{...}{Arguments passed to other methods}

\item{modularity.fxn}{Modularity function (1 = standard; 2 = alternative).}

\item{initial.membership}{Passed to the `initial_membership` parameter
of `leidenbase::leiden_find_partition`.}

\item{node.sizes}{Passed to the `node_sizes` parameter of
`leidenbase::leiden_find_partition`.}

\item{resolution}{Value of the resolution parameter, use a value above
(below) 1.0 if you want to obtain a larger (smaller) number of communities.}

\item{method}{DEPRECATED.}

\item{algorithm}{Algorithm for modularity optimization (1 = original Louvain
algorithm; 2 = Louvain algorithm with multilevel refinement; 3 = SLM
algorithm; 4 = Leiden algorithm).}

\item{n.start}{Number of random starts.}

\item{n.iter}{Maximal number of iterations per random start.}

\item{random.seed}{Seed of the random number generator.}

\item{group.singletons}{Group singletons into nearest cluster. If FALSE, assign all singletons to
a "singleton" group}

\item{temp.file.location}{Directory where intermediate files will be written.
Specify the ABSOLUTE path.}

\item{edge.file.name}{Edge file to use as input for modularity optimizer jar.}

\item{verbose}{Print output}

\item{graph.name}{Name of graph to use for the clustering algorithm}

\item{cluster.name}{Name of output clusters}
}
\value{
Returns a Seurat object where the idents have been updated with new cluster info;
latest clustering results will be stored in object metadata under 'seurat_clusters'.
Note that 'seurat_clusters' will be overwritten everytime FindClusters is run
}
\description{
Identify clusters of cells by a shared nearest neighbor (SNN) modularity
optimization based clustering algorithm. First calculate k-nearest neighbors
and construct the SNN graph. Then optimize the modularity function to
determine clusters. For a full description of the algorithms, see Waltman and
van Eck (2013) \emph{The European Physical Journal B}. Thanks to Nigel
Delaney (evolvedmicrobe@github) for the rewrite of the Java modularity
optimizer code in Rcpp!
}
\details{
To run Leiden algorithm, you must first install the leidenalg python
package (e.g. via pip install leidenalg), see Traag et al (2018).
}
\concept{clustering}
