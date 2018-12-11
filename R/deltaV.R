#' Approximate potential difference between two points
#'
#' @param x Position where we want to know the approximate potential
#' @param x0 Reference position (center of the Taylor expansion)
#' @param f Dynamics
#'
#' @return The approximate potential difference between x and x0
#' @export
#'
#' @examples
#'  # Flow
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

  # Keep only the symmetric part
  J_symm <- Matrix::symmpart(J0)

  # Estimate the difference in potential
  dV <- -f(x0) %*% (x - x0) +  # Linear term
        -0.5 * t(x-x0) %*% J_symm %*% (x - x0) # Quadratic term

  # Return as numeric, not as 1 x 1 matrix
  return(as.numeric(dV))
}
