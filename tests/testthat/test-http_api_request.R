test_that("http_api_request() | general test", {
  http_api_request("https://api.github.com", test = 1) |>
    expect_equal("https://api.github.com?test=1")

  http_api_request("https://api.github.com", list = list(test = 1)) |>
    expect_equal("https://api.github.com?test=1")
})
