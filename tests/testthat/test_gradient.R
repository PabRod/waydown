context('Gradient')

test_that('Test at single point',
          {
            # Input
            f_scalar <- function(x) {3*x[1]^2 - x[2]^2}
            x_test <- c(1, 2)

            # Compare
            df_obtained <- numDeriv::grad(f_scalar, x_test)
            df_expected <- c(6, -4)

            expect_equal(df_obtained, df_expected)
          }
)

test_that('Test at set of points',
          {
            # Input
            f_scalar <- function(x) {3*x[1]^2 - x[2]^2}
            xs_test <- list(c(0,1),
                            c(1,1))

            # Compare
            aux <- function (x) {numDeriv::grad(f_scalar, x)}
            dfs_obtained <- lapply(xs_test, aux)
            dfs_expected <- list(c(0, -2), c(6, -2))
            expect_equal(dfs_obtained, dfs_expected)
          }
)
