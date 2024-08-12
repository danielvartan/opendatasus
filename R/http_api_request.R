#' Create an HTTP API request
#'
#' @description
#'
#' `http_api_request` create an HTTP API request from a base URL and a list of
#' parameters.
#'
#' @param url A string representing the base URL of the API.
#' @param ... Named parameters to be included in the API request.
#' @param list (optional) A [list][base::list()] object of named parameters to be
#'   included in the API request. This parameter should be used instead of
#'   `...` if the named parameters are already stored in a list.
#' @param initial_sep A string representing the separator to be used before the
#'  first parameter.
#' @param A string representing the separator to be used between the parameters.
#'
#' @return A string representing the API request.
#' @export
#'
#' @examples
#'http_api_request(
#'  url = "https://apidadosabertos.saude.gov.br/sisvan/estado-nutricional",
#'  uf = "SP"
#')
http_api_request <- function(
    url,
    ...,
    list = NULL,
    initial_sep = "?",
    sep = "&"
  ) {
  checkmate::assert_string(url, pattern = "^http+[s]?:/")
  checkmate::assert_list(list(...), names = "named")
  checkmate::assert_list(list, min.len = 1, names = "named", null.ok = TRUE)
  checkmate::assert_string(initial_sep)
  checkmate::assert_string(sep)

  if (is.null(list)) {
    par <- Filter(Negate(is.null), list(...))
  } else {
    par <- Filter(Negate(is.null), list)
  }

  paste0(
    url, initial_sep,
    paste0(names(par), "=", par, collapse = sep)
  )
}
