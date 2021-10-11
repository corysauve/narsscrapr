
<!-- README.md is generated from README.Rmd. Please edit that file -->

# narsscrapr

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of narsscrapr is to provide an interface to data collected by
the [National Aquatic Resource Surveys
(NARS)](https://www.epa.gov/national-aquatic-resource-surveys).

Surveys conducted by NARS include:

  - [National Coastal Condition Assessment
    (NCCA)](https://www.epa.gov/national-aquatic-resource-surveys/ncca)
  - [National Lakes Assessment
    (NLA)](https://www.epa.gov/national-aquatic-resource-surveys/nla)
  - [National Rivers and Streams Assessment
    (NRSA)](https://www.epa.gov/national-aquatic-resource-surveys/nrsa)
  - [National Wetland Condition Assessment
    (NWCA)](https://www.epa.gov/national-aquatic-resource-surveys/nwca)

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("corysauve/narsscrapr")
```

## Basic Usage

You can scrape NARS data by `survey`, survey `year`, and survey
`parameter`:

``` r
library(narsscrapr)

scrape_nars(survey = "NLA", year = 2007, parameter = "Profile")
#> Parsed with column specification:
#> cols(
#>   SITE_ID = col_character(),
#>   YEAR = col_double(),
#>   VISIT_NO = col_double(),
#>   DATE_PROFILE = col_character(),
#>   SAMPLED_PROFILE = col_character(),
#>   DEPTH = col_double(),
#>   METALIMNION = col_character(),
#>   TEMP_FIELD = col_double(),
#>   DO_FIELD = col_double(),
#>   PH_FIELD = col_double(),
#>   COND_FIELD = col_double(),
#>   FLAG_PROFILE = col_character(),
#>   COMMENT_PROFILE = col_character()
#> )
#> # A tibble: 12,670 x 13
#>    SITE_ID  YEAR VISIT_NO DATE_PROFILE SAMPLED_PROFILE DEPTH METALIMNION
#>    <chr>   <dbl>    <dbl> <chr>        <chr>           <dbl> <chr>      
#>  1 NLA066…  2007        1 7/31/2007    YES                 0 <NA>       
#>  2 NLA066…  2007        1 7/31/2007    YES                 1 <NA>       
#>  3 NLA066…  2007        1 7/31/2007    YES                 2 <NA>       
#>  4 NLA066…  2007        1 7/31/2007    YES                 3 <NA>       
#>  5 NLA066…  2007        1 7/31/2007    YES                 4 <NA>       
#>  6 NLA066…  2007        1 7/31/2007    YES                 5 <NA>       
#>  7 NLA066…  2007        1 7/31/2007    YES                 6 <NA>       
#>  8 NLA066…  2007        1 7/31/2007    YES                 7 <NA>       
#>  9 NLA066…  2007        1 7/31/2007    YES                 8 <NA>       
#> 10 NLA066…  2007        1 6/14/2007    YES                 0 <NA>       
#> # … with 12,660 more rows, and 6 more variables: TEMP_FIELD <dbl>,
#> #   DO_FIELD <dbl>, PH_FIELD <dbl>, COND_FIELD <dbl>, FLAG_PROFILE <chr>,
#> #   COMMENT_PROFILE <chr>
```

Metadata for each `parameter` is selected with `type = "metadata"`:

``` r
library(narsscrapr)

scrape_nars(survey = "NLA", year = 2007, parameter = "Profile", type = "metadata")
#> # A tibble: 13 x 2
#>    NAME            LABEL                                                       
#>    <fct>           <fct>                                                       
#>  1 SITE_ID         Lake Site Identification Code                               
#>  2 YEAR            Sample Year                                                 
#>  3 VISIT_NO        Within-year Sample Visit Number                             
#>  4 DATE_PROFILE    Date of lake profile                                        
#>  5 SAMPLED_PROFILE SAMPLED variable from profile data                          
#>  6 DEPTH           Profile Depth (m)                                           
#>  7 METALIMNION     Field Crew Flag for Depth of T)op and B)ottom of Metalimnion
#>  8 TEMP_FIELD      Field Water Temperature (oC)                                
#>  9 DO_FIELD        Field Dissolved Oxygen (mg/L)                               
#> 10 PH_FIELD        Field pH                                                    
#> 11 COND_FIELD      Field Conductivity (uS at 25 oC assuming 2.2%/oC)           
#> 12 FLAG_PROFILE    Data flag from lake profile form                            
#> 13 COMMENT_PROFILE Comment and flag explanation
```

## Contributing

I welcome any contributions or suggestions for improving this package\!
Please open an issue to do so.

## License

The narsscrapr package is licensed under the MIT License. Please see the
[LICENSE](LICENSE.md) for more details.
