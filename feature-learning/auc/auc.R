data = read.csv(file = "data.csv", sep = ";", dec = ",")
data$scenario = as.factor(data$scenario)

library(ggplot2)

p <-ggplot(data, aes(scenario, AUC))
p +geom_bar(stat = "identity", aes(fill = community))

print(p)