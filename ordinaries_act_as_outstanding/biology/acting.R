data = read.csv(file = "biology.csv", sep = ";", dec = ",")

data [, "acting_as_out"] = ifelse(data$score > 2, 1, 0)

ordinary1PositiveScore = subset(data, data$profile_1 == 1 & data$acting_as_out == 1)
ordinary1NegativeScore = subset(data, data$profile_1 == 1 & data$acting_as_out == 0)

ordinary2PositiveScore = subset(data, data$profile_2 == 1 & data$acting_as_out == 1)
ordinary2NegativeScore = subset(data, data$profile_2 == 1 & data$acting_as_out == 0)

total1 = nrow(ordinary1PositiveScore) + nrow(ordinary1NegativeScore)

print(nrow(ordinary1PositiveScore) * 100/total1)

total2 = nrow(ordinary2PositiveScore) + nrow(ordinary2NegativeScore)
print(nrow(ordinary2PositiveScore) * 100/total2)