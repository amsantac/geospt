\name{rbf.tcv}
\alias{rbf.tcv}

\title{
table of rbf cross validation, leave-one-out
}
\description{
Generates a table with the results of the evaluation of radial basis functions (\emph{rbf}): gaussian (GAU), exponential (EXPON), trigonometric (TRI), thin plate spline (TPS), completely regularized spline (CRS), spline with tension (ST), inverse multiquadratic (IM), and multiquadratic (M) from the leave-one-out cross validation method.
}
\usage{
rbf.tcv(formula, data, eta, rho, n.neigh, func)
}

\arguments{
\item{formula}{
formula that defines the dependent variable as a linear model of independent variables; suppose the dependent variable has name \emph{z}, for a \emph{rbf} detrended use \emph{z~1}, for a \emph{rbf} with trend, suppose \emph{z} is linearly dependent on \emph{x} and \emph{y}, use the formula \emph{z~x+y} (linear trend).
}
\item{data}{
SpatialPointsDataFrame: should contain the dependent variable, independent variables, and coordinates.
}
\item{eta}{
the optimal smoothing parameter; we recommend using the parameter found by minimizing the root-mean-square prediction errors using cross-validation
}
\item{rho}{
value of optimal parameter robustness; we recommend using the parameter
found by minimizing the root-mean-square prediction errors using cross-validation.
\emph{eta} and \emph{rho} parameters can be optimized simultaneously, through the \code{bobyqa} function from \code{nloptr} or \code{minqa} packages
}
\item{n.neigh}{
number of nearest observations that should be used for a \emph{rbf}
prediction, where nearest is defined in terms of the spatial locations
}
  \item{func}{
radial basis function model type, e.g. "GAU", "EXPON", "TRI", "TPS",
"CRS", "ST", "MI" and "M", are currently available
}
}
\details{
Leave-one-out cross validation (LOOCV) visits a data point, predicts
the value at that location by leaving out the observed value, and
proceeds with the next data point. The observed value is left out
because rbf would otherwise predict the same value 
}
\value{
data frame contain the data coordinates, prediction columns, observed
values, residuals, the prediction variance, zscore (residual divided
by standard error) which left with NA's, and the fold column which
is associated to cross-validation count. Prediction columns and residuals
are obtained from cross-validation data points
}
\seealso{
\code{\link{rbf}}
}
\examples{
data(preci)
coordinates(preci)<-~x+y
rbf.tcv(prec~x+y, preci, eta=0.1460814, rho=0, n.neigh=9, func="TPS")
}

\keyword{ spatial }
