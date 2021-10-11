test_that("is tibble", {
  data <- scrape_nars(survey = "NLA", year = 2007, parameter = "Profile", type = "data")
  expect_s3_class(data, "tbl_df")
})
