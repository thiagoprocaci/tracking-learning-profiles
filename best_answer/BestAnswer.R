readAndCalculateTotal <- function(path) {
  data = read.csv(path, header = TRUE, sep = ";")
  data[, "totalBestAnswerInPeriod"] <- 0
  data[, "class"] =  ""
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    
    mySubset = subset(data, data$period == row$period)
    data[index, "totalBestAnswerInPeriod"]= sum(mySubset$totalBestAnswers)
    
    if(1 == row$profile) {
      data[index, "class"] = "1. Newbie"
    }
    if(2 == row$profile) {
      data[index, "class"] = "2. Junior"
    }
    if(3 == row$profile) {
      data[index, "class"] = "3. Middle"
    }
    if(4 == row$profile) {
      data[index, "class"] = "4. Senior"
    }
    
    index = index + 1
  }
  data[, "probBestAnswer"] = data$totalBestAnswers / data$totalBestAnswerInPeriod
  return (data)
}

biologyData = readAndCalculateTotal("biology_best_answer_overtime.csv")
chemistryData = readAndCalculateTotal("chemistry_best_answer_overtime.csv")

library("ggplot2")
require(gridExtra)

bioPlot = ggplot(data=biologyData,
       aes(x = period, y = probBestAnswer, colour = class)) +
      xlab("Time Slice") + ylab("Prob. of give the best answer") +
  geom_line()

chemistryPlot = ggplot(data=chemistryData,
                 aes(x = period, y = probBestAnswer, colour = class)) +
  xlab("Time Slice") + ylab("Prob. of give the best answer") +
  geom_line()


grid.arrange(bioPlot, chemistryPlot, ncol=2)


options(warn=-1)

source("../functions/Functions.R")




