options(warn=-1)

source("../functions/Functions.R")


biologyData = read.csv("biology_general_score.csv", header = TRUE, sep = ";")
chemistryData = read.csv("chemistry_general_score.csv", header = TRUE, sep = ";")


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


biologySubset2 = subset(biologyData, biologyData$profile == 2)
chemistrySubset2 = subset(chemistryData, chemistryData$profile == 2)

biologySubset3 = subset(biologyData, biologyData$profile == 3)
chemistrySubset3 = subset(chemistryData, chemistryData$profile == 3)

biologySubset4 = subset(biologyData, biologyData$profile == 4)
chemistrySubset4 = subset(chemistryData, chemistryData$profile == 4)

existsDiff(biologySubset4$avgScoreAnswers, biologySubset3$avgScoreAnswers, "Biology AVG Score Answers 4 x 3")
existsDiff(biologySubset4$avgScoreAnswers, biologySubset2$avgScoreAnswers, "Biology AVG Score Answers 4 x 2")
existsDiff(biologySubset3$avgScoreAnswers, biologySubset2$avgScoreAnswers, "Biology AVG Score Answers 3 x 2")

existsDiff(biologySubset4$avgScoreComments, biologySubset3$avgScoreComments, "Biology AVG Score Comments 4 x 3")
existsDiff(biologySubset4$avgScoreComments, biologySubset2$avgScoreComments, "Biology AVG Score Comments 4 x 2")
existsDiff(biologySubset3$avgScoreComments, biologySubset2$avgScoreComments, "Biology AVG Score Comments 3 x 2")


existsDiff(biologySubset4$avgScoreQuestion, biologySubset3$avgScoreQuestion, "Biology AVG Score Questions 4 x 3")
existsDiff(biologySubset4$avgScoreQuestion, biologySubset2$avgScoreQuestion, "Biology AVG Score Questions 4 x 2")
existsDiff(biologySubset3$avgScoreQuestion, biologySubset2$avgScoreQuestion, "Biology AVG Score Questions 3 x 2")


existsDiff(chemistrySubset4$avgScoreAnswers, chemistrySubset3$avgScoreAnswers, "Chemistry AVG Score Answers 4 x 3")
existsDiff(chemistrySubset4$avgScoreAnswers, chemistrySubset2$avgScoreAnswers, "Chemistry AVG Score Answers 4 x 2")
existsDiff(chemistrySubset3$avgScoreAnswers, chemistrySubset2$avgScoreAnswers, "Chemistry AVG Score Answers 3 x 2")

existsDiff(chemistrySubset4$avgScoreComments, chemistrySubset3$avgScoreComments, "Chemistry AVG Score Comments 4 x 3")
existsDiff(chemistrySubset4$avgScoreComments, chemistrySubset2$avgScoreComments, "Chemistry AVG Score Comments 4 x 2")
existsDiff(chemistrySubset3$avgScoreComments, chemistrySubset2$avgScoreComments, "Chemistry AVG Score Comments 3 x 2")


existsDiff(chemistrySubset4$avgScoreQuestion, chemistrySubset3$avgScoreQuestion, "Chemistry AVG Score Questions 4 x 3")
existsDiff(chemistrySubset4$avgScoreQuestion, chemistrySubset2$avgScoreQuestion, "Chemistry AVG Score Questions 4 x 2")
existsDiff(chemistrySubset3$avgScoreQuestion, chemistrySubset2$avgScoreQuestion, "Chemistry AVG Score Questions 3 x 2")





