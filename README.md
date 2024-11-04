
<!-- README.md is generated from README.Rmd. Please edit that file -->

# libminer

<!-- badges: start -->

[![R-CMD-check](https://github.com/ateucher/libminer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ateucher/libminer/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of libminer is to provide an overview of your R library setup.
It is a toy package created as a part of a workshop and not meant for
serious use.

## Installation

You can install the development version of libminer from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ateucher/libminer")
```

## Example usage

To get a nicely formatted tibble of your installed packages, use the
`lib()` function:

``` r
library(libminer)
lib()
#> # A tibble: 406 × 16
#>    Package  LibPath Version Priority Depends Imports LinkingTo Suggests Enhances
#>    <chr>    <chr>   <chr>   <chr>    <chr>   <chr>   <chr>     <chr>    <chr>   
#>  1 libminer /priva… 0.0.0.… <NA>     R (>= … "cli,\… <NA>      "knitr,… <NA>    
#>  2 abind    /Users… 1.4-8   <NA>     R (>= … "metho… <NA>       <NA>    <NA>    
#>  3 anytime  /Users… 0.3.9   <NA>     R (>= … "Rcpp … Rcpp (>=… "tinyte… <NA>    
#>  4 arrow    /Users… 17.0.0… <NA>     R (>= … "asser… cpp11 (>… "blob, … <NA>    
#>  5 askpass  /Users… 1.2.1   <NA>     <NA>    "sys (… <NA>      "testth… <NA>    
#>  6 assertt… /Users… 0.2.1   <NA>     <NA>    "tools" <NA>      "testth… <NA>    
#>  7 backpor… /Users… 1.5.0   <NA>     R (>= …  <NA>   <NA>       <NA>    <NA>    
#>  8 base64e… /Users… 0.1-3   <NA>     R (>= …  <NA>   <NA>       <NA>    png     
#>  9 bayespl… /Users… 1.11.1  <NA>     R (>= … "dplyr… <NA>      "ggfort… <NA>    
#> 10 bccamtr… /Users… 0.0.0.… <NA>     R (>= … "bcmap… <NA>      "DBI,\n… <NA>    
#> # ℹ 396 more rows
#> # ℹ 7 more variables: License <chr>, License_is_FOSS <chr>,
#> #   License_restricts_use <chr>, OS_type <chr>, MD5sum <chr>,
#> #   NeedsCompilation <chr>, Built <chr>
```

To get a count of installed packages, grouped by any combination of
variables in the `lib()` data.frame, optionally with the total sizes,
use the `lib_summary()` function:

``` r
lib_summary(LibPath, License)
#> # A tibble: 42 × 3
#>    LibPath                                                         License     n
#>    <chr>                                                           <chr>   <int>
#>  1 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… GPL         1
#>  2 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… GPL (>…     5
#>  3 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… GPL (>…     1
#>  4 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… GPL-2 …     5
#>  5 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… LGPL (…     1
#>  6 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… Part o…    14
#>  7 /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/l… Unlimi…     2
#>  8 /Users/andy/Library/R/arm64/4.4/library                         Apache…     1
#>  9 /Users/andy/Library/R/arm64/4.4/library                         Apache…     2
#> 10 /Users/andy/Library/R/arm64/4.4/library                         Apache…     5
#> # ℹ 32 more rows
```

Specify `sizes = TRUE` to calculate the total size on disk of your
packages

``` r
lib_summary(LibPath, NeedsCompilation, sizes = TRUE)
#> ℹ Calculating sizes...
#> # A tibble: 7 × 4
#>   LibPath                                          NeedsCompilation     n   size
#>   <chr>                                            <chr>            <int>  <dbl>
#> 1 /Library/Frameworks/R.framework/Versions/4.4-ar… no                   2 8.81e5
#> 2 /Library/Frameworks/R.framework/Versions/4.4-ar… yes                 23 6.14e7
#> 3 /Library/Frameworks/R.framework/Versions/4.4-ar… <NA>                 4 4.70e6
#> 4 /Users/andy/Library/R/arm64/4.4/library          no                 216 3.23e8
#> 5 /Users/andy/Library/R/arm64/4.4/library          yes                158 1.84e9
#> 6 /Users/andy/Library/R/arm64/4.4/library          <NA>                 2 3.70e6
#> 7 /private/var/folders/_f/n9fw7ctx3fqf2ty9ylw502g… <NA>                 1 1.79e4
```
