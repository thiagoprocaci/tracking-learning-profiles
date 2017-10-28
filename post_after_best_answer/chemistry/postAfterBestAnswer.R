data = read.csv("chemistry.csv", header = TRUE, dec = ",", sep = ";")

outstanding1 = subset(data, data$profile_1 == 4)
outstanding2 = subset(data, data$profile_2 == 4)

ordinary1 = subset(data, data$profile_1 == 1)
ordinary2 = subset(data, data$profile_2 == 1)

print("Posts outstanding after best answer - scenario 1")
print(summary(outstanding1$totalPost))

print("Posts outstanding after best answer - scenario 2")
print(summary(outstanding2$totalPost))

print("Posts ordinary after best answer - scenario 1")
print(summary(ordinary1$totalPost))

print("Posts ordinary after best answer - scenario 2")
print(summary(ordinary2$totalPost))


source("../../functions/Functions.R")

existsDiff(outstanding1$totalPost, ordinary1$totalPost, "Diff posts outstd. x ord. scenario 1")

existsDiff(outstanding2$totalPost, ordinary2$totalPost, "Diff posts outstd. x ord. scenario 2")



general = read.csv("general.csv", header = TRUE, dec = ",", sep = ";")

generalNoAfterBest = subset(general, general$has_answer_after_best == 'no_answer_after_best')
generalHasAfterBest = subset(general, general$has_answer_after_best == 'answer_after_best')

total = nrow(generalNoAfterBest) + nrow(generalHasAfterBest)


print(nrow(generalHasAfterBest) * 100/total)


