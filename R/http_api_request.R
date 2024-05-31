#' Create an HTTP API request
#'
#' @description
#'
#' `http_api_request` create an HTTP API request from a base URL and a list of
#' parameters.
#'
#' @param path A string representing the base URL of the API.
#' @param ... Named parameters to be included in the API call.
#' @param list (optional) A [list][base::list] object of named parameters to be
#'   included in the API call. This parameter should be used instead of `...` if
#'   the named parameters are already stored in a list.
#'
#' @return A string representing the API request.
#' @export
#'
#' @examples
#'http_api_request(
#'  path = "https://apidadosabertos.saude.gov.br/sisvan/estado-nutricional",
#'  uf = "SP"
#')
http_api_request <- function(path, ..., list = NULL) {
  checkmate::assert_string(path, pattern = "^http+[s]?:/")
  checkmate::assert_list(list, min.len = 1, null.ok = TRUE)

  if (is.null(list)) {
    par <- Filter(Negate(is.null), list(...))
  } else {
    par <- Filter(Negate(is.null), list)
  }

  paste0(
    path, "?",
    paste0(names(par), "=", par, collapse = "&")
  )
}
