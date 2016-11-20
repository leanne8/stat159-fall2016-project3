getwd()
data10_11 <- read.csv('data/CSC10_11.csv')

data10_11[,10:17][data10_11[,10:17] == 0] <- NA