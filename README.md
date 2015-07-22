<!-- README.md is generated from README.Rmd. Please edit that file -->
dpp
===

dplyr for paired calculations

dpp depends on dplyr and imports proj4, and can be installed with

    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data' 
    #> Note: no visible binding for global variable '.Data'

In the function `simd` I apply a geographic transformation on two columns x,y in a `tbl_df`. To do this I extract the columns as a matrix and pass them to proj4::project, then pull them back to copy over the original longitude/latitude x,y columns.

The function is used like this:

and it works like this:
