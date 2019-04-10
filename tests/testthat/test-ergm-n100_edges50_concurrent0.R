context("test-ergm-n100_edges50_concurrent0")

nw <- network.initialize(100, directed = FALSE)
test_that("multiplication works", {
  fit <- ergm(nw ~ edges + concurrent, target.stats = c(50, 0))
  expect_true(coef(fit)[1]>10 && coef(fit)[2]<10)
})
