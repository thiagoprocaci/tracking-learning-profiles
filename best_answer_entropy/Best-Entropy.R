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
  
  newData <- data.frame(id_user = numeric(0), reputation = integer(0), entropy = numeric(0))
  users = unique(data$userId)
  index = 1
  for(u in users) {
    mysubset = subset(data, data$userId == u)
    newData[index, "id_user"] = u
    newData[index, "reputation"] = as.numeric(unique(mysubset$reputation))
    newData[index, "entropy"] = ( sum(mysubset[, "prob_log"]) ) * -1
    newData[index, "profile_1"] = as.numeric(unique(mysubset$profile_1))
    newData[index, "profile_2"] = as.numeric(unique(mysubset$profile_2))
    index = 1 + index
  }
  return (newData)
}


biologyEntropy = calcEntropy(read.csv("../entropy/biology.csv", header = TRUE, sep = ";", dec = ","))
biologyData = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")

biologyMerged = merge(biologyEntropy, biologyData, by = "id_user", all.x = TRUE)
biologyMerged[, "totalBestAnswer"] = ifelse(is.finite(biologyMerged$totalBestAnswer), biologyMerged$totalBestAnswer, 0)

correlation(biologyMerged$entropy, biologyMerged$totalBestAnswer, "General Correl Biology ")

biologyOutstanding = subset(biologyMerged, biologyMerged$profile_1.x == 4)
biologyOrdinary = subset(biologyMerged, biologyMerged$profile_1.x == 1) 
correlation(biologyOutstanding$entropy, biologyOutstanding$totalBestAnswer, "Outstanding Correl Biology Profile 1")
correlation(biologyOrdinary$entropy, biologyOrdinary$totalBestAnswer, "Ordinary Correl Biology Profile 1")

biologyOutstanding = subset(biologyMerged, biologyMerged$profile_2.x == 4)
biologyOrdinary = subset(biologyMerged, biologyMerged$profile_2.x == 1)

correlation(biologyOutstanding$entropy, biologyOutstanding$totalBestAnswer, "Outstanding Correl Biology Profile 2")
correlation(biologyOrdinary$entropy, biologyOrdinary$totalBestAnswer, "Ordinary Correl Biology Profile 2")


chemistryEntropy = calcEntropy(read.csv("../entropy/chemistry.csv", header = TRUE, sep = ";", dec = ","))
chemistryData = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")

chemistryMerged = merge(chemistryEntropy, chemistryData, by = "id_user", all.x = TRUE)
chemistryMerged[, "totalBestAnswer"] = ifelse(is.finite(chemistryMerged$totalBestAnswer), chemistryMerged$totalBestAnswer, 0)

correlation(chemistryMerged$entropy, chemistryMerged$totalBestAnswer, "General Correl chemistry ")

chemistryOutstanding = subset(chemistryMerged, chemistryMerged$profile_1.x == 4)
chemistryOrdinary = subset(chemistryMerged, chemistryMerged$profile_1.x == 1) 
correlation(chemistryOutstanding$entropy, chemistryOutstanding$totalBestAnswer, "Outstanding Correl chemistry Profile 1")
correlation(chemistryOrdinary$entropy, chemistryOrdinary$totalBestAnswer, "Ordinary Correl chemistry Profile 1")

chemistryOutstanding = subset(chemistryMerged, chemistryMerged$profile_2.x == 4)
chemistryOrdinary = subset(chemistryMerged, chemistryMerged$profile_2.x == 1)

correlation(chemistryOutstanding$entropy, chemistryOutstanding$totalBestAnswer, "Outstanding Correl chemistry Profile 2")
correlation(chemistryOrdinary$entropy, chemistryOrdinary$totalBestAnswer, "Ordinary Correl chemistry Profile 2")

