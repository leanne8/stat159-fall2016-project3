library(glmnet)

topSchools <- read.csv('data/top_schools.csv')
#View(topSchools)

#Subset the only columns I need to use for ridge regression
topSchools_subset <- topSchools[c('SATMT75', 'ACTMT75', 'ADM_RATE', 'COMP_ORIG_YR4_RT', 'MN_EARN_WNE_INC3_P10')]

topSchools_subset1 <- topSchools_subset
#transforming each column type so it will be numeric and will work when I try to scale the data set.
topSchools_subset1$SATMT75 <- as.numeric(as.character(topSchools_subset$SATMT75))
topSchools_subset1$ACTMT75 <- as.numeric(as.character(topSchools_subset$ACTMT75))
topSchools_subset1$ADM_RATE <- as.numeric(as.character(topSchools_subset$ADM_RATE))
topSchools_subset1$COMP_ORIG_YR4_RT <- as.numeric(as.character(topSchools_subset$COMP_ORIG_YR4_RT))
topSchools_subset1$MN_EARN_WNE_IC3_P10 <- as.numeric(as.character(topSchools_subset$MN_EARN_WNE_INC3_P10))

#Mean Centering and Standardizing (scaling the data)
topSchools_scaled <- scale(topSchools_subset1, center=TRUE, scale=TRUE)

#Partitioning the data
set.seed(1)
#nrow(topSchools_scaled)

trainset <- read.csv('data/train-set.csv')
trainset_subset <- trainset[c('SATMT75', 'ACTMT75', 'ADM_RATE', 'COMP_ORIG_YR4_RT', 'MN_EARN_WNE_INC3_P10')]
trainset_scaled <- scale(trainset_subset, center=T, scale=T)

testset <- read.csv('data/test-set.csv')
testset_subset <- trainset[c('SATMT75', 'ACTMT75', 'ADM_RATE', 'COMP_ORIG_YR4_RT', 'MN_EARN_WNE_INC3_P10')]
testset_scaled <- scale(testset_subset, center=T, scale=T)

x_train_scaled <- as.matrix(trainset_scaled[,1:4])
y_train_scaled <- as.matrix(trainset_scaled[,5])

x_test_scaled <- as.matrix(testset_scaled[,1:4])
y_test_scaled <- as.matrix(testset_scaled[,5])

x_full <- as.matrix(topSchools_scaled[,1:4])
y_full <- as.matrix(topSchools_scaled[,5])


#1 Run the corresponding fitting function on the train set using ten-fold cross-validation.
grid <- 10^seq(10, -2, length = 100)
set.seed(12345)
cv.out <- cv.glmnet(x_train_scaled, y_train_scaled, alpha=0, lambda=grid, intercept=FALSE, standardize=FALSE)

#2. Saving list of models(saved in Rdata file at the end)
#listModels <- cv.out

#3. To select the best model:
bestlambda <- cv.out$lambda.min

#4. Plot the cross-validation errors in terms of the tunning 
##  parameter to visualize which parameter gives the "best" model:
#png(filename = "../../images/ridge-cross-validation-errors.png", width=800, height=600)
#plot(cv.out)
#dev.off()

#5. Once you identify the "best" model, use the test set to compute the test Mean Square Error(test MSE)
ridge_pred <- predict(cv.out, s=bestlambda, newx=x_test_scaled)
test_mse_ridge <- mean((ridge_pred-y_test_scaled)^2)

#6. Last but not least, refit the model on the full data set using the parameter chosen by cross-validation.
##  This fit will give you the "official" coefficient estimates.
ridge_full <- glmnet(x_full, y_full, alpha = 0, lambda = bestlambda, intercept = FALSE, standardize = FALSE)
#coeff_ridge <- predict(ridge_full, type = "coefficients", s = bestlambda)[1:length(topSchools_scaled),]
coeff_ridge <- coef(ridge_full, s=bestlambda)

#full prediction
ridge_pred_full <- predict(cv.out, s=bestlambda, newx = x_full)
full_mse_ridge <- mean((ridge_pred_full-y_full)^2)

ridgecor <- cor(topSchools_subset)

save(cv.out, coeff_ridge, bestlambda, full_mse_ridge, ridgecor, file='data/rigde-reg.RData')

#Plot the cross-validation errors
png("images/ridgeCV_top.png")
plot(cv.out)
dev.off()
