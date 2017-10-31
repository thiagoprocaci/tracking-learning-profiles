source("../../functions/Functions.R")

data = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")

outstanding1 = subset(data, data$profile_1 == 4)
ordinary1 = subset(data, data$profile_1 == 1)

existsDiff(outstanding1$reciprocityCount, ordinary1$reciprocityCount, "Diff reciprocity outstd. x ord. 1")

outstanding2 = subset(data, data$profile_2 == 4)
ordinary2 = subset(data, data$profile_2 == 1)

existsDiff(outstanding2$reciprocityCount, ordinary2$reciprocityCount, "Diff reciprocity outstd. x ord. 2")