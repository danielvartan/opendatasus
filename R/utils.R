# Move to `rutils`
tidy_names <- function(names, tag_duplicates = FALSE) {
  checkmate::assert_character(names, min.len = 1)

  out <-
    names |>
    tolower() |>
    stringr::str_replace_all("_", " ") |>
    stringr::str_replace_all("[[:punct:]]", "") |>
    iconv(from = 'UTF-8', to = 'ASCII//TRANSLIT') |>
    stringr::str_replace_all(" - |-| ",  "_")

  if (isTRUE(tag_duplicates) && any(duplicated(out), na.rm = TRUE)) {
    n_dup <- length(out[duplicated(out)])
    out[duplicated(out)] <- paste0(
      out[duplicated(names)], "_dup_", seq(from = 1, to = n_dup)
    )
  }

  out
}
