topSchools <- read.csv("data/top_schools.csv", header = TRUE)

#reproducible random numbers
set.seed(12345)

#generate random sample without replacement
train <- sample(1:146, 116, replace = FALSE)

#training set
trainSet <- topSchools[train, ]

#Set the other 1/5 of the data into test set
testSet <- topSchools[!(1:146 %in% train), ]

#save the training and testing sets into csv
write.csv(trainSet, file = "data/train-set.csv")
write.csv(testSet, file = "data/test-set.csv")
