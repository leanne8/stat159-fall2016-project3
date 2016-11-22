##### Choosing the top schools with best SAT and ACT scores

data13_14 <- read.csv('data/CSC13_14.csv')
data13_14$SATMT75 <- as.numeric(as.character(data13_14$SATMT75))
data13_14$ACTMT75 <- as.numeric(as.character(data13_14$ACTMT75))

topSAT <- data13_14[which(data13_14$SATMT75 > 730 & data13_14$SATMT75 <= 800),]
topACT1 <- data13_14[which(data13_14$ACTMT75 > 31 & data13_14$ACTMT75 <= 34),]
topACT2 <- data13_14[which(data13_14$ACTMT75 > 34 & data13_14$ACTMT75 <= 36),]
topACT <- rbind(topACT1, topACT2)

topSAT$INSTNM <- as.character(topSAT$INSTNM)
topACT1$INSTNM <- as.character(topACT1$INSTNM)
combine <- rbind(topSAT,topACT)
#The top 85 colleges with top tier SAT and ACT scores. 
write.csv(combine, file = './data/top_schools.csv')
