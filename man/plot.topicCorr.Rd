\name{plot.topicCorr}
\alias{plot.topicCorr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot a topic correlation graph}
\description{
Uses a topic correlation graph estimated by \code{\link{topicCorr}} and the \code{igraph} package to plot a network where nodes are topics and edges indicate a positive correlation.
}
\usage{
\method{plot}{topicCorr}(x, topics = NULL, vlabels = NULL, layout = layout.fruchterman.reingold, vertex.color = "green", vertex.label.cex = 0.75, vertex.label.color = "black", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A topicCorr model object.
}
  \item{topics}{
A vector of topics to include in the plot, defaults to all.
}
  \item{vlabels}{
A character vector of labels for the vertices.  Defaults to "Topic #"
}
  \item{layout}{
The layout algorithm passed to the \code{igraph} package.
}
  \item{vertex.color}{
Color of the vertices.
}
  \item{vertex.label.cex}{
Controls the size of the labels.
}
  \item{vertex.label.color}{
Controls the color of the labels.
}
  \item{\dots}{
Additional parameters passed to \code{plot.graph.adjacency}
}
}
\details{
Essentially a thin wrapper around the plotting functionality in the \code{igraph} package.
}
\references{
Csardi G, Nepusz T: The igraph software package for complex network research, InterJournal, Complex Systems 1695. 2006. http://igraph.sf.net
}
\seealso{
\code{\link{topicCorr}}
}
\examples{
cormat <- topicCorr(poliblogFit)
plot(cormat)
}
