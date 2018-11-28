context('Jacobian')

test_that('Test at single point',
          {
            # Input
            f_vector <- function(x) {
              c(
                x[1]^2 - x[2]^2,
                cos(x[1])
              )
            }
            x_test <- c(pi, 1)

            # Compare
            J_obtained <- numDeriv::jacobian(f_vector, x_test)
            J_expected <- matrix(c(2*pi, -sin(pi), -2, 0), nrow = 2, ncol = 2)

            expect_equal(J_obtained, J_expected)
          }
)

test_that('Test at set of points',
          {
            # Input
            f_vector <- function(x) {
              c(
                x[1]^2 - x[2]^2,
                cos(x[1])
              )
            }
            xs_test <- list(c(0,pi),
                           c(pi,0))

            # Compare
            Js_obtained <- lapply(xs_test, numDeriv::jacobian, func = f_vector)
            Js_expected <- list(
                                matrix(c(0, 0, -2*pi, 0), nrow = 2, ncol = 2),
                                matrix(c(2*pi, 0, 0, 0), nrow = 2, ncol = 2)
                                )
            expect_equal(Js_obtained, Js_expected)
          }
)
