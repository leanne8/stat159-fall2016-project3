topSchools <- read.csv('data/top_schools.csv')

cleanData <- topSchools[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]

mulLM <- lm(MN_EARN_WNE_INC3_P10 ~ ., data = cleanData)
mulLM

LMcorr <- cor(cleanData)
LMcorr
#Find the summary of multiple linear regression
mulLMSum <- summary(mulLM)
mulLMSum

#Coeffiecients 
mulLMCoef <- coef(mulLM)
mulLMCoef

#MSE for multiple linear regression 
mulLMMSE <- mean(mulLM$residuals^2)

#save into OLS binary file
save(mulLM, mulLMSum, mulLMCoef, mulLMMSE, LMcorr, file="./data/multiple-linear-reg.RData")

sink('./data/multiple-linear-reg-output.txt')
cat('Muliple Linear Regression summary statistics\n')
print(mulLMSum)
cat('Muliple Linear Regression coefficients\n')
print(mulLMCoef)
cat('Muliple Linear Regression MSE\n')
print(mulLMMSE)
cat("Multiple Linear Regression correlation \n")
print(LMcorr)
sink()
