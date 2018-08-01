#' Symmetric - skew decomposition of a square matrix
#'
#' @param A the matrix to be decomposed
#'
#' @return B a list containing the symmetric and skew parts
#'
#' @examples
#' A <- matrix(c(1,2,3,4), 2, 2)
#' B <- skewsymm(A)
skewsymm <- function(A) {
  symm <- (A + t(A))/2
  skew <- (A - t(A))/2

  B <- list()
  B$symm <- symm
  B$skew <- skew

  B
}
