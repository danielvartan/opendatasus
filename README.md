
<!-- README.md is generated from README.Rmd. Please edit that file -->

# opendatasus

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/danielvartan/opendatasus/workflows/R-CMD-check/badge.svg)](https://github.com/danielvartan/opendatasus/actions)
[![Codecov test
coverage](https://codecov.io/gh/danielvartan/opendatasus/branch/main/graph/badge.svg)](https://app.codecov.io/gh/danielvartan/opendatasus?branch=main)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
[![Contributor
Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](https://danielvartan.github.io/opendatasus/CODE_OF_CONDUCT.html)
<!-- badges: end -->

## Overview

`opendatasus` is an user-friendly R package designed for downloading and
processing data from the [DATASUS](https://datasus.saude.gov.br/)’s
[openDataSUS platform](https://opendatasus.saude.gov.br).

## Prerequisites

To use the main functions of `opendatasus`, some familiarity with the [R
programming language](https://www.r-project.org/) is required.

If you are not comfortable with R, we strongly recommend checking out
Hadley Wickham and Garrett Grolemund’s free online book [R for Data
Science](https://r4ds.hadley.nz/), as well as the Coursera course [Data
Science: Foundations using
R](https://www.coursera.org/specializations/data-science-foundations-r)
from John Hopkins University.

## Installation

You can install `opendatasus` using:

``` r
# install.packages("remotes")
remotes::install_github("danielvartan/opendatasus")
```

## Usage

We’re working on new API functions to make it easier to access the data
available on the openDataSUS platform. You can find a list of available
functions
[here](https://danielvartan.github.io/opendatasus/reference/index.html).

Example of use:

``` r
library(opendatasus)

fetch_demas_sisvan(uf = "SP") |>
  dplyr::glimpse()
#> Rows: 20
#> Columns: 33
#> $ status_participacao                    <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ codigo_municipio                       <int> 354240, 351880, 351630, 354220,…
#> $ uf                                     <chr> "SP", "SP", "SP", "SP", "SP", "…
#> $ municipio                              <chr> "REGENTE FEIJO", "GUARULHOS", "…
#> $ codigo_cnes                            <chr> "2751151", "2062119", "2083809"…
#> $ idade                                  <int> 9, 31, 4, 3, 26, 57, 26, 65, 50…
#> $ codigo_fase_vida                       <dbl> 5, 7, 3, 3, 7, 7, 7, 8, 7, 8, 2…
#> $ fase_vida                              <chr> "ENTRE 7 ANOS A 10 ANOS", "ADUL…
#> $ sexo                                   <chr> "M", "F", "F", "M", "F", "F", "…
#> $ codigo_raca_cor                        <chr> "01", "04", "01", "01", "01", "…
#> $ raca_cor                               <chr> "BRANCA", "PARDA", "BRANCA", "B…
#> $ codigo_povo_comunidade                 <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ povo_comunidade                        <chr> "NÃO INFORMADO", "NÃO INFORMADO…
#> $ codigo_escolaridade                    <int> 99, 99, 99, 99, 6, 5, 6, NA, NA…
#> $ escolaridade                           <chr> "SEM INFORMAÇÃO", "SEM INFORMAÇ…
#> $ data_acompanhamento                    <chr> "2016-02-02", "2016-02-29", "20…
#> $ ano_mes_competencia                    <chr> "201602", "201602", "201602", "…
#> $ peso                                   <chr> "51.00", "100", "15", "15.2", "…
#> $ altura                                 <chr> "174", "164", "75", "98", "1.59…
#> $ imc                                    <chr> "16.85", "37.18", "26.67", "15.…
#> $ imc_pre_gestacional                    <chr> NA, NA, NA, NA, NA, NA, "32.4",…
#> $ peso_x_idade                           <chr> "Peso elevado para a idade", NA…
#> $ peso_x_altura                          <chr> NA, NA, "Obesidade", "Peso Adeq…
#> $ crianca_altura_x_idade                 <chr> "Estatura adequada para a idade…
#> $ crianca_imc_x_idade                    <chr> "Eutrofia", NA, "Obesidade", "E…
#> $ adolescente_altura_x_idade             <chr> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ adolescente_imc_x_idade                <chr> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ codigo_estado_nutricional_adulto       <chr> NA, "Obesidade Grau II", NA, NA…
#> $ codigo_estado_nutricional_idoso        <chr> NA, NA, NA, NA, NA, NA, NA, "So…
#> $ codigo_estado_nutricional_imc_gestante <chr> NA, NA, NA, NA, NA, NA, "Adequa…
#> $ codigo_sistema_origem_acompanhamento   <int> 1, 2, 2, 2, 1, 1, 1, 4, 4, 4, 4…
#> $ sistema_origem_acompanhamento          <chr> "SISVAN WEB", "AUXILIO BRASIL",…
#> $ codigo_sequencial_acompanhamento       <int> 969128171, 978846659, 978880325…
```

## Citation

If you use `opendatasus` in your research, please consider citing it. We
have put a lot of work into building and maintaining this free and
open-source R package. The citation can be found below.

``` r
citation("opendatasus")
#> To cite {opendatasus} in publications use:
#> 
#>   Vartanian, D. (2024). {opendatasus}: access openDataSUS APIs in R. R
#>   package version 0.0.1.9000.
#>   https://danielvartan.github.io/opendatasus/
#> 
#> Uma entrada BibTeX para usuários(as) de LaTeX é
#> 
#>   @Unpublished{,
#>     title = {{opendatasus}: access openDataSUS APIs in R},
#>     author = {Daniel Vartanian},
#>     year = {2024},
#>     url = {https://danielvartan.github.io/opendatasus/},
#>     note = {R package version 0.0.1.9000},
#>   }
```

## Contributing

We welcome contributions, including bug reports.

Please take a moment to review our [Guidelines for
Contributing](https://danielvartan.github.io/opendatasus/CONTRIBUTING.html).

<br>

Become a supporter of `opendatasus`!

Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please indicate the `opendatasus` package in your donation
message.
