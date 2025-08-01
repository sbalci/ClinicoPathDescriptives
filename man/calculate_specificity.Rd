% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{calculate_specificity}
\alias{calculate_specificity}
\title{Calculate test specificity}
\usage{
calculate_specificity(tn, fp)
}
\arguments{
\item{tn}{Number of true negatives}

\item{fp}{Number of false positives}
}
\value{
Numeric specificity value or NA when inputs are not valid
}
\description{
Calculates specificity (true negative rate) from confusion matrix values
}
