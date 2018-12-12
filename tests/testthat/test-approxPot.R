context("Approximate potentials")

test_that("1D", {
  # Flow
  f = function(x) { sin(x) }

  # Sampling points
  xs <- seq(0, 2*pi, length.out = 1e3)

  # Expected, exact potential
  Vs_expected <- function(x) { cos(x) - cos(xs[1]) }

  # Approximated potential
  Vs <- approxPot1D(f, xs, V0 = 0)

  # Compare both
  expect_equal(Vs, Vs_expected(xs), tolerance = 1e-4)

})

test_that("1D auto", {
  # Flow
  f = function(x) { sin(x) }

  # Sampling points
  xs <- seq(0, 2*pi, length.out = 1e2)

  # Expected, exact potential
  Vs_expected <- function(x) { cos(x) - cos(xs[1]) }

  # Approximated potential
  Vs <- approxPot1D(f, xs, V0 = 'auto')

  # Compare both
  expect_equal(0, min(Vs))

})

test_that("2D exact horizontal", {
  # Flow
  f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}

  # Sampling points
  xs <- seq(-1.5, 1.5, length.out = 125)
  ys <- seq(-1.5, 1.5, length.out = 120)

  # Expected, exact potential
  Vs_exact <- function(x, y) { x^2/4*(x^2 - 2*1.1) + y^2/4*(y^2 - 2*1) }

  # Evaluate exact potential
  Vs_expected <- matrix(0, nrow = length(xs), ncol = length(ys))
  for(i in 1:length(xs)) {
    for(j in 1:length(ys)) {
      Vs_expected[i,j] <- Vs_exact(xs[i], ys[j])
    }
  }
  Vs_expected <- Vs_expected - Vs_exact(xs[1], ys[1])

  # Approximated potential
  result <- approxPot2D(f, xs, ys, V0 = 0, mode = 'horizontal')

  # Compare both
  expect_equal(result$V, Vs_expected, tolerance = 2e-3)
  expect_equal(as.numeric(result$err), rep(0, length(result$err)), tolerance = 2e-6)
})

test_that("2D exact vertical", {
  # Flow
  f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}

  # Sampling points
  xs <- seq(-1.5, 1.5, length.out = 125)
  ys <- seq(-1.5, 1.5, length.out = 120)

  # Expected, exact potential
  Vs_exact <- function(x, y) { x^2/4*(x^2 - 2*1.1) + y^2/4*(y^2 - 2*1) }

  # Evaluate exact potential
  Vs_expected <- matrix(0, nrow = length(xs), ncol = length(ys))
  for(i in 1:length(xs)) {
    for(j in 1:length(ys)) {
      Vs_expected[i,j] <- Vs_exact(xs[i], ys[j])
    }
  }
  Vs_expected <- Vs_expected - Vs_exact(xs[1], ys[1])

  # Approximated potential
  result <- approxPot2D(f, xs, ys, V0 = 0, mode = 'vertical')

  # Compare both
  expect_equal(result$V, Vs_expected, tolerance = 2e-3)
  expect_equal(as.numeric(result$err), rep(0, length(result$err)), tolerance = 2e-6)
})

test_that("2D exact mixed", {
  # Flow
  f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}

  # Sampling points
  xs <- seq(-1.5, 1.5, length.out = 125)
  ys <- seq(-1.5, 1.5, length.out = 120)

  # Expected, exact potential
  Vs_exact <- function(x, y) { x^2/4*(x^2 - 2*1.1) + y^2/4*(y^2 - 2*1) }

  # Evaluate exact potential
  Vs_expected <- matrix(0, nrow = length(xs), ncol = length(ys))
  for(i in 1:length(xs)) {
    for(j in 1:length(ys)) {
      Vs_expected[i,j] <- Vs_exact(xs[i], ys[j])
    }
  }
  Vs_expected <- Vs_expected - Vs_exact(xs[1], ys[1])

  # Approximated potential
  result <- approxPot2D(f, xs, ys, V0 = 0, mode = 'mixed')

  # Compare both
  expect_equal(result$V, Vs_expected, tolerance = 2e-3)
  expect_equal(as.numeric(result$err), rep(0, length(result$err)), tolerance = 2e-6)
})

test_that("2D wrong mode", {
  # Flow
  f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}

  # Sampling points
  xs <- seq(-1.5, 1.5, length.out = 125)
  ys <- seq(-1.5, 1.5, length.out = 120)

  # Approximated potential
  expect_error(
    result <- approxPot2D(f, xs, ys, V0 = 0, mode = 'wrong')
  )
})

test_that("2D auto", {
  # Flow
  f = function(x) {c(-x[1]*(x[1]^2 - 1.1), -x[2]*(x[2]^2 - 1))}

  # Sampling points
  xs <- seq(-1.5, 1.5, length.out = 50)
  ys <- seq(-1.5, 1.5, length.out = 75)

  # Approximated potential
  result <- approxPot2D(f, xs, ys, V0 = 'auto')

  expect_equal(min(c(result$V)), 0)

})
