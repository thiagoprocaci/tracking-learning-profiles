options(warn=-1)

source("../functions/Functions.R")


biologyData = read.csv("biology.csv", header = TRUE, sep = ";")
chemistryData = read.csv("chemistry.csv", header = TRUE, sep = ";")


chemistryData[, "avgScoreQuestion"] <- ifelse(chemistryData$avgScoreQuestion == "\\N", 0, chemistryData$avgScoreQuestion)
chemistryData[, "avgScoreAnswers"] <- ifelse(chemistryData$avgScoreAnswers == "\\N", 0, chemistryData$avgScoreAnswers)
chemistryData[, "avgScoreComments"] <- ifelse(chemistryData$avgScoreComments == "\\N", 0, chemistryData$avgScoreComments)
chemistryData[, "sumScoreQuestion"] <- ifelse(chemistryData$sumScoreQuestion == "\\N", 0, chemistryData$sumScoreQuestion)
chemistryData[, "sumScoreAnswers"] <- ifelse(chemistryData$sumScoreAnswers == "\\N", 0, chemistryData$sumScoreAnswers)
chemistryData[, "sumScoreComments"] <- ifelse(chemistryData$sumScoreComments == "\\N", 0, chemistryData$sumScoreComments)


biologyData[, "avgScoreQuestion"] <- ifelse(biologyData$avgScoreQuestion == "\\N", 0, biologyData$avgScoreQuestion)
biologyData[, "avgScoreAnswers"] <- ifelse(biologyData$avgScoreAnswers == "\\N", 0, biologyData$avgScoreAnswers)
biologyData[, "avgScoreComments"] <- ifelse(biologyData$avgScoreComments == "\\N", 0, biologyData$avgScoreComments)
biologyData[, "sumScoreQuestion"] <- ifelse(biologyData$sumScoreQuestion == "\\N", 0, biologyData$sumScoreQuestion)
biologyData[, "sumScoreAnswers"] <- ifelse(biologyData$sumScoreAnswers == "\\N", 0, biologyData$sumScoreAnswers)
biologyData[, "sumScoreComments"] <- ifelse(biologyData$sumScoreComments == "\\N", 0, biologyData$sumScoreComments)


biologySubset1 = subset(biologyData, biologyData$profile_1 == 1)
chemistrySubset1 = subset(chemistryData, chemistryData$profile_1 == 1)

biologySubset4 = subset(biologyData, biologyData$profile_1 == 4)
chemistrySubset4 = subset(chemistryData, chemistryData$profile_1 == 4)


existsDiff(biologySubset4$avgScoreAnswers, biologySubset1$avgScoreAnswers, "Biology AVG Score Profile_1")
existsDiff(biologySubset4$avgScoreComments, biologySubset1$avgScoreComments, "Biology AVG Score Comments Profile_1")
existsDiff(biologySubset4$avgScoreQuestion, biologySubset1$avgScoreQuestion, "Biology AVG Score Questions Profile_1")



existsDiff(chemistrySubset4$avgScoreAnswers, chemistrySubset1$avgScoreAnswers, "Chemistry AVG Score Profile_1")
existsDiff(chemistrySubset4$avgScoreComments, chemistrySubset1$avgScoreComments, "Chemistry AVG Score Comments Profile_1")
existsDiff(chemistrySubset4$avgScoreQuestion, chemistrySubset1$avgScoreQuestion, "Chemistry AVG Score Questions Profile_1")



biologySubset1 = subset(biologyData, biologyData$profile_2 == 1)
chemistrySubset1 = subset(chemistryData, chemistryData$profile_2 == 1)

biologySubset4 = subset(biologyData, biologyData$profile_2 == 4)
chemistrySubset4 = subset(chemistryData, chemistryData$profile_2 == 4)


existsDiff(biologySubset4$avgScoreAnswers, biologySubset1$avgScoreAnswers, "Biology AVG Score Profile_2")
existsDiff(biologySubset4$avgScoreComments, biologySubset1$avgScoreComments, "Biology AVG Score Comments Profile_2")
existsDiff(biologySubset4$avgScoreQuestion, biologySubset1$avgScoreQuestion, "Biology AVG Score Questions Profile_2")



existsDiff(chemistrySubset4$avgScoreAnswers, chemistrySubset1$avgScoreAnswers, "Chemistry AVG Score Profile_2")
existsDiff(chemistrySubset4$avgScoreComments, chemistrySubset1$avgScoreComments, "Chemistry AVG Score Comments Profile_2")
existsDiff(chemistrySubset4$avgScoreQuestion, chemistrySubset1$avgScoreQuestion, "Chemistry AVG Score Questions Profile_2")





