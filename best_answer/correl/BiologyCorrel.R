data = read.csv("biology.csv", header = TRUE, dec = ",", sep = ";")

source("../../functions/Functions.R")

outstd = subset(data, data$profile_1 == 4)
ord = subset(data, data$profile_1 == 1)

correlation(outstd$bestAnswers, outstd$reputation, "Analyse 1 BIO - outstd")
correlation(ord$bestAnswers, ord$reputation, "Analyse 1 BIO - ord")


outstd = subset(data, data$profile_2 == 4)
ord = subset(data, data$profile_2 == 1)

correlation(outstd$bestAnswers, outstd$reputation, "Analyse 2 BIO - outstd")
correlation(ord$bestAnswers, ord$reputation, "Analyse 2 BIO - ord")

data = read.csv("chemistry.csv", header = TRUE, dec = ",", sep = ";")


outstd = subset(data, data$profile_1 == 4)
ord = subset(data, data$profile_1 == 1)

correlation(outstd$bestAnswers, outstd$reputation, "Analyse 1 Chemistry - outstd")
correlation(ord$bestAnswers, ord$reputation, "Analyse 1 Chemistry - ord")


outstd = subset(data, data$profile_2 == 4)
ord = subset(data, data$profile_2 == 1)

correlation(outstd$bestAnswers, outstd$reputation, "Analyse 2 Chemistry - outstd")
correlation(ord$bestAnswers, ord$reputation, "Analyse 2 Chemistry - ord")