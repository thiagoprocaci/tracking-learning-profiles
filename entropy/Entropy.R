source("../functions/Functions.R") 

calcEntropy <- function(data) {
  index = 1
  while(index <= nrow(data)) {
    row = data[index, ]
    mysubset = subset(data, data$userId == row$userId)
    data[index, "prob"] = row$totalPost/sum(mysubset$totalPost)
    data[index, "prob_log"] = data[index, "prob"] * log2(data[index, "prob"])
    index = index + 1
  }
  
  newData <- data.frame(user = numeric(0), reputation = integer(0), entropy = numeric(0))
  users = unique(data$userId)
  index = 1
  for(u in users) {
    mysubset = subset(data, data$userId == u)
    newData[index, "user"] = u
    newData[index, "reputation"] = as.numeric(unique(mysubset$reputation))
    newData[index, "entropy"] = ( sum(mysubset[, "prob_log"]) ) * -1
    newData[index, "profile_1"] = as.numeric(unique(mysubset$profile_1))
    newData[index, "profile_2"] = as.numeric(unique(mysubset$profile_2))
    index = 1 + index
  }
  return (newData)
}


biologyData = calcEntropy(read.csv("biology.csv", header = TRUE, sep = ";", dec = ","))
chemistryData = calcEntropy(read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ","))


correlation(biologyData$entropy, biologyData$reputation, "General Correl Biology ")

biologyOutstanding = subset(biologyData, biologyData$profile_1 == 4)
biologyOrdinary = subset(biologyData, biologyData$profile_1 == 1) 
correlation(biologyOutstanding$entropy, biologyOutstanding$reputation, "Outstanding Correl Biology Profile 1")
correlation(biologyOrdinary$entropy, biologyOrdinary$reputation, "Ordinary Correl Biology Profile 1")
 
biologyOutstanding = subset(biologyData, biologyData$profile_2 == 4)
biologyOrdinary = subset(biologyData, biologyData$profile_2 == 1)

correlation(biologyOutstanding$entropy, biologyOutstanding$reputation, "Outstanding Correl Biology Profile 2")
correlation(biologyOrdinary$entropy, biologyOrdinary$reputation, "Ordinary Correl Biology Profile 2")


correlation(chemistryData$entropy, chemistryData$reputation, "General Correl Chemistry ")

chemistryOutstanding = subset(chemistryData, chemistryData$profile_1 == 4)
chemistryOrdinary = subset(chemistryData, chemistryData$profile_1 == 1) 
correlation(chemistryOutstanding$entropy, chemistryOutstanding$reputation, "Outstanding Correl Chemistry Profile 1")
correlation(chemistryOrdinary$entropy, chemistryOrdinary$reputation, "Ordinary Correl Chemistry Profile 1")

chemistryOutstanding = subset(chemistryData, biologyData$profile_2 == 4)
chemistryOrdinary = subset(chemistryData, biologyData$profile_2 == 1)

correlation(chemistryOutstanding$entropy, chemistryOutstanding$reputation, "Outstanding Correl Chemistry Profile 2")
correlation(chemistryOrdinary$entropy, chemistryOrdinary$reputation, "Ordinary Correl Chemistry Profile 2")



#write.csv(biologyData, file = "biology-entropy.csv", sep = ",",  row.names=FALSE)
#write.csv(chemistryData, file = "chemistry-entropy.csv", sep = ",",  row.names=FALSE)