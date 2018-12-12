#' Approximate potential in 1D
#'
#' @param f Dynamics
#' @param xs Vector of positions to evaluate
#' @param V0 (Optional) Value of V at first element of xs (0 by default)
#'
#' @return The potential estimated at each point in xs
#' @export
#'
#' @examples
#' # Flow
#' f = function(x) { sin(x) }
#'
#' # Sampling points
#' xs <- seq(0, 2*pi, length.out = 1e3)
#'
#' # Approximated potential
#' Vs <- approxPot1D(f, xs)
approxPot1D <- function(f, xs, V0 = 0) {
  # Initialize
  V <- vector(mode="numeric", length = length(xs))
  V[1] <- V0

  # Compute
  for(i in 2:length(xs)) {
    temp <- deltaV(f, xs[i], xs[i-1])
    V[i] = V[i-1] + temp$dV
  }

  return(V)
}

#' Approximate potential in 1D
#'
#' @param f Dynamics
#' @param xs Vector xs positions to evaluate
#' @param ys Vector of ys positions to evaluate
#' @param V0 (Optional) Value of V at first element of (xs,ys) (0 by default)
#' @param mode (Optional) Integration mode. Options are horizontal (default), vertical and mixed
#'
#' @return The potential estimated at each point (xs, ys)
#' @export
#'
#' @examples
#' # Flow
#' f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}
#'
#' # Sampling points
#' xs <- seq(-1.5, 1.5, length.out = 10)
#' ys <- seq(-1.5, 1.5, length.out = 15)
#'
#' # Approximated potential
#' Vs <- approxPot2D(f, xs, ys, mode = 'horizontal')
approxPot2D <- function(f, xs, ys, V0 = 0, mode = 'horizontal') {
  # Initialize
  V <- matrix(0, nrow = length(xs), ncol = length(ys))
  err <- matrix(0, nrow = length(xs), ncol = length(ys))
  V[1,1] <- V0

  # Compute
  for(i in 2:length(xs)) {
    temp <- deltaV(f, c(xs[i], ys[1]), c(xs[i-1], ys[1]))
    V[i,1] <- V[i-1,1] + temp$dV
    err[i,1] <- temp$err
  }

  for(j in 2:length(ys)) {
    temp <- deltaV(f, c(xs[1], ys[j]), c(xs[1], ys[j-1]))
    V[1,j] <- V[1,j-1] + temp$dV
    err[1,j] <- temp$err
  }

  for(i in 2:length(xs)) {
    for(j in 2:length(ys)) {

      if(mode == 'horizontal') {

        temp <- deltaV(f, c(xs[i], ys[j]), c(xs[i-1], ys[j]))
        V[i,j] <- V[i-1,j] + temp$dV
        err[i,j] <- temp$err

      } else if(mode == 'vertical') {

        temp <- deltaV(f, c(xs[i], ys[j]), c(xs[i], ys[j-1]))
        V[i,j] <- V[i,j-1] + temp$dV
        err[i,j] <- temp$err

      } else if(mode == 'mixed') {

        temp_hor <- deltaV(f, c(xs[i], ys[j]), c(xs[i-1], ys[j]))
        V_hor <- V[i-1,j] + temp_hor$dV
        temp_ver <- deltaV(f, c(xs[i], ys[j]), c(xs[i], ys[j-1]))
        V_ver <- V[i,j-1] + temp_ver$dV
        V[i,j] <- mean(c(V_hor, V_ver))
        err[i,j] <- mean(c(temp_hor$err, temp_ver$err))

      } else {

        stop("Error: supported modes are horizontal (default), vertical and mixed")

      }
    }
  }

  return(list(V = V, err = err))
}
