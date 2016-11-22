library(glmnet)

topSchools <- read.csv('data/top_schools.csv')
#View(topSchools)

#Subset the only columns I need to use for ridge regression
topSchools_subset <- topSchools[c('SATMT75', 'ACTMT75', 'ADM_RATE', 'COMP_ORIG_YR4_RT', 'MN_EARN_WNE_INC3_P10')]

topSchools_subset1 <- topSchools_subset
#transforming each column type so it will be numeric and will work when I try to scale the data set.
topSchools_subset1$SATMT75 <- as.numeric(as.character(topSchools_subset$SATMT75))
topSchools_subset1$ACTMT75 <- as.numeric(as.character(topSchools_subset$ACTMT75))
topSchools_subset1$ADM_RATE <- as.numeric(as.character(topSchools_subset$ADM_RATE))
topSchools_subset1$COMP_ORIG_YR4_RT <- as.numeric(as.character(topSchools_subset$COMP_ORIG_YR4_RT))
topSchools_subset1$MN_EARN_WNE_IC3_P10 <- as.numeric(as.character(topSchools_subset$MN_EARN_WNE_INC3_P10))

#Mean Centering and Standardizing (scaling the data)
topSchools_scaled <- scale(topSchools_subset1, center=TRUE, scale=TRUE)
