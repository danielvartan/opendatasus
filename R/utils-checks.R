test_api_connection <- function(request_url) {
  checkmate::assert_string(request_url, pattern = "^http+[s]?:/")

  get_status <- httr::GET(request_url)

  if (get_status$status_code >= 400) {
    FALSE
  } else {
    TRUE
  }
}

assert_api_connection <- function(request_url) {
  checkmate::assert_string(request_url, pattern = "^http+[s]?:/")

  get_status <- httr::GET(request_url)

  if (!test_api_connection(request_url)) {
    cli::cli_abort(paste0(
      "{.strong {cli::col_blue(request_url)}} ",
      "returned a {.strong {cli::col_red(get_status$status_code)}} status ",
      "code. This may be caused by wrong parameters or by API ",
      "shutdown."
    ))
  }

  invisible(NULL)
}
