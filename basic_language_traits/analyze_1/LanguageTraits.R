options(warn=-1)

library(ggplot2)
source("../../functions/Functions.R")

defineClass <- function(data) {
  data[, "class"] =  ""
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    if(1 == row$profile_1) {
      data[index, "class"] = "Ordinary"
    }
    if(4 == row$profile_1) {
      data[index, "class"] = "Outstanding"
    }
    index = index + 1
  }
  return (data)
}


biologyData = defineClass(read.csv("biology.csv", header = TRUE, sep = ";", dec = ","))
chemistryData = defineClass(read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ","))



require(gridExtra)


complexWordBiology = qplot(post_type, complexWordsTextAvg, colour = class, data = biologyData, ylab = "Avg. Complex Words", xlab = "Post Type", main = "Biology")
complexWordChemistry = qplot(post_type, complexWordsTextAvg, colour = class, data = chemistryData, ylab = "Avg. Complex Words", xlab = "Post Type", main = "Chemistry")

sentencesBiology = qplot(post_type, sentencesTextAvg, colour = class, data = biologyData, ylab = "Avg. Sentences", xlab = "Post Type", main = "Biology")
sentencesChemistry = qplot(post_type, sentencesTextAvg, colour = class, data = chemistryData, ylab = "Avg. Sentences", xlab = "Post Type", main = "Chemistry")


ariBiology = qplot(post_type, ariTextAvg, colour = class, data = biologyData, ylab = "Avg. ARI", xlab = "Post Type", main = "Biology")
ariChemistry = qplot(post_type, ariTextAvg, colour = class, data = chemistryData, ylab = "Avg. ARI", xlab = "Post Type", main = "Chemistry")



grid.arrange(complexWordBiology, complexWordChemistry, sentencesBiology, sentencesChemistry, ariBiology, ariChemistry, ncol=3)

















