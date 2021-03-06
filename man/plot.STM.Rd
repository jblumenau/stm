\name{plot.STM}
\alias{plot.STM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot summary of an STM object
}
\description{
Produces one of three types of plots for an STM object.  The default option \code{"summary"} prints topic words with their corpus frequency.  \code{"labels"} is for easy printing of tables of indicative words for each topic.  \code{"perspectives"} depicts differences between two topics, content covariates or combinations. 
}
\usage{
\method{plot}{STM}(x, type = c("summary", "labels", "perspectives"),
                   n = NULL, topics = NULL, 
                   labeltype = c("prob", "frex", "lift", "score"), frexw = 0.5, 
                   main = NULL, xlim = NULL, ylim = NULL, xlab = NULL, 
                   family = "", width = 80, 
                   covarlevels = NULL, plabels = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Model output from stm.
}
  \item{type}{
Sets the desired type of plot.  See details for more information.
}
  \item{n}{
   Sets the number of words used to label each topic.  In perspective plots it approximately sets the total number of words in the plot.  The defaults are 3, 20 and 25 for \code{summary}, \code{labels} and \code{perspectives} respectively.
    }
  \item{topics}{
Vector of topics to display.  For plot perspectives this must be a vector of length one or two. For the other two types it defaults to all topics.
}
  \item{labeltype}{
  Determines which option of \code{"prob", "frex", "lift", "score"} is used for choosing the most important words.  See \code{\link{labelTopics}} for more detail
}
  \item{frexw}{
    If "frex" labeltype is used, this will be the frex weight.
}
  \item{main}{
  Title to the plot
}
  \item{xlim}{
  Range of the X-axis.
}
  \item{ylim}{
Range of the Y-axis.
}
  \item{xlab}{
Labels for the X-axis.  For perspective plots, use \code{plabels} instead.
}
  \item{family}{
The Font family.  Most of the time the user will not need to specify this but if using other character sets can be useful see \link{par}.
}
  \item{width}{
  Sets the width in number of characters used for string wrapping in type \code{"labels"}
}
  \item{covarlevels}{
  A vector of length one or length two which contains the levels of the content covariate to be used in perspective plots.
}
  \item{plabels}{
  This option can be used to override the default labels in the perspective plot that appear along the x-axis.  It should be a character vector of length two which has the left hand side label first.
}
  \item{\dots}{
Additional parameters passed to ploting functions.
}
}
\details{
The function can produce three types of plots which summarize an STM object which is chosen by the argument \code{type}.  \code{summary} produces a plot which displays the topics ordered by their expected frequency across the corpus.  \code{labels} plots the top words selected according to the chosen criteria for each selected topics.  \code{perspectives} plots two topic or topic-covariate combinations.  Words are sized proportional to their use within the plotted topic-covariate combinations and oriented along the X-axis based on how much they favor one of the two configurations.  If the words cluster on top of each other the user can either set the plot size to be larger or shrink the total number of words on the plot.  The vertical configuration of the words is random and thus can be rerun to produce different results each time. 
}
\references{
[ajps cite]
}
\seealso{
\code{\link{plotQuote}}, \code{\link{plot.topicCorr}}
}
\examples{
#Examples with the Gadarian Data
plot(gadarianFit)
plot(gadarianFit,type="labels")
plot(gadarianFit, type="perspectives", topics=c(1,2))
#Examples with the Poliblog Data
plot(poliblogFit)
plot(poliblogFit, type="perspectives", topics=1,n=30)
}
