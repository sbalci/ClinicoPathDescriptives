% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/benford.h.R
\name{benford}
\alias{benford}
\title{Benford Analysis}
\usage{
benford(data, var)
}
\arguments{
\item{data}{The data as a data frame.}

\item{var}{a string naming the variable from \code{data} that contains the
continuous values used for the report}
}
\value{
A results object containing:
\tabular{llllll}{
\code{results$todo} \tab \tab \tab \tab \tab a html \cr
\code{results$text} \tab \tab \tab \tab \tab a preformatted \cr
\code{results$text2} \tab \tab \tab \tab \tab a preformatted \cr
\code{results$plot} \tab \tab \tab \tab \tab an image \cr
}
}
\description{
Benford Analysis
}
