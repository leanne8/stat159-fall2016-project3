topSchools <- read.csv('data/top_schools.csv')

cleanData <- topSchools[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]
cleanData2 <- topSchools[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC2_P10")]
cleanData3 <- topSchools[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC1_P10")]

TopLM <- lm(MN_EARN_WNE_INC3_P10 ~ ., data = cleanData)
MidLM <- lm(MN_EARN_WNE_INC2_P10 ~ ., data = cleanData2)
LowLM <- lm(MN_EARN_WNE_INC1_P10 ~ ., data = cleanData3)

TopCorr <- cor(cleanData)
MidCorr <- cor(cleanData2)
LowCorr <- cor(cleanData3)

#Find the summary of multiple linear regression
TopLMsum <- summary(TopLM)
MidLMsum <- summary(MidLM)
LowLMsum <- summary(LowLM)

#Coeffiecients 
TopCoef <- coef(TopLM)
MidCoef <- coef(MidLM)
LowCoef <- coef(LowLM)

#MSE for multiple linear regression 
TopMSE <- mean(TopLM$residuals^2)
MidMSE <- mean(MidLM$residuals^2)
LowMSE <- mean(LowLM$residuals^2)

#save into OLS binary file
save(TopLM, MidLM, LowLM, TopCorr, MidCorr, LowCorr,
     TopLMsum, MidLMsum, LowLMsum, TopCoef, MidCoef,
     LowCoef, TopMSE, MidMSE, LowMSE,
     file="./data/multiple-linear-reg.RData")

sink('./data/multiple-linear-reg-output.txt')
cat('Multiple Linear Regression summary statistics for top tier of earning\n')
print(TopLM)
cat('Multiple Linear Regression coefficients\n')
print(TopCoef)
cat('Multiple Linear Regression MSE\n')
print(TopMSE)
cat("Multiple Linear Regression correlation \n")
print(TopCorr)
sink()
