library(ggplot2) 


biologyData = read.csv("biology.csv", header = TRUE, dec = ",", sep = ";")
biologyData[, "contains_outstanding"] = ifelse(biologyData$containsOutstanding == 1, 'yes', 'no')


biologyPlot= ggplot(data=biologyData,
                           aes(x = period, y = avgSize, colour = contains_outstanding)) +
  xlab("Time Slice") + ylab("Avg. Discussion Size") +
  geom_point()

print(biologyPlot)

source("../../functions/Functions.R")

biologyDataOutstanding = subset(biologyData, biologyData$containsOutstanding == 1)
biologyDataOrdinary = subset(biologyData, biologyData$containsOutstanding == 0)

existsDiff(biologyDataOutstanding$avgSize, biologyDataOrdinary$avgSize, "Avg discussion size outstanding x ordinary")