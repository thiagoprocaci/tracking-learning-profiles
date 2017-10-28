data = read.csv(file = "biology.csv", sep = ";", dec = ",")
data [, "treatment"] = ifelse(data$score > 0, 1, 0)

ordinary1PositiveScore = subset(data, data$profile_1 == 1 & data$treatment == 1)
ordinary1NegativeScore = subset(data, data$profile_1 == 1 & data$treatment == 0)

ordinary2PositiveScore = subset(data, data$profile_2 == 1 & data$treatment == 1)
ordinary2NegativeScore = subset(data, data$profile_2 == 1 & data$treatment == 0)


total1 = nrow(ordinary1PositiveScore) + nrow(ordinary1NegativeScore)

print(nrow(ordinary1NegativeScore) * 100/total1)

total2 = nrow(ordinary2PositiveScore) + nrow(ordinary2NegativeScore)
print(nrow(ordinary2NegativeScore) * 100/total2)