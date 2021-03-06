% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_fxns.R
\name{gene_network}
\alias{gene_network}
\title{Creates a gene association network}
\usage{
gene_network(
  dom,
  clust = NULL,
  class_cols = c(lig = "#FF685F", rec = "#47a7ff", feat = "#39C740"),
  cols = NULL,
  lig_scale = 1,
  layout = "grid",
  ...
)
}
\arguments{
\item{dom}{A domino object with network built (build_domino)}

\item{clust}{The receptor cluster to create the gene association network for. A vector of clusters may be provided.}

\item{class_cols}{A named vector of colors used to color classes of vertices. Values must be colors and names must be classes ('rec', 'lig', and 'feat' for receptors, ligands, and features.).}

\item{cols}{A named vector of colors for individual genes. Genes not included in this vector will be colored according to class_cols.}

\item{lig_scale}{FALSE or a numeric value to scale the size of ligand vertices based on z-scored expression in the data set.}

\item{layout}{Type of layout to use. Options are 'grid', 'random', 'sphere', 'circle', 'fr' for Fruchterman-Reingold force directed layout, and 'kk' for Kamada Kawai for directed layout.}

\item{...}{Other parameters to pass to plot() with an igraph object. See igraph manual for options.}
}
\description{
Creates a gene association network for genes from a given cluster. The 
selected cluster acts as the receptor for the gene association network, so
only ligands, receptors, and features associated with the receptor cluster
will be included in the plot.
}
