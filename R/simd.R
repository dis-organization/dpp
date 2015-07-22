#' Create simple coordinates
#'
#' @param n integer, number of coordinates
#' @param p optional, PROJ.4 string to return transformed coordinates
#'
#' @return \code{\link[dplyr]{tbl_df}} with two columns, \code{x} and \code{y}
#' @export
#' @importFrom dplyr data_frame
#' @importFrom proj4  project
#' @importFrom stats runif
#' @examples
#' set.seed(27)
#' x <- simd(10)
#' set.seed(27)
#' y <- simd(10, "+proj=laea")
simd <- function(n, p = NULL) {
  x <- data_frame(x = runif(n, -180, 180), y = runif(n, -90, 90), id = seq(n))
  ## what do we do here in order to return a tbl_df?
  ## is there a dplyr %>% way to assign pairs (or more) mutated variables? 
  if (!is.null(p)) {
    m <- as.matrix(x[,c("x", "y")])
    m <- project(m, p)
    x$x <- m[,1L]
    x$y <- m[,2L]
  }
  x
}