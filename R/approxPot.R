approxPot1D <- function(f, xs, V0 = 0) {
  # Initialize
  V <- vector(mode="numeric", length = length(xs))
  V[1] <- V0

  # Compute
  for(i in 2:length(xs)) {
    V[i] = V[i-1] + deltaV(f, xs[i], xs[i-1])
  }

  return(V)
}
