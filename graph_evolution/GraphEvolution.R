calc <- function(data) {
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    mysub = subset(data, data$period == (row$period - 1))
    if(nrow(mysub) == 1) {
      data[index, "nodesImprovement"] =  (row$nodes * 100 / mysub$nodes) - 100  
      data[index, "edgesImprovement"] =  (row$edges * 100 / mysub$edges) - 100  
      data[index, "densityImprovement"] =  (row$density * 100 / mysub$density) - 100  
      data[index, "avgDegreeImprovement"] =  (row$avg_degree * 100 / mysub$avg_degree) - 100 
      data[index, "avgDistImprovement"] =  (row$avg_degree * 100 / mysub$avg_dist) - 100 
    }
    
    data[, "nodesImprovement"] =  ifelse(is.finite(data$nodesImprovement), data$nodesImprovement,  0)
    data[, "edgesImprovement"] =  ifelse(is.finite(data$edgesImprovement), data$edgesImprovement,  0)
    data[, "densityImprovement"] =   ifelse(is.finite(data$densityImprovement), data$densityImprovement,  0)
    data[, "avgDegreeImprovement"] =   ifelse(is.finite(data$avgDegreeImprovement), data$avgDegreeImprovement,  0)
    data[, "avgDistImprovement"] =   ifelse(is.finite(data$avgDistImprovement), data$avgDistImprovement,  0)
    index = index + 1
  }
  return (data)
}


data = read.csv("graph_evolution.csv", header = TRUE, sep = ";", dec = ",")
biology = subset(data, data$communityName == "biology")
chemistry = subset(data, data$communityName == "chemistry")

data$avg_dist

biology = calc(biology)
chemistry = calc(chemistry)

library(ggplot2)

bioPlot = ggplot(biology, aes(period)) + 
  geom_line(aes(y = avg_degree, colour = "avg. degree")) + 
  geom_line(aes(y = avg_dist, colour = "avg. distance")) + 
  ylab("Graph Attribute")

print(bioPlot)

chemistryPlot = ggplot(chemistry, aes(period)) + 
  geom_line(aes(y = avg_degree, colour = "avg. degree")) + 
  geom_line(aes(y = avg_dist, colour = "avg. distance")) + 
  ylab("Graph Attribute")

print(chemistryPlot)

print("Biology % nodes growth")
print(summary(tail(biology$nodesImprovement, n = 10)))
print("Biology % edges growth")
print(summary(tail(biology$edgesImprovement, n = 10)))
print("----------------------------")
print("Chemistry % nodes growth")
print(summary(tail(chemistry$nodesImprovement, n = 10)))
print("Chemistry % edges growth")
print(summary(tail(chemistry$edgesImprovement, n = 10)))

#sparse graph, with low density
