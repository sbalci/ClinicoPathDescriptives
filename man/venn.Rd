% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/venn.h.R
\name{venn}
\alias{venn}
\title{Venn Diagram}
\usage{
venn(
  data,
  var1,
  var1true,
  var2,
  var2true,
  var3,
  var3true,
  var4,
  var4true,
  upsetType = "upsetR",
  sortBy = "freq",
  minSize = 0,
  showAnnotations = FALSE
)
}
\arguments{
\item{data}{The dataset as a data frame containing the variables for
analysis.}

\item{var1}{A string naming the primary variable from \code{data} for the
diagram.}

\item{var1true}{The level in \code{var1} that represents the positive
condition.}

\item{var2}{A string naming the secondary variable from \code{data} used in
the diagram.}

\item{var2true}{The level in \code{var2} that represents the positive
condition.}

\item{var3}{An optional variable from \code{data} to include in the
diagram.}

\item{var3true}{The level in \code{var3} that represents the positive
condition.}

\item{var4}{An optional variable from \code{data} for additional overlap
analysis.}

\item{var4true}{The level in \code{var4} that represents the positive
condition.}

\item{upsetType}{Choose between UpSetR (classic) or ComplexUpset (advanced
with more features).}

\item{sortBy}{How to sort the intersections in the UpSet plot.}

\item{minSize}{Minimum size of intersections to display.}

\item{showAnnotations}{Add statistical annotations to the ComplexUpset
plot.}
}
\value{
A results object containing:
\tabular{llllll}{
\code{results$todo} \tab \tab \tab \tab \tab a html \cr
\code{results$summary} \tab \tab \tab \tab \tab a table \cr
\code{results$plot} \tab \tab \tab \tab \tab an image \cr
\code{results$plot2} \tab \tab \tab \tab \tab an image \cr
}

Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:

\code{results$summary$asDF}

\code{as.data.frame(results$summary)}
}
\description{
Venn Diagram
}
