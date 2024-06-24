test_that("Download funciona corretamente", {
  skip_if_offline()
  
  tmp <- tempfile()
  path <- download_microdados(path = tmp, 2023)

  expect_true(file.exists(path))
})
