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

#look at the 10 schools with the biggest 'biology and biomedical sciences' program
#biggest = highest graduation rate
order(topschools$PCIP26, decreasing=T)[1:5]
topschools[order(topschools$PCIP26, decreasing=T)[1:10],c('INSTNM','PCIP26')]

#look at the 10 schools with the biggest 'mathematics and statistics' programs
order(topschools$PCIP27, decreasing=T)[1:5]
topschools[order(topschools$PCIP27, decreasing=T)[1:10],c('INSTNM','PCIP27')]

#look at the 10 schools with the biggest 'computer science and support service' program
#biggest = highest graduation rate
order(topschools$PCIP11, decreasing=T)[1:5]
topschools[order(topschools$PCIP11, decreasing=T)[1:10],c('INSTNM','PCIP11')]
