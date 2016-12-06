#Prediction in earning
library(randomForest)
set.seed(123)
trainSet = read.csv("data/train-set.csv", header = TRUE)
trainSet = trainSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","PELL_COMP_ORIG_YR6_RT","MN_EARN_WNE_INC2_P10")]
trainSet <- trainSet[complete.cases(trainSet$MN_EARN_WNE_INC2_P10),]
trainSet = data.frame(scale(trainSet, center=TRUE, scale=TRUE))

testSet = read.csv("data/test-set.csv", header = TRUE)
testSet = testSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","PELL_COMP_ORIG_YR6_RT","MN_EARN_WNE_INC2_P10")]
testSet <- testSet[complete.cases(testSet$MN_EARN_WNE_INC2_P10),]
testSet =  data.frame(scale(testSet, center=TRUE, scale=TRUE))

rfModelMid = randomForest(MN_EARN_WNE_INC2_P10 ~ ., trainSet, ntree= 500, importance=TRUE)
png("images/rf_mid.png")
plot(rfModelMid)
dev.off()
#We plot the error rate across decision trees.
#The plot shows that the error become more stable after 50 decision trees.

impMid <- importance(rfModelMid,type = 2)

#IncNodePurity is the average cumulative reduction in node impurity due
#to splits by a variable over the trees, which is also the mean decrease in MSE.

# Variable Importance Plot
varplotMid  <- varImpPlot(rfModelMid)

#Predict response variable value using random forest model
predModelMid  = predict(rfModelMid , testSet)

resMid  = table(predModelMid , testSet$MN_EARN_WNE_INC2_P10)

#save into random forest binary file
save(rfModelMid, impMid, predModelMid,varplotMid, resMid,file="./data/random-forest-mid.RData")
