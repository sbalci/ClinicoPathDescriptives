% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/venn.h.R
\name{venn}
\alias{venn}
\title{Venn Diagram}
\usage{
venn(data, var1, var1true, var2, var2true, var3, var3true, var4, var4true)
}
\arguments{
\item{data}{The data as a data frame.}

\item{var1}{a string naming the variable from \code{data} that contains the
the first variable used for the report}

\item{var1true}{a string naming the level from \code{var1} that contains
the the true level}

\item{var2}{a string naming the variable from \code{data} that contains the
the second variable used for the report}

\item{var2true}{a string naming the level from \code{var2} that contains
the the true level}

\item{var3}{a string naming the variable from \code{data} that contains the
the third variable used for the report}

\item{var3true}{a string naming the level from \code{var3} that contains
the the true level}

\item{var4}{a string naming the variable from \code{data} that contains the
the fourth variable used for the report}

\item{var4true}{a string naming the level from \code{var4} that contains
the the true level}
}
\value{
A results object containing:
\tabular{llllll}{
\code{results$todo} \tab \tab \tab \tab \tab a html \cr
\code{results$plot} \tab \tab \tab \tab \tab an image \cr
\code{results$plot2} \tab \tab \tab \tab \tab an image \cr
}
}
\description{
Venn Diagram
}
