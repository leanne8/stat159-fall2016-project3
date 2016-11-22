library(randomForest)

trainSet = read.csv("data/train-set.csv", header = TRUE)
trainSet = trainSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]
testSet = read.csv("data/test-set.csv", header = TRUE)
testSet = testSet[c("SATMT75", "ACTMT75", "ADM_RATE", "COMP_ORIG_YR4_RT","MN_EARN_WNE_INC3_P10")]

rfModel = randomForest(MN_EARN_WNE_INC3_P10 ~ ., trainSet, ntree= 100)
rfModel
predModel = predict(rfModel, testSet)
predModel
