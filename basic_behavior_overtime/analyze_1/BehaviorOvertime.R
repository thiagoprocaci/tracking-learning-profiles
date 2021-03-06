library(ggplot2)

biologyData =   read.csv("biology.csv", header = TRUE, sep = ";")
biologyData [, "class"] = ifelse(biologyData$profile_1 == 4, "outstanding", "ordinary")
biologyData [, "avg"] = biologyData$myCount/biologyData$totalUserProfile

chemistryData =  read.csv("chemistry.csv", header = TRUE, sep = ";")
chemistryData [, "class"] = ifelse(chemistryData$profile_1 == 4, "outstanding", "ordinary")
chemistryData [, "avg"] = chemistryData$myCount/chemistryData$totalUserProfile

biologyDataQuestion = subset(biologyData, biologyData$description == "questions")
biologyDataAnswers = subset(biologyData, biologyData$description == "answers")
biologyDataComments = subset(biologyData, biologyData$description == "comments")

chemistryDataQuestion = subset(chemistryData, chemistryData$description == "questions")
chemistryDataAnswers = subset(chemistryData, chemistryData$description == "answers")
chemistryDataComments = subset(chemistryData, chemistryData$description == "comments")

require(gridExtra)

bioPlotQuestions = ggplot(data=biologyDataQuestion,
                 aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Biology") + ylab("Questions Per Time Slice") +
  geom_line()


bioPlotAnswers = ggplot(data=biologyDataAnswers,
                 aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Biology") + ylab("Answers Per Time Slice") +
  geom_line()

bioPlotComments = ggplot(data=biologyDataComments,
                        aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Biology") + ylab("Comments Per Time Slice") +
  geom_line()


chemistryPlotQuestions = ggplot(data=chemistryDataQuestion,
                          aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Chemistry") + ylab("Questions Per Time Slice") +
  geom_line()


chemistryPlotAnswers = ggplot(data=chemistryDataAnswers,
                        aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Chemistry") + ylab("Answers Per Time Slice") +
  geom_line()

chemistryPlotComments = ggplot(data=chemistryDataComments,
                         aes(x = period, y = myCount, colour = class)) +
  xlab("Time Slice - Chemistry") + ylab("Comments Per Time Slice") +
  geom_line()

grid.arrange(bioPlotQuestions, bioPlotAnswers, bioPlotComments, 
             chemistryPlotQuestions,chemistryPlotAnswers, chemistryPlotComments,
             ncol=3)

biologyDataQuestionOutstanding = subset(biologyDataQuestion, biologyDataQuestion$profile_1 == 4)
biologyDataQuestionOrdinary = subset(biologyDataQuestion, biologyDataQuestion$profile_1 == 1)

biologyDataAnswersOutstanding = subset(biologyDataAnswers, biologyDataAnswers$profile_1 == 4)
biologyDataAnswersOrdinary = subset(biologyDataAnswers, biologyDataAnswers$profile_1 == 1)

biologyDataCommentsOutstanding = subset(biologyDataComments, biologyDataComments$profile_1 == 4)
biologyDataCommentsOrdinary = subset(biologyDataComments, biologyDataComments$profile_1 == 1)

print("Biology Questions Number Outstanding Per Period")
print(summary(biologyDataQuestionOutstanding$myCount))
print("Biology Answers Number Outstanding Per Period")
print(summary(biologyDataAnswersOutstanding$myCount))
print("Biology Comments Number Outstanding Per Period")
print(summary(biologyDataCommentsOutstanding$myCount))

print("Biology Questions Number Ordinary Per Period")
print(summary(biologyDataQuestionOrdinary$myCount))
print("Biology Answers Number Ordinary Per Period")
print(summary(biologyDataAnswersOrdinary$myCount))
print("Biology Comments Number Ordinary Per Period")
print(summary(biologyDataCommentsOrdinary$myCount))


chemistryDataQuestionOutstanding = subset(chemistryDataQuestion, chemistryDataQuestion$profile_1 == 4)
chemistryDataQuestionOrdinary = subset(chemistryDataQuestion, chemistryDataQuestion$profile_1 == 1)

chemistryDataAnswersOutstanding = subset(chemistryDataAnswers, chemistryDataAnswers$profile_1 == 4)
chemistryDataAnswersOrdinary = subset(chemistryDataAnswers, chemistryDataAnswers$profile_1 == 1)

chemistryDataCommentsOutstanding = subset(chemistryDataComments, chemistryDataComments$profile_1 == 4)
chemistryDataCommentsOrdinary = subset(chemistryDataComments, chemistryDataComments$profile_1 == 1)


print("Chemistry Questions Number Outstanding Per Period")
print(summary(chemistryDataQuestionOutstanding$myCount))
print("Chemistry Answers Number Outstanding Per Period")
print(summary(chemistryDataAnswersOutstanding$myCount))
print("Chemistry Comments Number Outstanding Per Period")
print(summary(chemistryDataCommentsOutstanding$myCount))


print("Chemistry Questions Number Ordinary Per Period")
print(summary(chemistryDataQuestionOrdinary$myCount))
print("Chemistry Answers Number Ordinary Per Period")
print(summary(chemistryDataAnswersOrdinary$myCount))
print("Chemistry Comments Number Ordinary Per Period")
print(summary(chemistryDataCommentsOrdinary$myCount))

source("../../functions/Functions.R")

existsDiff(biologyDataQuestionOutstanding$myCount, biologyDataQuestionOrdinary$myCount, "Bio Question Diff Out. x Ord")
existsDiff(biologyDataAnswersOutstanding$myCount, biologyDataAnswersOrdinary$myCount, "Bio Answers Diff Out. x Ord")
existsDiff(biologyDataCommentsOutstanding$myCount, biologyDataCommentsOrdinary$myCount, "Bio Comments Diff Out. x Ord")


existsDiff(chemistryDataQuestionOutstanding$myCount, chemistryDataQuestionOrdinary$myCount, "chemistry Question Diff Out. x Ord")
existsDiff(chemistryDataAnswersOutstanding$myCount, chemistryDataAnswersOrdinary$myCount, "chemistry Answers Diff Out. x Ord")
existsDiff(chemistryDataCommentsOutstanding$myCount, chemistryDataCommentsOrdinary$myCount, "chemistry Comments Diff Out. x Ord")


