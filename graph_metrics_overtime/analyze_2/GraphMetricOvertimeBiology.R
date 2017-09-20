
read <- function(path) {
  data = read.csv(path, header = TRUE, sep = ";", dec = ",")
  data[, "class"] =  ""
  data[, "avgDegreeImprovement"] =  0
  data[, "avgIndegreeImprovement"] =  0
  data[, "avgOutdegreeImprovement"] =  0
  data[, "avgBetweennessImprovement"] =  0
  data[, "avgPagerankImprovement"] =  0
  data[, "avgEigenvectorImprovement"] =  0
  data[, "avgIntegractionsImprovement"] =  0
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    if(1 == row$profile_2) {
      data[index, "class"] = "Ordinary"
    }
    if(4 == row$profile_2) {
      data[index, "class"] = "Outstanding"
    }
    
    mysub = subset(data, data$profile_2 == row$profile_2 & data$period == (row$period - 1))
    if(nrow(mysub) == 1) {
      data[index, "avgDegreeImprovement"] =  (row$avgDegree * 100 / mysub$avgDegree) - 100  
      data[index, "avgIndegreeImprovement"] =  (row$avgIndegree * 100 / mysub$avgIndegree) - 100  
      data[index, "avgOutdegreeImprovement"] =  (row$avgOutdegree * 100 / mysub$avgOutdegree) - 100  
      data[index, "avgBetweennessImprovement"] =  (row$avgBetweenness * 100 / mysub$avgBetweenness) - 100  
      data[index, "avgPagerankImprovement"] =  (row$avgPagerank * 100 / mysub$avgPagerank) - 100  
      data[index, "avgEigenvectorImprovement"] =  (row$avgEigenvector * 100 / mysub$avgEigenvector) - 100  
      data[index, "avgIntegractionsImprovement"] =  (row$avgInteractions * 100 / mysub$avgInteractions) - 100  
    }
    
    data[, "avgDegreeImprovement"] =  ifelse(is.finite(data$avgDegreeImprovement), data$avgDegreeImprovement,  0)
    data[, "avgIndegreeImprovement"] =  ifelse(is.finite(data$avgIndegreeImprovement),  data$avgIndegreeImprovement, 0)
    data[, "avgOutdegreeImprovement"] =  ifelse(is.finite(data$avgOutdegreeImprovement),  data$avgOutdegreeImprovement, 0)
    data[, "avgBetweennessImprovement"] =  ifelse(is.finite(data$avgBetweennessImprovement),  data$avgBetweennessImprovement, 0)
    data[, "avgPagerankImprovement"] =  ifelse(is.finite(data$avgPagerankImprovement),  data$avgPagerankImprovement, 0)
    data[, "avgEigenvectorImprovement"] =  ifelse(is.finite(data$avgEigenvectorImprovement),  data$avgEigenvectorImprovement, 0)
    data[, "avgIntegractionsImprovement"] =  ifelse(is.finite(data$avgIntegractionsImprovement),  data$avgIntegractionsImprovement, 0)
    
    index = index + 1
  }
  return (data)
}


biologyData = read("biology.csv")

library("ggplot2")
require(gridExtra)

biologyPlotDegree = ggplot(data=biologyData,
                             aes(x = period, y = avgDegree, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Degree") +
  geom_line()

biologyPlotIndegree = ggplot(data=biologyData,
                               aes(x = period, y = avgIndegree, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Indegree") +
  geom_line()

biologyPlotOutdegree = ggplot(data=biologyData,
                                aes(x = period, y = avgOutdegree, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Outdegree") +
  geom_line()

biologyPlotBetweenness = ggplot(data=biologyData,
                                  aes(x = period, y = avgBetweenness, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Betweenness") +
  geom_line()

biologyPlotPagerank = ggplot(data=biologyData, 
                               aes(x = period, y = avgPagerank, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Page Rank") +  scale_y_continuous(trans='log10')  +
  geom_line() 

biologyPlotEigenvector = ggplot(data=biologyData,
                                  aes(x = period, y = avgEigenvector, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Eigenvector") +  scale_y_continuous(trans='log10') +
  geom_line()

biologyPlotInteractions = ggplot(data=biologyData,
                                   aes(x = period, y = avgInteractions, colour = class)) +
  xlab("Time Slice") + ylab("Avg. Interactions")  +
  geom_line()




grid.arrange( biologyPlotDegree, biologyPlotIndegree, biologyPlotOutdegree, biologyPlotBetweenness, 
              biologyPlotPagerank,  biologyPlotEigenvector, biologyPlotInteractions,   ncol=4, top = "Biology")

index = 1
while(index <= 4) {
  mysub = subset(biologyData, biologyData$profile_2 == index)
  print(paste("% degree improvement profile ", index))
  print(summary(mysub$avgDegreeImprovement))
  
  print(paste("% indegree improvement profile ", index))
  print(summary(mysub$avgIndegreeImprovement))
  
  print(paste("% outdegree improvement profile ", index))
  print(summary(mysub$avgOutdegreeImprovement))
  
  print(paste("% betweenness improvement profile ", index))
  print(summary(mysub$avgBetweennessImprovement))
  
  print(paste("% page rank improvement profile ", index))
  print(summary(mysub$avgPagerankImprovement))
  
  print(paste("% eigenvector improvement profile ", index))
  print(summary(mysub$avgEigenvectorImprovement))
  
  print(paste("% interactions improvement profile ", index))
  print(summary(mysub$avgInteractions))
  
  index = index + 3
}


