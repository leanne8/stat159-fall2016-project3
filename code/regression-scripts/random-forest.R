#Prediction in earning
library(randomForest)

trainSet = read.csv("data/train-set.csv", header = TRUE)
trainSet = trainSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]
testSet = read.csv("data/test-set.csv", header = TRUE)
testSet = testSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]

rfModel = randomForest(MN_EARN_WNE_INC3_P10 ~ ., trainSet, ntree= 500)
rfModel
plot(rfModel)
#We plot the error rate across decision trees.
#The plot shows that the error become more stable after 200 decision trees.

imp <- importance(rfModel,type = 2) 
imp
#IncNodePurity is the average cumulative reduction in node impurity due
#to splits by a variable over the trees, which is also the mean decrease in MSE.

# Variable Importance Plot
varImpPlot(rfModel, sort = T, main = "Variance Importance", n.var = 4)

#Predict response variable value using random forest model
predModel = predict(rfModel, testSet)
predModel


res = table(predModel, testSet$MN_EARN_WNE_INC3_P10)