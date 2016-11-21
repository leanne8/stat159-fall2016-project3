data13_14 <- read.csv('data/CSC13_14.csv')
library(ggplot2)
#Based on the latest data set, from 2013-2014:
#The number of colleges does not change year to year.  This is a plot of how many colleges are in each state.

###### 2013-2014
collegeFreq <- ggplot(data13_14, aes(x=STABBR)) + geom_bar(fill="dark green") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=.25)) + 
  ggtitle('Number of Colleges in Each State') + 
  xlab('State') + ylab('Number of Colleges')
#The state with the most 4 year colleges is California. 
#Top 10 states with the most amount of colleges is:
x <- order(summary(data13_14$STABBR), decreasing=T)
summary(data13_14$STABBR)[x][1:10]


png('images/college-frequency.png')
collegeFreq
dev.off()

#Above average SAT score vs count
data13_14$SATMT75 <- as.numeric(as.character(data13_14$SATMT75))

Gp1 = data13_14[which(data13_14$SATMT75 >= 590 & data13_14$SATMT75 <= 660),]
Gp2 = data13_14[which(data13_14$SATMT75 > 660 & data13_14$SATMT75 <= 730),]
Gp3 = data13_14[which(data13_14$SATMT75 > 730 & data13_14$SATMT75 <= 800),]

SATdf <- data.frame(SATscore = c("590-660", "661-730", "730-800"),
                    counts = c(NROW(Gp1), NROW(Gp2), NROW(Gp3)))
SATplot <- ggplot(data = SATdf, aes(x = SATscore, y = counts)) + 
  geom_bar(stat = "identity",  fill="steelblue", width=0.5) + 
  ggtitle("Above average SAT score vs count 2013-2014")

png('images/above-average-SAT-13-14.png')
SATplot
dev.off()


#Above average ACT score vs count
data13_14$ACTMT75 <- as.numeric(as.character(data13_14$ACTMT75))

Grp1 = data13_14[which(data13_14$ACTMT75 >= 25 & data13_14$ACTMT75 <= 28),]
Grp2 = data13_14[which(data13_14$ACTMT75 > 28 & data13_14$ACTMT75 <= 31),]
Grp3 = data13_14[which(data13_14$ACTMT75 > 31 & data13_14$ACTMT75 <= 34),]
Grp4 = data13_14[which(data13_14$ACTMT75 > 34 & data13_14$ACTMT75 <= 36),]

ACTdf <- data.frame(ACTscore = c("25-28", "28-31", "31-34", "34-36"),
                    count = c(NROW(Grp1), NROW(Grp2), NROW(Grp3), NROW(Grp4)))
ACTplot <- ggplot(data = ACTdf, aes(x = ACTscore, y = count)) + 
  geom_bar(stat = "identity",  fill="pink", width=0.5) +
  ggtitle("Above average ACT score vs count 2013-2014")
  
png('images/above-average-ACT-13-14.png')
ACTplot
dev.off()
