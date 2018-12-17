context("Potential difference approximation")

test_that("1D exact", {
  # Flow
  f <- function(x) { sin(x) }

  # Evaluation points
  x0 <- 1
  x1 <- 1.01

  results <- deltaV(f, x1, x0)
  dV <- results$dV

  # Compare with expected result
  V_expected <- function(x) { cos(x) }
  dV_expected <- V_expected(x1) - V_expected(x0)
  expect_equal(results$dV, dV_expected, tolerance = 1e-4)
  expect_equal(results$err, 0, tolerance = 1e-6)
})

test_that("2D exact", {
  # Flow
  f <- function(x) { c(
                    -2*x[1]*x[2],
                    -x[1]^2 - 1
                    )}

  # Evaluation points
  x0 <- matrix(c(1,2), ncol = 1)
  x1 <- matrix(c(0.98,2.01), ncol = 1)

  results <- deltaV(f, x1, x0)

  # Compare with expected result
  V_expected <- function(x) {x[1]^2*x[2] + x[2]}
  dV_expected <- V_expected(x1) - V_expected(x0)
  expect_equal(results$dV, dV_expected, tolerance = 1e-4)
  expect_equal(results$err, 0, tolerance = 1e-6)
})

test_that("2D exact loose input", {
  # Flow
  f <- function(x) { c(
    -2*x[1]*x[2],
    -x[1]^2 - 1
  )}

  # Evaluation points (not as explicit column vectors)
  x0 <- c(1,2)
  x1 <- c(0.98,2.01)

  results <- deltaV(f, x1, x0)

  # Compare with expected result
  V_expected <- function(x) {x[1]^2*x[2] + x[2]}
  dV_expected <- V_expected(x1) - V_expected(x0)
  expect_equal(results$dV, dV_expected, tolerance = 1e-4)
  expect_equal(results$err, 0, tolerance = 1e-6)
})

test_that("2D curl", {
  # Flow
  f <- function(x) { c(
    -x[2],
    x[1]
  )}

  # Evaluation points (not as explicit column vectors)
  x0 <- c(1,2)
  x1 <- c(0.98,2.01)

  results <- deltaV(f, x1, x0)

  # Compare with expected result
  expect_equal(results$err, 1, tolerance = 1e-6)
})
