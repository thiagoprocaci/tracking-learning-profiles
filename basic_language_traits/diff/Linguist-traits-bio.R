source("../../functions/Functions.R")

biology = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
biologyOutstanding = subset(biology, biology$profile_1 == 4)
biologyOrdinary = subset(biology, biology$profile_1 == 1)

existsDiff(biologyOutstanding$avg_ari, biologyOrdinary$avg_ari, "Bio Diff ARI Outstd. Ord - Analyse 1")
print("Summary ARI Outstd. BIO - Analyse 1")
print(summary(biologyOutstanding$avg_ari))
print("Summary ARI Ord. BIO - Analyse 1")
print(summary(biologyOrdinary$avg_ari))

existsDiff(biologyOutstanding$wordsTextAvg, biologyOrdinary$wordsTextAvg, "Bio Diff words Outstd. Ord  - Analyse 1")
print("Summary words Outstd. BIO - Analyse 1")
print(summary(biologyOutstanding$wordsTextAvg))
print("Summary words Ord. BIO  - Analyse 1")
print(summary(biologyOrdinary$wordsTextAvg))


existsDiff(biologyOutstanding$complexWordsTextAvg, biologyOrdinary$complexWordsTextAvg, "Bio Diff complex words Outstd. Ord  - Analyse 1")
print("Summary complex words Outstd. BIO  - Analyse 1")
print(summary(biologyOutstanding$complexWordsTextAvg))
print("Summary complex words Ord. BIO  - Analyse 1")
print(summary(biologyOrdinary$complexWordsTextAvg))

existsDiff(biologyOutstanding$sentencesTextAvg, biologyOrdinary$sentencesTextAvg, "Bio Diff sentences Outstd. Ord  - Analyse 1")
print("Summary sentences Outstd. BIO  - Analyse 1")
print(summary(biologyOutstanding$sentencesTextAvg))
print("Summary sentences Ord. BIO  - Analyse 1")
print(summary(biologyOrdinary$sentencesTextAvg))



biologyOutstanding = subset(biology, biology$profile_2 == 4)
biologyOrdinary = subset(biology, biology$profile_2 == 1)

existsDiff(biologyOutstanding$avg_ari, biologyOrdinary$avg_ari, "Bio Diff ARI Outstd. Ord - Analyse 2")
print("Summary ARI Outstd. BIO - Analyse 2")
print(summary(biologyOutstanding$avg_ari))
print("Summary ARI Ord. BIO - Analyse 2")
print(summary(biologyOrdinary$avg_ari))


existsDiff(biologyOutstanding$wordsTextAvg, biologyOrdinary$wordsTextAvg, "Bio Diff words Outstd. Ord  - Analyse 2")
print("Summary words Outstd. BIO - Analyse 2")
print(summary(biologyOutstanding$wordsTextAvg))
print("Summary words Ord. BIO  - Analyse 2")
print(summary(biologyOrdinary$wordsTextAvg))


existsDiff(biologyOutstanding$complexWordsTextAvg, biologyOrdinary$complexWordsTextAvg, "Bio Diff complex words Outstd. Ord  - Analyse 2")
print("Summary complex words Outstd. BIO  - Analyse 2")
print(summary(biologyOutstanding$complexWordsTextAvg))
print("Summary complex words Ord. BIO  - Analyse 2")
print(summary(biologyOrdinary$complexWordsTextAvg))

existsDiff(biologyOutstanding$sentencesTextAvg, biologyOrdinary$sentencesTextAvg, "Bio Diff sentences Outstd. Ord  - Analyse 2")
print("Summary sentences Outstd. BIO  - Analyse 2")
print(summary(biologyOutstanding$sentencesTextAvg))
print("Summary sentences Ord. BIO  - Analyse 2")
print(summary(biologyOrdinary$sentencesTextAvg))