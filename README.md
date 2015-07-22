<!-- README.md is generated from README.Rmd. Please edit that file -->
dpp
===

dplyr for paired calculations

dpp depends on dplyr and imports proj4, and can be installed with

``` r
devtools::install_github("mdsumner/dpp")
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data' 
#> Note: no visible binding for global variable '.Data'
#> Downloading github repo mdsumner/dpp@master
#> Installing dpp
#> "C:/R/R/bin/x64/R" --no-site-file --no-environ --no-save --no-restore  \
#>   CMD INSTALL  \
#>   "C:/Users/mdsumner/AppData/Local/Temp/RtmpoTP8l9/devtools1a48285ab58/mdsumner-dpp-43082e5"  \
#>   --library="C:/R/R/library" --install-tests
```

In the function `simd` I apply a geographic transformation on two columns x,y in a `tbl_df`. To do this I extract the columns as a matrix and pass them to proj4::project, then pull them back to copy over the original longitude/latitude x,y columns.

The function is used like this:

``` r
library(dpp) 
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> 
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
x <- simd(n = 10, p = "+proj=laea")
```

and it works like this:

``` r
  x <- data_frame(x = runif(n, -180, 180), y = runif(n, -90, 90), id = seq(n))
  if (!is.null(p)) {
    m <- as.matrix(x[,c("x", "y")])
    m <- project(m, p)
    x$x <- m[,1L]
    x$y <- m[,2L]
  }
```
