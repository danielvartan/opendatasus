# These functions were created to be used with the 'mockr' package.
# Sort by type or alphabetical order.

read_json <- function(path, simplifyVector = FALSE, ...) { # nolint
  rutils:::require_pkg("jsonlite")

  jsonlite::read_json(path, simplifyVector = FALSE, ...)
}
