##### Choosing the top schools with best SAT and ACT scores

data12_13 <- read.csv('data/CSC12_13.csv')
data12_13$SATMT75 <- as.numeric(as.character(data12_13$SATMT75))
data12_13$ACTMT75 <- as.numeric(as.character(data12_13$ACTMT75))

topSAT1 <- data12_13[which(data12_13$SATMT75 > 660 & data12_13$SATMT75 <= 730),]
topSAT2 <- data12_13[which(data12_13$SATMT75 > 730 & data12_13$SATMT75 <= 800),]
topACT1 <- data12_13[which(data12_13$ACTMT75 > 28 & data12_13$ACTMT75 <= 31),]
topACT2 <- data12_13[which(data12_13$ACTMT75 > 31 & data12_13$ACTMT75 <= 34),]
topACT3 <- data12_13[which(data12_13$ACTMT75 > 34 & data12_13$ACTMT75 <= 36),]
topACT <- rbind(topACT1, topACT2, topACT3)
topSAT <- rbind(topSAT1, topSAT2)
topSAT$INSTNM <- as.character(topSAT$INSTNM)
topACT1$INSTNM <- as.character(topACT1$INSTNM)
combine <- rbind(topSAT,topACT)
clean <- unique(combine)
clean$MN_EARN_WNE_INC3_P10 <- as.numeric(as.character(clean$MN_EARN_WNE_INC3_P10))
clean$MN_EARN_WNE_INC2_P10 <- as.numeric(as.character(clean$MN_EARN_WNE_INC2_P10))
clean$MN_EARN_WNE_INC1_P10 <- as.numeric(as.character(clean$MN_EARN_WNE_INC1_P10))
clean <- clean[complete.cases(clean$MN_EARN_WNE_INC3_P10), ]
clean <- clean[complete.cases(clean$MN_EARN_WNE_INC2_P10), ]
clean <- clean[complete.cases(clean$ACTMT75), ]

#The top 146 colleges with top tier SAT and ACT scores. 
write.csv(clean, file = './data/top_schools.csv')
