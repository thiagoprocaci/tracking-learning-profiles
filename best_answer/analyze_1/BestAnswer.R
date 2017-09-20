readAndCalculateTotal <- function(path) {
  data = read.csv(path, header = TRUE, sep = ";")
  data[, "totalBestAnswerInPeriod"] <- 0
  data[, "class"] =  ""
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    
    mySubset = subset(data, data$period == row$period)
    data[index, "totalBestAnswerInPeriod"]= sum(mySubset$totalBestAnswers)
    
    if(1 == row$profile_1) {
      data[index, "class"] = "Ordinary"
    }
    if(4 == row$profile_1) {
      data[index, "class"] = "Outstanding"
    }
    
    index = index + 1
  }
  data[, "probBestAnswer"] = data$totalBestAnswers / data$totalBestAnswerInPeriod
  return (data)
}

biologyData = readAndCalculateTotal("biology.csv")
chemistryData = readAndCalculateTotal("chemistry.csv")

library("ggplot2")
require(gridExtra)

bioPlot = ggplot(data=biologyData,
                 aes(x = period, y = probBestAnswer, colour = class)) +
  xlab("Time Slice") + ylab("Prob. of giving the best answer") +
  geom_line()

chemistryPlot = ggplot(data=chemistryData,
                       aes(x = period, y = probBestAnswer, colour = class)) +
  xlab("Time Slice") + ylab("Prob. of giving the best answer") +
  geom_line()


grid.arrange(bioPlot, chemistryPlot, ncol=2)







