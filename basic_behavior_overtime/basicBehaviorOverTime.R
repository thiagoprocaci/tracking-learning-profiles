readAndAddAccumulatedSum <- function(path) {
  data = read.csv(path, header = TRUE, sep = ";")
  data[, "accummulated"] <-0
  
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    
    mySubset = subset(data, data$profile == row$profile & as.numeric(data$period) <= as.numeric(row$period))
    data[index, "accummulated"]= sum(mySubset$myCount)
    index = index + 1
  }
  return (data)
}

filterData <- function(data) {
  dataProfile1 = subset(data, data$profile == 1)
  dataProfile2 = subset(data, data$profile == 2)
  dataProfile3 = subset(data, data$profile == 3)
  dataProfile4 = subset(data, data$profile == 4)
  
  newList <- list("profile1" = dataProfile1, "profile2" = dataProfile2,  "profile3" = dataProfile3, "profile4" = dataProfile4)
  return (newList)
}

biologyQuestions =  readAndAddAccumulatedSum("biology_questions_period_profile.csv")
biologyAnswers =  readAndAddAccumulatedSum("biology_answers_period_profile.csv")
biologyComments =  readAndAddAccumulatedSum("biology_comments_period_profile.csv")



chemistryQuestions =  readAndAddAccumulatedSum("chemistry_questions_period_profile.csv")
chemistryAnswers =  readAndAddAccumulatedSum("chemistry_answers_period_profile.csv")
chemistryComments =  readAndAddAccumulatedSum("chemistry_comments_period_profile.csv")



par(mfrow=c(2,3))

filtedBiologyDataQuestion = filterData(biologyQuestions)


yrangeQuestions <- range(c(biologyQuestions$accummulated))
xrangeQuestions <- range(c(biologyQuestions$period))


plot(xrangeQuestions, yrangeQuestions, xlab="Time Slice", ylab="Number of Questions", type = "n", main = "Biology"  )

lines(filtedBiologyDataQuestion$profile1$period, filtedBiologyDataQuestion$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedBiologyDataQuestion$profile2$period, filtedBiologyDataQuestion$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedBiologyDataQuestion$profile3$period, filtedBiologyDataQuestion$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedBiologyDataQuestion$profile4$period, filtedBiologyDataQuestion$profile4$accummulated, col="orange", lwd = 2.1 )
legend(1, 170, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)


filtedBiologyAnswers = filterData(biologyAnswers)


xrangeAnswers = range(c(biologyAnswers$period))
yrangeAnswers = range(c(biologyAnswers$accummulated))

plot(xrangeAnswers, yrangeAnswers, xlab="Time Slice", ylab="Number of Answers", type = "n", main = "Biology" )
lines(filtedBiologyAnswers$profile1$period, filtedBiologyAnswers$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedBiologyAnswers$profile2$period, filtedBiologyAnswers$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedBiologyAnswers$profile3$period, filtedBiologyAnswers$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedBiologyAnswers$profile4$period, filtedBiologyAnswers$profile4$accummulated, col="orange", lwd = 2.1 )
legend(1, 340, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)


filtedBiologyComments = filterData(biologyComments)


xrangeComments = range(c(biologyComments$period))
yrangeComments = range(c(biologyComments$accummulated))

plot(xrangeAnswers, yrangeAnswers, xlab="Time Slice", ylab="Number of Comments", type = "n", main = "Biology" )
lines(filtedBiologyComments$profile1$period, filtedBiologyComments$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedBiologyComments$profile2$period, filtedBiologyComments$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedBiologyComments$profile3$period, filtedBiologyComments$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedBiologyComments$profile4$period, filtedBiologyComments$profile4$accummulated, col="orange", lwd = 2.1 )
legend(1, 340, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)



filtedChemistryDataQuestions = filterData(chemistryQuestions)


yrangeChemistryQuestions <- range(c(chemistryQuestions$accummulated))
xrangeChemistryQuestions <- range(c(chemistryQuestions$period))


plot(xrangeChemistryQuestions, yrangeChemistryQuestions, xlab="Time Slice", ylab="Number of Questions", type = "n", main = "Chemistry"  )

lines(filtedChemistryDataQuestions$profile1$period, filtedChemistryDataQuestions$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedChemistryDataQuestions$profile2$period, filtedChemistryDataQuestions$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedChemistryDataQuestions$profile3$period, filtedChemistryDataQuestions$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedChemistryDataQuestions$profile4$period, filtedChemistryDataQuestions$profile4$accummulated, col="orange", lwd = 2.1 )
legend(0.1, 144, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)


filtedChemistryAnswers = filterData(chemistryAnswers)


xrangeChemistryAnswers = range(c(chemistryAnswers$period))
yrangeChemistryAnswers = range(c(chemistryAnswers$accummulated))

