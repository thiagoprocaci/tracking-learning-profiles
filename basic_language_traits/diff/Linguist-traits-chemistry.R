source("../../functions/Functions.R")

chemistry = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")
chemistryOutstanding = subset(chemistry, chemistry$profile_1 == 4)
chemistryOrdinary = subset(chemistry, chemistry$profile_1 == 1)

existsDiff(chemistryOutstanding$avg_ari, chemistryOrdinary$avg_ari, "chemistry Diff ARI Outstd. Ord - Analyse 1")
print("Summary ARI Outstd. chemistry - Analyse 1")
print(summary(chemistryOutstanding$avg_ari))
print("Summary ARI Ord. chemistry - Analyse 1")
print(summary(chemistryOrdinary$avg_ari))

existsDiff(chemistryOutstanding$wordsTextAvg, chemistryOrdinary$wordsTextAvg, "chemistry Diff words Outstd. Ord  - Analyse 1")
print("Summary words Outstd. chemistry - Analyse 1")
print(summary(chemistryOutstanding$wordsTextAvg))
print("Summary words Ord. chemistry  - Analyse 1")
print(summary(chemistryOrdinary$wordsTextAvg))


existsDiff(chemistryOutstanding$complexWordsTextAvg, chemistryOrdinary$complexWordsTextAvg, "chemistry Diff complex words Outstd. Ord  - Analyse 1")
print("Summary complex words Outstd. chemistry  - Analyse 1")
print(summary(chemistryOutstanding$complexWordsTextAvg))
print("Summary complex words Ord. chemistry  - Analyse 1")
print(summary(chemistryOrdinary$complexWordsTextAvg))

existsDiff(chemistryOutstanding$sentencesTextAvg, chemistryOrdinary$sentencesTextAvg, "chemistry Diff sentences Outstd. Ord  - Analyse 1")
print("Summary sentences Outstd. chemistry  - Analyse 1")
print(summary(chemistryOutstanding$sentencesTextAvg))
print("Summary sentences Ord. chemistry  - Analyse 1")
print(summary(chemistryOrdinary$sentencesTextAvg))



chemistryOutstanding = subset(chemistry, chemistry$profile_2 == 4)
chemistryOrdinary = subset(chemistry, chemistry$profile_2 == 1)

existsDiff(chemistryOutstanding$avg_ari, chemistryOrdinary$avg_ari, "chemistry Diff ARI Outstd. Ord - Analyse 2")
print("Summary ARI Outstd. chemistry - Analyse 2")
print(summary(chemistryOutstanding$avg_ari))
print("Summary ARI Ord. chemistry - Analyse 2")
print(summary(chemistryOrdinary$avg_ari))


existsDiff(chemistryOutstanding$wordsTextAvg, chemistryOrdinary$wordsTextAvg, "chemistry Diff words Outstd. Ord  - Analyse 2")
print("Summary words Outstd. chemistry - Analyse 2")
print(summary(chemistryOutstanding$wordsTextAvg))
print("Summary words Ord. chemistry  - Analyse 2")
print(summary(chemistryOrdinary$wordsTextAvg))


existsDiff(chemistryOutstanding$complexWordsTextAvg, chemistryOrdinary$complexWordsTextAvg, "chemistry Diff complex words Outstd. Ord  - Analyse 2")
print("Summary complex words Outstd. chemistry  - Analyse 2")
print(summary(chemistryOutstanding$complexWordsTextAvg))
print("Summary complex words Ord. chemistry  - Analyse 2")
print(summary(chemistryOrdinary$complexWordsTextAvg))

existsDiff(chemistryOutstanding$sentencesTextAvg, chemistryOrdinary$sentencesTextAvg, "chemistry Diff sentences Outstd. Ord  - Analyse 2")
print("Summary sentences Outstd. chemistry  - Analyse 2")
print(summary(chemistryOutstanding$sentencesTextAvg))
print("Summary sentences Ord. chemistry  - Analyse 2")
print(summary(chemistryOrdinary$sentencesTextAvg))


library(ggplot2)


