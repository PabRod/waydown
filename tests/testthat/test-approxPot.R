context("Approximate potentials")

test_that("1D", {
  # Flow
  f = function(x) { sin(x) }

  # Sampling points
  xs <- seq(0, 2*pi, length.out = 1e3)

  # Expected, exact potential
  Vs_expected <- function(x) { cos(x) - cos(xs[1]) }

  # Approximated potential
  Vs <- approxPot1D(f, xs)

  # Compare both
  expect_equal(Vs, Vs_expected(xs), tolerance = 1e-4)

})
