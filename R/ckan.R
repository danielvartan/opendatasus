ckan <- function() {
  api_request <- "https://opendatasus.saude.gov.br/api/3/action/package_list"

  api_request |>
    read_json() |>
    magrittr::extract2("estados_nutricionais") |>
    purrr::map_depth(2, ~ ifelse(is.null(.x), NA, .x)) |>
    purrr::map(dplyr::as_tibble) |>
    purrr::reduce(dplyr::add_row)
}
