options(warn=-1)

source("../../../functions/Functions.R")

printCorrelation <- function(biologySubset, chemistrySubset, desc) {
  correlation(biologySubset$questions, biologySubset$reputation, paste("Biology User Questions X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$answers, biologySubset$reputation, paste("Biology User Answers X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$comments, biologySubset$reputation, paste("Biology User Comments X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$weightedSum, biologySubset$reputation, paste("Biology User Weighted Sum X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$weightedSum2, biologySubset$reputation, paste("Biology User Weighted Sum 2 X Biology User Reputations", desc, sep = " "))
  
  
  correlation(chemistrySubset$questions, chemistrySubset$reputation, paste("Chemistry User Questions X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$answers, chemistrySubset$reputation, paste("Chemistry User Answers X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$comments, chemistrySubset$reputation, paste("Chemistry User Comments X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$weightedSum, chemistrySubset$reputation, paste("Chemistry User Weighted Sum  X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$weightedSum2, chemistrySubset$reputation, paste("Chemistry User Weighted Sum 2  X Chemistry User Reputations", desc, sep = " "))
}

biologyData = read.csv("../biology.csv", header = TRUE, sep = ";")
chemistryData = read.csv("../chemistry.csv", header = TRUE, sep = ";")
biologyData[, "weightedSum"] = (0.8 * biologyData$answers) + (0.6 * biologyData$comments) 
chemistryData[, "weightedSum"] = (0.8 * chemistryData$answers) + (0.6 * chemistryData$comments) 

biologyData[, "weightedSum2"] = (0.6 * biologyData$answers) + (0.8 * biologyData$comments) 
chemistryData[, "weightedSum2"] = (0.6 * chemistryData$answers) + (0.8 * chemistryData$comments) 

print("Biology Reputation Overview")
print(summary(biologyData$reputation))

print("Chemistry Reputation Overview")
print(summary(chemistryData$reputation))


list = c(1,4)
for (index in list) {
  desc = paste("- Correlation profile", index, sep = " ")
  print(desc)
  biologySubset = subset(biologyData, biologyData$profile_1 == index)
  chemistrySubset = subset(chemistryData, chemistryData$profile_1 == index)
  printCorrelation(biologySubset, chemistrySubset, desc)
}




