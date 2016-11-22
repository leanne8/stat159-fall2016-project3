library(testthat)
source("../functions/rregression-script.R")

context("Test for regression functions")

test_that("RSS works as expected", {
  reg <- lm(mpg~disp+hp, data = mtcars)
  expect_type(ResSumSq(reg), 'double')
  expect_gte(ResSumSq(reg), 0)
  expect_length(ResSumSq(reg), 1)
  expect_equal(ResSumSq(reg), sum(reg$residuals^2))
})


test_that("TSS works as expected", {
  reg <- lm(mpg~disp+hp, data = mtcars)
  expect_type(TotSumSq(reg), 'double')
  expect_length(TotSumSq(reg), 1)
  expect_equal(TotSumSq(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
})

test_that("R squared works as expected", {
  reg <- lm(mpg~disp+hp, data = mtcars)
  regsum <- summary(reg)
  expect_gte(Rsquare(reg), 0)
  expect_length(Rsquare(reg), 1)
  expect_type(Rsquare(reg), 'double')
  expect_equal(Rsquare(reg), regsum$r.squared)
})

test_that("F statistics works as expected", {
  reg <- lm(mpg~disp+hp, data = mtcars)
  regsum <- summary(reg)
  expect_length(f_stat(reg),1)
  expect_type(f_stat(reg), 'double')
  expect_equal(f_stat(reg), as.numeric(regsum$fstatistic[1]))
})

test_that("RSE works as expected", {
  reg <- lm(mpg~disp+hp, data = mtcars)
  regsum <- summary(reg)
  expect_gte(ResStdErr(reg), 0)
  expect_length(ResStdErr(reg), 1)
  expect_type(ResStdErr(reg), 'double')
  expect_equal(ResStdErr(reg), regsum$sigma)
})