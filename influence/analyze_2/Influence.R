library(ggplot2) 
require(gridExtra)

biologyData = read.csv("biology.csv", header = TRUE, dec = ",", sep = ";")
biologyData[, "contains_outstanding"] = ifelse(biologyData$containsOutstanding == 1, 'yes', 'no')

chemistryData = read.csv("chemistry.csv", header = TRUE, dec = ",", sep = ";")
chemistryData[, "contains_outstanding"] = ifelse(chemistryData$containsOutstanding == 1, 'yes', 'no')


biologyPlot= ggplot(data=biologyData,
                           aes(x = period, y = avgSize, colour = contains_outstanding)) +
  xlab("Time Slice") + ylab("Avg. Discussion Size") +
  geom_line()

print(biologyPlot)

chemistryPlot= ggplot(data=chemistryData,
                    aes(x = period, y = avgSize, colour = contains_outstanding)) +
  xlab("Time Slice") + ylab("Avg. Discussion Size") +
  geom_line()


print(chemistryPlot)

#grid.arrange( biologyPlot,chemistryPlot )



source("../../functions/Functions.R")

biologyDataOutstanding = subset(biologyData, biologyData$containsOutstanding == 1)
biologyDataOrdinary = subset(biologyData, biologyData$containsOutstanding == 0)

existsDiff(biologyDataOutstanding$avgSize, biologyDataOrdinary$avgSize, "Biology Avg discussion size outstanding x ordinary")

print("Bio outstd. avg. size")
print(summary(biologyDataOutstanding$avgSize))

print("Bio ord. avg. size")
print(summary(biologyDataOrdinary$avgSize))

chemistryDataOutstanding = subset(chemistryData, chemistryData$containsOutstanding == 1)
chemistryDataOrdinary = subset(chemistryData, chemistryData$containsOutstanding == 0)

existsDiff(chemistryDataOutstanding$avgSize, chemistryDataOrdinary$avgSize, "Chemistry Avg discussion size outstanding x ordinary")

print("Chemistry outstd. avg. size")
print(summary(chemistryDataOutstanding$avgSize))

print("Chemistry ord. avg. size")
print(summary(chemistryDataOrdinary$avgSize))