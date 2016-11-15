#Read the data into csv files 
CSC10_11 = read.csv('MERGED2010_11_PP.csv', header = TRUE)
CSC11_12 = read.csv('MERGED2011_12_PP.csv', header = TRUE)
CSC12_13 = read.csv('MERGED2012_13_PP.csv', header = TRUE)
CSC13_14 = read.csv('MERGED2013_14_PP.csv', header = TRUE)

#Subset the columns from the college score card csv
CSC10_11 = CSC10_11[c("INSTNM", "CITY", "STABBR", "ZIP", "ADM_RATE",
                      "SATMT75", "ACTMT75", "COMP_ORIG_YR4_RT", "PCIP11",
                      "PCIP14", "PCIP15", "PCIP26", "PCIP27", "PCIP29", 
                      "PCIP40", "PCIP41", "C150_4", "MN_EARN_WNE_INC1_P10",
                      "MN_EARN_WNE_INC2_P10", "MN_EARN_WNE_INC3_P10",
                      "PCT90_EARN_WNE_P6", "ICLEVEL")]

CSC11_12 = CSC11_12[c("INSTNM", "CITY", "STABBR", "ZIP", "ADM_RATE",
                      "SATMT75", "ACTMT75", "COMP_ORIG_YR4_RT", "PCIP11",
                      "PCIP14", "PCIP15", "PCIP26", "PCIP27", "PCIP29", 
                      "PCIP40", "PCIP41", "C150_4", "MN_EARN_WNE_INC1_P10",
                      "MN_EARN_WNE_INC2_P10", "MN_EARN_WNE_INC3_P10",
                      "PCT90_EARN_WNE_P6", "ICLEVEL")]

CSC12_13 = CSC12_13[c("INSTNM", "CITY", "STABBR", "ZIP", "ADM_RATE",
                      "SATMT75", "ACTMT75", "COMP_ORIG_YR4_RT", "PCIP11",
                      "PCIP14", "PCIP15", "PCIP26", "PCIP27", "PCIP29", 
                      "PCIP40", "PCIP41", "C150_4", "MN_EARN_WNE_INC1_P10",
                      "MN_EARN_WNE_INC2_P10", "MN_EARN_WNE_INC3_P10",
                      "PCT90_EARN_WNE_P6", "ICLEVEL")]

CSC13_14 = CSC13_14[c("INSTNM", "CITY", "STABBR", "ZIP", "ADM_RATE",
           "SATMT75", "ACTMT75", "COMP_ORIG_YR4_RT", "PCIP11",
           "PCIP14", "PCIP15", "PCIP26", "PCIP27", "PCIP29", 
           "PCIP40", "PCIP41", "C150_4", "MN_EARN_WNE_INC1_P10",
           "MN_EARN_WNE_INC2_P10", "MN_EARN_WNE_INC3_P10",
           "PCT90_EARN_WNE_P6", "ICLEVEL")]

write.csv(CSC10_11, file = './data/CSC10_11.csv')
write.csv(CSC11_12, file = './data/CSC11_12.csv')
write.csv(CSC12_13, file = './data/CSC12_13.csv')
write.csv(CSC13_14, file = './data/CSC13_14.csv')

