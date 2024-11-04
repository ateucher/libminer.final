test_that("lib_summary returns expected results with defaults", {
  res <- lib_summary()
  expect_s3_class(res, "data.frame")
  expect_equal(ncol(res), 1)
  expect_equal(names(res), "n")
  expect_type(res$n, "integer")
})

test_that("lib_summary returns expected results with defaults", {
  res <- lib_summary(LibPath, License, sizes = TRUE)
  expect_s3_class(res, "data.frame")
  expect_equal(ncol(res), 4)
  expect_equal(names(res), c("LibPath", "License", "n", "size"))
  expect_type(res$n, "integer")
  expect_type(res$size, "double")
})

test_that("lib_summary fails appropriately", {
  expect_snapshot(lib_summary(sizes = "foo"), error = TRUE)
  expect_snapshot(lib_summary(sizes = 12), error = TRUE)
})
