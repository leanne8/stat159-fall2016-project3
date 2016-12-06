#Prediction in earning
library(randomForest)
set.seed(123)
trainSet = read.csv("data/train-set.csv", header = TRUE)
trainSet = trainSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","PELL_COMP_ORIG_YR6_RT", "MN_EARN_WNE_INC3_P10")]
trainSet = data.frame(scale(trainSet, center=TRUE, scale=TRUE))
trainSet <- trainSet[complete.cases(trainSet$MN_EARN_WNE_INC3_P10), ]
testSet = read.csv("data/test-set.csv", header = TRUE)
testSet = testSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","PELL_COMP_ORIG_YR6_RT","MN_EARN_WNE_INC3_P10")]
testSet =  data.frame(scale(testSet, center=TRUE, scale=TRUE))
testSet <- testSet[complete.cases(testSet$MN_EARN_WNE_INC3_P10),]

rfModel = randomForest(MN_EARN_WNE_INC3_P10 ~ ., trainSet, ntree= 500, importance=TRUE)
png("images/rf_top.png")
plot(rfModel)
dev.off()
#We plot the error rate across decision trees.
#The plot shows that the error become more stable after 80 decision trees.

imp <- importance(rfModel,type = 2)
#IncMSE is mean decrease in accuracy
#IncNodePurity is the average cumulative reduction in node impurity due
#to splits by a variable over the trees, which is also the mean decrease in MSE.

# Variable Importance Plot
varplot <- varImpPlot(rfModel)

#Predict response variable value using random forest model
predModel = predict(rfModel, testSet)

res = table(predModel, testSet$MN_EARN_WNE_INC3_P10)
#in scaled format 

#save into random forest binary file
save(rfModel, imp, predModel,varplot, res,file="./data/random-forest-top.RData")
