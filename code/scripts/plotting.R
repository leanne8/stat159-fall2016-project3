data13_14 <- read.csv('data/CSC13_14.csv')

#Based on the latest data set, from 2013-2014:
#The number of colleges does not change year to year.  This is a plot of how many colleges are in each state.

###### 2013-2014
ggplot(data13_14, aes(x=STABBR)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=.25)) + ggtitle('Number of Colleges in Each State') + xlab('State') + ylab('Number of Colleges')
#The state with the most colleges is California. 
#Top 10 states with the most amount of colleges is:
x <- order(summary(data13_14$STABBR), decreasing=T)
summary(data13_14$STABBR)[x][1:10]


png('images/college-frequency.png')
ggplot(data13_14, aes(x=STABBR)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=.25)) + ggtitle('Number of Colleges in Each State') + xlab('State') + ylab('Number of Colleges')
dev.off()
