#' Approximate potential difference between two points
#'
#' @param x Position where we want to know the approximate potential
#' @param x0 Reference position (center of the Taylor expansion)
#' @param f Flow equations (right hand side of differential equation)
#'
#' @return A list containing the approximate potential difference between x and x0 and the estimated error
#' @export
#'
#' @author Pablo Rodríguez-Sánchez (\url{https://pabrod.github.io})
#'
#'
#' @seealso \code{\link{approxPot1D}, \link{approxPot2D}}
#'
#' @examples
#' # One dimensional flow
#' f <- function(x) { cos(x) }
#'
#' # Evaluation points
#' x0 <- 1
#' x1 <- 1.02
#'
#' dV <- deltaV(f, x1, x0)
#'
#'  # Two dimensional flow
#' f <- function(x) { c(
#'  -2*x[1]*x[2],
#'  -x[1]^2 - 1
#' )}
#'
#' # Evaluation points
#' x0 <- matrix(c(1,2), ncol = 1)
#' x1 <- matrix(c(0.98,2.01), ncol = 1)
#'
#' dV <- deltaV(f, x1, x0)
deltaV <- function(f, x, x0) {

  # Calculate 0th and 1st derivatives
  f0 <- f(x0)
  J0 <- numDeriv::jacobian(f, x0)

  # Perform the skew/symmetric decomposition
  J_symm <- Matrix::symmpart(J0)
  J_skew <- Matrix::skewpart(J0)

  # Use J_symm to estimate the difference in potential
  dV <- as.numeric(
        -f(x0) %*% (x - x0) +  # Linear term
        -0.5 * t(x-x0) %*% J_symm %*% (x - x0) # Quadratic term
  )

  # Use J_skew to estimate the error
  err <- norm(J_skew, type = 'f')

  # Return
  ls <- list(dV = dV, err = err)
  return(ls)
}
