options(warn=-1)

library(ggplot2)
source("../functions/Functions.R")

defineClass <- function(data) {
  data[, "class"] =  ""
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
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
  return (data)
}


biologyData = defineClass(read.csv("biology_language_traits.csv", header = TRUE, sep = ";", dec = ","))
chemistryData = defineClass(read.csv("chemistry_language_traits.csv", header = TRUE, sep = ";", dec = ","))



#print(qplot(post_type, ariTextAvg, colour = class, data = biologyData, ylab = "Avg. ARI", xlab = "Post Type", main = "Biology" ))
#print(qplot(post_type, smogTextAvg, colour = class, data = biologyData , ylab = "Avg. SMOG", xlab = "Post Type", main = "Biology" ))
#print(qplot(post_type, fleschReadingTextAvg, colour = class, data = biologyData, ylab = "Avg. Flesch Reading", xlab = "Post Type", main = "Biology"))


require(gridExtra)


complexWordBiology = qplot(post_type, complexWordsTextAvg, colour = class, data = biologyData, ylab = "Avg. Complex Words", xlab = "Post Type", main = "Biology")
complexWordChemistry = qplot(post_type, complexWordsTextAvg, colour = class, data = chemistryData, ylab = "Avg. Complex Words", xlab = "Post Type", main = "Chemistry")

sentencesBiology = qplot(post_type, sentencesTextAvg, colour = class, data = biologyData, ylab = "Avg. Sentences", xlab = "Post Type", main = "Biology")
sentencesChemistry = qplot(post_type, sentencesTextAvg, colour = class, data = chemistryData, ylab = "Avg. Sentences", xlab = "Post Type", main = "Chemistry")


ariBiology = qplot(post_type, ariTextAvg, colour = class, data = biologyData, ylab = "Avg. ARI", xlab = "Post Type", main = "Biology")
ariChemistry = qplot(post_type, ariTextAvg, colour = class, data = chemistryData, ylab = "Avg. ARI", xlab = "Post Type", main = "Chemistry")



grid.arrange(complexWordBiology, complexWordChemistry, sentencesBiology, sentencesChemistry, ariBiology, ariChemistry, ncol=3)

















