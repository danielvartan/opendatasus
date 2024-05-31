#' Fetch data from the SISVAN API
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' `fetch_demas_sisvan` fetches data from
#' [DEMAS](https://www.gov.br/saude/pt-br/composicao/seidigi/demas)'s
#' (Departamento de Monitoramento, Avaliação e Disseminação de Informações
#' Estratégicas em Saúde) [SISVAN](https://sisaps.saude.gov.br/sisvan/) (Sistema
#' de Vigilância Alimentar e Nutricional) API (Application Programming
#' Interface).
#'
#' @details
#'
#' Learn more about the SISVAN API at:
#'
#' * https://opendatasus.saude.gov.br/dataset/sisvan-estado-nutricional
#' * https://apidadosabertos.saude.gov.br/v1/
#'
#' @param codigo_municipio (optional) an integer number with the city code
#'   (default: `NULL`).
#' @param uf (optional) a string with the state code (default: `NULL`).
#' @param codigo_cnes (optional) a string with the
#'   [CNES](https://cnes.datasus.gov.br/) (Cadastro Nacional de Estabelecimentos
#'   de Saúde) code (default: `NULL`).
#' @param idade_minima (optional) an integer number with the minimum age
#'   (default: `NULL`).
#' @param idade_maxima (optional) an integer number with the maximum age
#'   (default: `NULL`).
#' @param codigo_fase_vida (optional) an integer number with the life phase
#'   code.
#' @param codigo_povo_comunidade (optional) an integer number with the
#'   people/community code (default: `NULL`).
#' @param codigo_escolaridade (optional) an integer number with the education
#'   code (default: `NULL`).
#' @param ano_mes_competencia (optional) a string with the year and month of
#'  the competition (e.g., "202301") (default: `NULL`).
#' @param gestante (optional) an integer number (0 or 1) representing the
#'  pregnancy status (`0` for `FALSE` and `1` for `TRUE`) (default: `NULL`).
#' @param limit (optional) an integer number with the maximum number of
#'  records to return (maximum value: 20) (default: `20`).
#' @param offset (optional) an integer number with the number of records to
#' skip (default: `NULL`).
#'
#' @return A [`tibble`][dplyr::tibble] object with the content of the API
#'   response.
#'
#' @family API functions
#' @export
#'
#' @examples
#' fetch_demas_sisvan(uf = "SP") |>
#'   dplyr::glimpse()
fetch_demas_sisvan <- function(
  codigo_municipio = NULL, uf = NULL, codigo_cnes = NULL, idade_minima = NULL,
  idade_maxima = NULL, codigo_fase_vida = NULL, codigo_povo_comunidade = NULL,
  codigo_escolaridade = NULL, ano_mes_competencia = NULL, gestante = NULL,
  limit = 20, offset = NULL
) {
  checkmate::assert_integerish(
    codigo_municipio, lower = 000001, upper = 999999, null.ok = TRUE
  )
  checkmate::assert_string(uf, n.chars = 2, null.ok = TRUE)
  checkmate::assert_string(codigo_cnes, n.chars = 7, null.ok = TRUE)
  checkmate::assert_integerish(idade_minima, len = 1, lower = 0, null.ok = TRUE)
  checkmate::assert_integerish(idade_maxima, len = 1, lower = 0, null.ok = TRUE)
  checkmate::assert_number(
    codigo_fase_vida, lower = 0, upper = 8, null.ok = TRUE
  )
  checkmate::assert_integer(
    codigo_povo_comunidade, len = 1, lower = 0, upper = 21, null.ok = TRUE
  )
  checkmate::assert_choice(
    codigo_escolaridade, choices = c(1:15, 99), null.ok = TRUE
  )
  checkmate::assert_string(
    ano_mes_competencia, pattern = "^\\d{6}$", null.ok = TRUE
  )
  checkmate::assert_integerish(
    gestante, len = 1, lower = 0, upper = 1, null.ok = TRUE
  )
  checkmate::assert_integerish(
    limit, len = 1, lower = 1, upper = 20, null.ok = TRUE
  )
  checkmate::assert_integerish(offset, len = 1, lower = 1, null.ok = TRUE)
  rutils:::assert_internet()

  rutils:::require_pkg("curl", "jsonlite")

  args <- as.list(environment())
  base_url <- "https://apidadosabertos.saude.gov.br/sisvan/estado-nutricional"
  api_call <- http_api_request(base_url, list = args)
  get_status <- httr::GET(api_call)

  if (get_status$status_code >= 400) {
    cli::cli_abort(paste0(
      "{.strong {cli::col_blue(api_call)}} ",
      "returned a {.strong {cli::col_red(get_status$status_code)}} status ",
      "code. This may be caused by wrong parameters or by API ",
      "shutdown."
    ))
  } else {
    api_call |>
      read_json() |>
      magrittr::extract2("estados_nutricionais") |>
      purrr::map_depth(2, ~ ifelse(is.null(.x), NA, .x)) |>
      purrr::map(dplyr::as_tibble) |>
      purrr::reduce(dplyr::add_row)
  }
}
