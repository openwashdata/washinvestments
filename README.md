
<!-- README.md is generated from README.Rmd. Please edit that file -->

# washinvestments

<!-- badges: start -->
<!-- badges: end -->

The goal of washinvestments is to …

## Installation

You can install the development version of washinvestments from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/washinvestments")
```

## Project goal

TODO

## Data

TODO

The package provides access to one data set.

``` r
library(washinvestments)
```

The `washinvestments` data set has 52 variables and 1873 observations.
For an overview of the variable names, see the following table.

``` r
washinvestments
```

| variable_name | variable_type | description                                  |
|:--------------|:--------------|:---------------------------------------------|
| id            | NA            | A running id for each entry.                 |
| mdb           | NA            | Name of the multilateral development bank.   |
| project_name  | NA            | Name of the investment project.              |
| region        | NA            | Classification of region under ?             |
| multi_country | NA            | Was this a multi country investment project? |

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(washinvestments)
## basic example code
```

## License

Data are available as
[CC-BY](https://github.com/openwashdata/washinvestments/LICENSE.md).

## Citation

To cite this package, please use:

``` r
citation("washinvestments")
#> To cite package 'washinvestments' in publications use:
#> 
#>   Schöbitz L (2024). _washinvestments: Multilateral development banks
#>   investment behaviour in water and sanitation_. R package version
#>   0.0.0.9000.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {washinvestments: Multilateral development banks investment behaviour in water and
#> sanitation},
#>     author = {Lars Schöbitz},
#>     year = {2024},
#>     note = {R package version 0.0.0.9000},
#>   }
```
