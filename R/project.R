#' Transform coordinates
#'
#' @param x 
#' @param target
#' @param ... 
#' @export
ptransform <- function(x, ...) {
  UseMethod("ptransform")
}

#' @rdname ptransform
#' @export
#' @importFrom proj4 ptransform
ptransform.default <- function(x, ...) {
  proj4::ptransform(data = x, ...)
}
.src_proj <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0"

#' @rdname ptransform
#' @export
ptransform.tbl_df <- function(x, target) {
  ## for now we are always forward transform
  ## and assuming x/y
  ## note that ptransform already takes a list, so tbl_df is fine . . .
  x0 <- x[, c("x", "y")] %>% mutate(x = x/180*pi, y = y/180*pi)
  x0 <- ptransform.default(x0, .src_proj, target)
  x$x <- x0$x
  x$y <- x0$y
  x
}

#' @rdname ptransform
#' @export
ptransform.gris <- function(x, target) {
  ## we don't actually need anything from gris for this . . .
  x$v <- ptransform(x$v, target)
  x
}