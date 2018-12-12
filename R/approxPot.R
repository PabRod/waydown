#' Approximate potential in one dimension
#'
#' @param f One-dimensional representing the flow (right hand side of differential equation)
#' @param xs Vector of positions to evaluate
#' @param V0 (Optional) Value of V at first element of xs. When default, the global minimum is assigned 0
#'
#' @return The potential estimated at each point in xs
#' @export
#'
#' @author Pablo Rodríguez-Sánchez (\url{https://pabrod.github.io})
#'
#'
#' @seealso \code{\link{approxPot2D}, \link{deltaV}}
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
approxPot1D <- function(f, xs, V0 = 'auto') {
  # Initialize
  V <- vector(mode="numeric", length = length(xs))

  # Assign initial value
  # The algorithm is a recursion relationship. It needs an initial potential at the first integration point
  if (V0 == 'auto') {
    V[1] <- 0 # Assign any, it will be overriden later
  } else {
    V[1] <- V0 # Assign the desired reference potential
  }

  # Compute
  for(i in 2:length(xs)) {
    temp <- deltaV(f, xs[i], xs[i-1])
    V[i] = V[i-1] + temp$dV
  }

  if(V0 == 'auto') {
    V <- V - min(V) # Make V_min = 0
  }

  return(V)
}

#' Approximate potential in two dimensions
#'
#' @param f Two-dimensional representing the flow (right hand side of differential equation)
#' @param xs Vector xs positions to evaluate
#' @param ys Vector of ys positions to evaluate
#' @param V0 (Optional) Value of V at first element of (xs,ys). When default, the global minimum is assigned 0
#' @param mode (Optional) Integration mode. Options are horizontal (default), vertical and mixed
#'
#' @return The potential estimated at each point (xs, ys)
#' @export
#'
#' @author Pablo Rodríguez-Sánchez (\url{https://pabrod.github.io})
#'
#'
#' @seealso \code{\link{approxPot1D}, \link{deltaV}}
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
approxPot2D <- function(f, xs, ys, V0 = 'auto', mode = 'horizontal') {
  # Initialize
  V <- matrix(0, nrow = length(xs), ncol = length(ys))
  err <- matrix(0, nrow = length(xs), ncol = length(ys))

  # Assign initial value
  # The algorithm is a recursion relationship. It needs an initial potential at the first integration point
  if (V0 == 'auto') {
    V[1,1] <- 0 # Assign any, it will be overriden later
  } else {
    V[1,1] <- V0 # Assign the desired reference potential
  }

  # Compute
  # We first compute along the first column...
  for(i in 2:length(xs)) {
    temp <- deltaV(f, c(xs[i], ys[1]), c(xs[i-1], ys[1]))
    V[i,1] <- V[i-1,1] + temp$dV
    err[i,1] <- temp$err
  }

  # ... and then along the first row...
  for(j in 2:length(ys)) {
    temp <- deltaV(f, c(xs[1], ys[j]), c(xs[1], ys[j-1]))
    V[1,j] <- V[1,j-1] + temp$dV
    err[1,j] <- temp$err
  }

  # ... and last but not least, we fill the inside gaps
  for(i in 2:length(xs)) {
    for(j in 2:length(ys)) {

      if(mode == 'horizontal') { # Sweep horizontally

        temp <- deltaV(f, c(xs[i], ys[j]), c(xs[i-1], ys[j]))
        V[i,j] <- V[i-1,j] + temp$dV
        err[i,j] <- temp$err

      } else if(mode == 'vertical') { # Sweep vertically

        temp <- deltaV(f, c(xs[i], ys[j]), c(xs[i], ys[j-1]))
        V[i,j] <- V[i,j-1] + temp$dV
        err[i,j] <- temp$err

      } else if(mode == 'mixed') { # Sweep in both directions, then take the mean

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

  if(V0 == 'auto') {
    V <- V - min(c(V)) # Make V_min = 0
  }

  return(list(V = V, err = err))
}
