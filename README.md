
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

It is important to be aware of the limitations of the APIs you are
using. Many APIs have limitations regarding the amount of data and
number of requests that can be made in a given period of time.
Therefore, this package may not serve as a solution for large-scale data
extraction.

To access [DATASUS](https://datasus.saude.gov.br/)’s data not indexed on
the [openDataSUS platform](https://opendatasus.saude.gov.br), check out
Saldanha, Bastos & Barcellos’s
[`microdatasus`](https://github.com/rfsaldanha/microdatasus) R package,
the [DATASUS’s file
transfer](https://datasus.saude.gov.br/transferencia-de-arquivos/) &
[DATASUS’s TabNet
system](https://datasus.saude.gov.br/informacoes-de-saude-tabnet/).

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

fetch_demas_sisvan(uf = "SP") |> dplyr::glimpse()
#> Rows: 20
#> Columns: 33
#> $ status_participacao                    <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ codigo_municipio                       <int> 350410, 352510, 353060, 351740,…
#> $ uf                                     <chr> "SP", "SP", "SP", "SP", "SP", "…
#> $ municipio                              <chr> "ATIBAIA", "JARDINOPOLIS", "MOG…
#> $ codigo_cnes                            <chr> "2066335", "9008837", "2773759"…
#> $ idade                                  <int> 8, 17, 1, 31, 34, 32, 38, 4, 5,…
#> $ codigo_fase_vida                       <dbl> 5, 6, 2, 7, 7, 7, 7, 3, 4, 4, 7…
#> $ fase_vida                              <chr> "ENTRE 7 ANOS A 10 ANOS", "ADOL…
#> $ sexo                                   <chr> "M", "F", "M", "F", "F", "F", "…
#> $ codigo_raca_cor                        <chr> "01", "99", "03", "99", "04", "…
#> $ raca_cor                               <chr> "BRANCA", "SEM INFORMACAO", "AM…
#> $ codigo_povo_comunidade                 <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ povo_comunidade                        <chr> "NÃO INFORMADO", "NÃO INFORMADO…
#> $ codigo_escolaridade                    <int> NA, 99, NA, 99, NA, 99, 99, 99,…
#> $ escolaridade                           <chr> "SEM INFORMAÇÃO", "SEM INFORMAÇ…
#> $ data_acompanhamento                    <chr> "2020-07-14", "2020-07-06", "20…
#> $ ano_mes_competencia                    <chr> "202007", "202007", "202007", "…
#> $ peso                                   <chr> "27,3", "64,7", "9", "79", "69"…
#> $ altura                                 <chr> "135", "162", "74", "169", "157…
#> $ imc                                    <chr> "14,98", "24,65", "16,44", "27,…
#> $ imc_pre_gestacional                    <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ peso_x_idade                           <chr> "Peso adequado para idade", NA,…
#> $ peso_x_altura                          <chr> NA, NA, "Peso Adequado ou Eutro…
#> $ crianca_altura_x_idade                 <chr> "Estatura adequada para a idade…
#> $ crianca_imc_x_idade                    <chr> "Eutrofia", NA, "Eutrofia", NA,…
#> $ adolescente_altura_x_idade             <chr> NA, "Estatura adequada para a i…
#> $ adolescente_imc_x_idade                <chr> NA, "Eutrofia", NA, NA, NA, NA,…
#> $ codigo_estado_nutricional_adulto       <chr> NA, NA, NA, "Sobrepeso", "Sobre…
#> $ codigo_estado_nutricional_idoso        <lgl> NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ codigo_estado_nutricional_imc_gestante <chr> NA, NA, NA, NA, "Adequado ou eu…
#> $ codigo_sistema_origem_acompanhamento   <int> 4, 4, 4, 4, 2, 2, 2, 2, 2, 2, 1…
#> $ sistema_origem_acompanhamento          <chr> "E-SUS AB", "E-SUS AB", "E-SUS …
#> $ codigo_sequencial_acompanhamento       <int> 1256232492, 1256235235, 1256712…
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
