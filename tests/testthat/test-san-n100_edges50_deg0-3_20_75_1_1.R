context("test-san-n100_edges50_deg0-3_20_75_1_1")

nw <- network.initialize(100, directed = FALSE)
test_that("SAN is able to find a difficult configuration", {
  formula <- nw ~ edges + degree(0:3) 
  target.stats <- c(50,20,75,1,1)
  nw <- san(formula, target.stats = target.stats, verbose=TRUE)
  expect_equivalent(summary(formula, basis=nw), target.stats)
})
