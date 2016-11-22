#The following functions are referred from An Introduction to Statistical Learning by James et al

#Expect input is lm object, return output is RSS 
#Compute Residual sum of squares (p.69)
ResSumSq <- function(lm) {
  RSS = sum(lm$residuals^2)
  return(RSS)
}

#Expect input is lm object, return output is TSS
#Compute total sum of squares (p.70)
TotSumSq <- function(lm) {
  TSS = sum(sum((unlist(lm$model[1]) - mean(unlist(lm$model[1])))^2))  
  return(TSS)
}

#Expect input is lm object, return output is rsq
#Compute R-squared (p.70)
Rsquare <- function(lm) {
  rss = ResSumSq(lm)
  tss = TotSumSq(lm)
  rsq = 1- (rss/tss)
  return(rsq)
}

#Expect input is lm object, return output is f 
#Compute f-statistics (p.75)
f_stat <- function(lm) {
  tss = TotSumSq(lm)
  rss = ResSumSq(lm)
  p = length(coefficients(lm)) - 1
  n = length(summary(lm)$residuals)
  top = (tss -rss)/p
  bottom = rss / (n-p-1)
  f = top/bottom
  return(f)
}

#Expect input is lm object, return output is RSE
#Compute residual standard error (p.80)
ResStdErr <- function(lm) {
  rss = ResSumSq(lm)
  p = length(coefficients(lm)) - 1
  n = length(summary(lm)$residuals)
  RSE = sqrt(rss / (n-p-1))
  return(RSE)
}