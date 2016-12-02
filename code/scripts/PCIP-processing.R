topschools <- read.csv('data/top_schools.csv')

#PCIP = percentage of degrees awarded in
#PCIP11 = computer and information sciences and support services
#PCIP14 = engineering
#PCIP15 = engineering technologies and engineering related fields
#PCIP26 = biological and biomedical sciences
#PCIP27 = mathematics and statistics
#PCIP29 = military technologies and applied sciences
#PCIP40 = physical sciences
#PCIP41 = science technologies/technicians

#for topschools there is NO DATA for any of the 126 schools for PCIP29

#From looking at the ORIGINAL data set, MERGED2014_15_PP.csv we are able to sum up the values of all PCIP columns for each school to see if they add up to 1, and they did!
#This means that the PCIP (percentage of degrees awarded) will give us a feeling for how big a program is at a certain school. 
#However this does not tell us the quailty of each program, but we have already narrowed our data set to the top schools in the US. 


#biggest = highest graduation rate = this school has a big program (has nothing to do about the quality of the program)

#look at the 10 schools with the biggest 'biology and biomedical sciences' program
order(topschools$PCIP26, decreasing=T)[1:5]
bio <- topschools[order(topschools$PCIP26, decreasing=T)[1:10],c('INSTNM','PCIP26')]
rownames(bio) = NULL
xtable(bio)

bioplot <- ggplot(bio, aes(x=INSTNM, y=PCIP26)) + geom_bar(stat='identity', fill='lightblue') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Top 10 Biggset Bio/Biomedical Programs') + 
  xlab('College') + ylab('Frequency')

png('images/biggestBio.png')
bioplot
dev.off()

#look at the 10 schools with the biggest 'mathematics and statistics' programs
order(topschools$PCIP27, decreasing=T)[1:5]
mathstats <- topschools[order(topschools$PCIP27, decreasing=T)[1:10],c('INSTNM','PCIP27')]
rownames(mathstats) = NULL
xtable(mathstats)

mathstatsplot <- ggplot(mathstats, aes(x=INSTNM, y=PCIP27)) + geom_bar(stat='identity', fill='#CC0066') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Top 10 Biggset Math/Stat Programs') + 
  xlab('College') + ylab('Frequency')


png('images/biggestMathStat.png')
mathstatsplot
dev.off()


#look at the 10 schools with the biggest 'computer science and support service' program
order(topschools$PCIP11, decreasing=T)[1:5]
CS <- topschools[order(topschools$PCIP11, decreasing=T)[1:10],c('INSTNM','PCIP11')]
rownames(CS) = NULL
xtable(CS)

CSplot <- ggplot(CS, aes(x=INSTNM, y=PCIP11)) + geom_bar(stat='identity', fill='#33CC99') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Top 10 Biggset Computer Science and Support Service Programs') + 
  xlab('College') + ylab('Frequency')

png('images/biggestCS.png')
CSplot
dev.off()

#look at the 10 schools with the biggest 'physical sciences' program
order(topschools$PCIP40, decreasing=T)[1:5]
physical <- topschools[order(topschools$PCIP40, decreasing=T)[1:10],c('INSTNM','PCIP40')]
rownames(physical) = NULL
xtable(physical)
physicalplot <- ggplot(physical, aes(x=INSTNM, y=PCIP40)) + geom_bar(stat='identity', fill='#330066') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Top 10 Biggset Physical Science Programs') + 
  xlab('College') + ylab('Frequency')

png('images/biggestPhysical.png')
physicalplot
dev.off()


#there are only 2 schools with a 'science technologies/technicians' program/category
order(topschools$PCIP41, decreasing=T)[1:5]
technicians <- topschools[order(topschools$PCIP41, decreasing=T)[1:2],c('INSTNM','PCIP41')]
rownames(technicians) = NULL
xtable(technicians)
techniciansplot <- ggplot(technicians, aes(x=INSTNM, y=PCIP41)) + geom_bar(stat='identity', fill='#993300') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Science Technologies/Technicians Programs') + 
  xlab('College') + ylab('Frequency')

png('images/biggestTechnicians.png')
techniciansplot
dev.off()

#the engineering category was split into 2: 'engineering' and 'engineering technologies and engineering related fields'
#some schools have put all of their engineering degrees into one category or the other, or put it into both.
#since they are basically the same category, we will combine the data

topschools$PCIP14 <- topschools$PCIP14 + topschools$PCIP15
topschools <- topschools[,-13]
order(topschools$PCIP14, decreasing=T)[1:5]
engineering <- topschools[order(topschools$PCIP14, decreasing=T)[1:10],c('INSTNM','PCIP14')]
rownames(engineering) = NULL
xtable(engineering)

engineeringplot <- ggplot(engineering, aes(x=INSTNM, y=PCIP14)) + geom_bar(stat='identity', fill='#FFFF00') +
  theme(axis.text.x = element_text(angle = 40, hjust = 1)) + 
  ggtitle('Top 10 Biggset Engineering Programs') + 
  xlab('College') + ylab('Frequency')

png('images/biggestEngineering.png')
engineeringplot
dev.off()

save(bio, mathstats, CS, physical, technicians, engineering, file='data/PCIP.RData')
