options(warn=-1)

source("../functions/Functions.R")

printCorrelation <- function(biologySubset, chemistrySubset, desc) {
  correlation(biologySubset$questions, biologySubset$reputation, paste("Biology User Questions X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$answers, biologySubset$reputation, paste("Biology User Answers X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$comments, biologySubset$reputation, paste("Biology User Comments X Biology User Reputations", desc, sep = " "))
  correlation(biologySubset$weightedSum, biologySubset$reputation, paste("Biology User Weighted Sum X Biology User Reputations", desc, sep = " "))
  
  
  correlation(chemistrySubset$questions, chemistrySubset$reputation, paste("Chemistry User Questions X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$answers, chemistrySubset$reputation, paste("Chemistry User Answers X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$comments, chemistrySubset$reputation, paste("Chemistry User Comments X Chemistry User Reputations", desc, sep = " "))
  correlation(chemistrySubset$weightedSum, chemistrySubset$reputation, paste("Chemistry User Weighted Sum  X Chemistry User Reputations", desc, sep = " "))
}

biologyData = read.csv("reputation_biology_correl.csv", header = TRUE, sep = ";")
chemistryData = read.csv("reputation_chemistry_correl.csv", header = TRUE, sep = ";")
biologyData[, "weightedSum"] = (0.8 * biologyData$answers) + (0.6 * biologyData$comments) 
chemistryData[, "weightedSum"] = (0.8 * chemistryData$answers) + (0.6 * chemistryData$comments) 

print("Biology Reputation Overview")
print(summary(biologyData$reputation))

print("Chemistry Reputation Overview")
print(summary(chemistryData$reputation))

# 2 = below median
# 3 = above median 
# 4 = experts
list = c(1,2,3,4)
for (index in list) {
  desc = paste("- Correlation profile", index, sep = " ")
  print(desc)
  biologySubset = subset(biologyData, biologyData$profile == index)
  chemistrySubset = subset(chemistryData, chemistryData$profile == index)
  printCorrelation(biologySubset, chemistrySubset, desc)
}


biologySubset = subset(biologyData, biologyData$profile == 4)
chemistrySubset = subset(chemistryData, chemistryData$profile == 4)

#super experts

superBiologyExperts = tail(biologySubset, trunc(nrow(biologySubset)/2))
superChemistryExperts = tail(chemistrySubset, trunc(nrow(chemistrySubset)/2))

printCorrelation(superBiologyExperts, superChemistryExperts, "Correlation Super Experts")




