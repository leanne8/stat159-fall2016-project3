data10_11 <- read.csv('data/CSC10_11.csv')
data11_12 <- read.csv('data/CSC11_12.csv')
data12_13 <- read.csv('data/CSC12_13.csv')
data13_14 <- read.csv('data/CSC13_14.csv')

###### 2010-2011

data10_11[,10:17][data10_11[,10:17] == 0] <- NA

which(data10_11[,23]!=1)
data10_11 <- data10_11[-which(data10_11[,23]!=1),]
View(data10_11)

write.csv(data10_11, file = 'data/CSC10_11_4yr.csv')

###### 2011-2012
data11_12[,10:17][data11_12[,10:17] == 0] <- NA

which(data11_12[,23]!=1)
data11_12 <- data11_12[-which(data11_12[,23]!=1),]
View(data11_12)

write.csv(data11_12, file= 'data/CSC11_12_4yr.csv')

###### 2012-2013
data12_13[,10:17][data12_13[,10:17] == 0] <- NA

which(data12_13[,23]!=1)
data12_13 <- data12_13[-which(data12_13[,23]!=1),]
View(data12_13)

write.csv(data12_13, file= 'data/CSC12_13_4yr.csv')

###### 2013-2014
data13_14[,10:17][data13_14[,10:17] == 0] <- NA

which(data13_14[,23]!=1)
data13_14 <- data13_14[-which(data13_14[,23]!=1),]
View(data13_14)

write.csv(data13_14, file= 'data/CSC13_14_4yr.csv')
