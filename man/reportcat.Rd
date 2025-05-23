% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reportcat.h.R
\name{reportcat}
\alias{reportcat}
\title{Summary of Categorical Variables}
\usage{
reportcat(data, vars)
}
\arguments{
\item{data}{the data as a data frame}

\item{vars}{string naming the variables from \code{data} that contains the
values used for the report.}
}
\value{
A results object containing:
\tabular{llllll}{
\code{results$todo} \tab \tab \tab \tab \tab a html \cr
\code{results$text} \tab \tab \tab \tab \tab a preformatted \cr
\code{results$text1} \tab \tab \tab \tab \tab a html \cr
}
}
\description{
Function for Generating Summaries for Categorical Variables.
}
\examples{
\donttest{
# example will be added
}
}
