context('Skew symmetric decomposition')

test_that('Test symm',
          {
            A <- matrix(c(1,2,2,1), 2, 2)

            symm_expected <- A
            skew_expected <- matrix(0, 2, 2)

            expect_equal(Matrix::symmpart(A), symm_expected)
            expect_equal(Matrix::skewpart(A), skew_expected)
          }
)

test_that('Test skew',
          {
            A <- matrix(c(0,2,-2,0), 2, 2)

            symm_expected <- matrix(0, 2, 2)
            skew_expected <- A

            expect_equal(Matrix::symmpart(A), symm_expected)
            expect_equal(Matrix::skewpart(A), skew_expected)
          }
)

test_that('Test combined',
          {
            symm_expected <- matrix(c(1,2,2,4), 2, 2)
            skew_expected <- matrix(c(0, 1, -1, 0), 2, 2)

            A <- symm_expected + skew_expected

            expect_equal(Matrix::symmpart(A), symm_expected)
            expect_equal(Matrix::skewpart(A), skew_expected)
          }
)

test_that('Error',
          {
            A_non_square <- matrix(0, 2, 3)

            expect_error(Matrix::symmpart(A_non_square))
            expect_error(Matrix::skewpart(A_non_square))
          }
)