plot(xrangeChemistryAnswers, yrangeChemistryAnswers, xlab="Time Slice", ylab="Number of Answers", type = "n", main = "Chemistry" )
lines(filtedChemistryAnswers$profile1$period, filtedChemistryAnswers$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedChemistryAnswers$profile2$period, filtedChemistryAnswers$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedChemistryAnswers$profile3$period, filtedChemistryAnswers$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedChemistryAnswers$profile4$period, filtedChemistryAnswers$profile4$accummulated, col="orange", lwd = 2.1 )
legend(1, 480, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)

filtedChemistryComments = filterData(chemistryComments)


xrangeChemistryComments = range(c(chemistryComments$period))
yrangeChemistryComments = range(c(chemistryComments$accummulated))

plot(xrangeChemistryComments, yrangeChemistryComments, xlab="Time Slice", ylab="Number of Comments", type = "n", main = "Chemistry" )
lines(filtedChemistryComments$profile1$period, filtedChemistryComments$profile1$accummulated, col="red", lwd = 2.1 )
lines(filtedChemistryComments$profile2$period, filtedChemistryComments$profile2$accummulated, col="blue", lwd = 2.1 )
lines(filtedChemistryComments$profile3$period, filtedChemistryComments$profile3$accummulated, col="green", lwd = 2.1 )
lines(filtedChemistryComments$profile4$period, filtedChemistryComments$profile4$accummulated, col="orange", lwd = 2.1 )
legend(1, 1300, legend=c("Newbie", "Junior", "Middle" , "Seniors"),    
       col=c("red", "blue", "green", "orange"), lty=1:1, cex=0.8, lwd = 5.1)


print("Newbie Biology Monthly Questions Summary")
print(summary(filtedBiologyDataQuestion$profile1$myCount))

print("Newbie Biology Monthly Answers Summary")
print(summary(filtedBiologyAnswers$profile1$myCount))

print("Newbie Biology Monthly Comments Summary")
print(summary(filtedBiologyComments$profile1$myCount))

print("----------------------------------------")

print("Junior Biology Monthly Questions Summary")
print(summary(filtedBiologyDataQuestion$profile2$myCount))

print("Junior Biology Monthly Answers Summary")
print(summary(filtedBiologyAnswers$profile2$myCount))

print("Junior Biology Monthly Comments Summary")
print(summary(filtedBiologyComments$profile2$myCount))


print("----------------------------------------")

print("Middle Biology Monthly Questions Summary")
print(summary(filtedBiologyDataQuestion$profile3$myCount))

print("Middle Biology Monthly Answers Summary")
print(summary(filtedBiologyAnswers$profile3$myCount))

print("Middle Biology Monthly Comments Summary")
print(summary(filtedBiologyComments$profile3$myCount))

print("----------------------------------------")

print("Seniors Biology Monthly Questions Summary")
print(summary(filtedBiologyDataQuestion$profile4$myCount))

print("Seniors Biology Monthly Answers Summary")
print(summary(filtedBiologyAnswers$profile4$myCount))

print("Seniors Biology Monthly Comments Summary")
print(summary(filtedBiologyComments$profile4$myCount))

print("----------------------------------------")

print("Newbie Chemistry Monthly Questions Summary")
print(summary(filtedChemistryDataQuestions$profile1$myCount))

print("Newbie Chemistry Monthly Answers Summary")
print(summary(filtedChemistryAnswers$profile1$myCount))

print("Newbie Chemistry Monthly Comments Summary")
print(summary(filtedChemistryComments$profile1$myCount))

print("----------------------------------------")

print("Junior Chemistry Monthly Questions Summary")
print(summary(filtedChemistryDataQuestions$profile2$myCount))

print("Junior Chemistry Monthly Answers Summary")
print(summary(filtedChemistryAnswers$profile2$myCount))

print("Junior Chemistry Monthly Comments Summary")
print(summary(filtedChemistryComments$profile2$myCount))

print("----------------------------------------")

print("Middle Chemistry Monthly Questions Summary")
print(summary(filtedChemistryDataQuestions$profile3$myCount))

print("Middle Chemistry Monthly Answers Summary")
print(summary(filtedChemistryAnswers$profile3$myCount))

print("Middle Chemistry Monthly Comments Summary")
print(summary(filtedChemistryComments$profile3$myCount))

print("----------------------------------------")

print("Seniors Chemistry Monthly Questions Summary")
print(summary(filtedChemistryDataQuestions$profile4$myCount))

print("Seniors Chemistry Monthly Answers Summary")
print(summary(filtedChemistryAnswers$profile4$myCount))

print("Seniors Chemistry Monthly Comments Summary")
print(summary(filtedChemistryComments$profile4$myCount))



