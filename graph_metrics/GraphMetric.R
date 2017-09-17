options(warn=-1)

source("../functions/Functions.R")



biologyData = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
chemistryData = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")

index = 1

while(index <= 4) {

  mysub = subset(biologyData, biologyData$profile == index)
  
  correlation(mysub$indegree, mysub$reputation, paste("Biology Correl - Indegree vs Reputation  - Profile ", index))
  correlation(mysub$outdegree, mysub$reputation, paste("Biology Correl - Outdegree vs Reputation  - Profile ", index))
  correlation(mysub$degree, mysub$reputation, paste("Biology Correl - Degree vs Reputation  - Profile ", index))
  correlation(mysub$betweenness, mysub$reputation, paste("Biology Correl - Betweenness vs Reputation  - Profile ", index))
  correlation(mysub$closeness, mysub$reputation, paste("Biology Correl - Closeness vs Reputation  - Profile ", index))
  correlation(mysub$eccentricity, mysub$reputation, paste("Biology Correl - Ecentricity vs Reputation  - Profile ", index))
  correlation(mysub$harmonic_closeness, mysub$reputation, paste("Biology Correl - Harmonic closeness vs Reputation  - Profile ", index))
  correlation(mysub$page_rank, mysub$reputation, paste("Biology Correl - Page rank vs Reputation  - Profile ", index))
  correlation(mysub$eigenvector, mysub$reputation, paste("Biology Correl - Eigenvector vs Reputation  - Profile ", index))
  correlation(mysub$clustering_coefficient, mysub$reputation, paste("Biology Correl - Clustering coefficient vs Reputation  - Profile ", index))
  correlation(mysub$interactions, mysub$reputation, paste("Biology Correl - Interactions vs Reputation  - Profile ", index))
  
  
  mysub = subset(chemistryData, chemistryData$profile == index)
  
  correlation(mysub$indegree, mysub$reputation, paste("Chemistry Correl - Indegree vs Reputation  - Profile ", index))
  correlation(mysub$outdegree, mysub$reputation, paste("Chemistry Correl - Outdegree vs Reputation  - Profile ", index))
  correlation(mysub$degree, mysub$reputation, paste("Chemistry Correl - Degree vs Reputation  - Profile ", index))
  correlation(mysub$betweenness, mysub$reputation, paste("Chemistry Correl - Betweenness vs Reputation  - Profile ", index))
  correlation(mysub$closeness, mysub$reputation, paste("Chemistry Correl - Closeness vs Reputation  - Profile ", index))
  correlation(mysub$eccentricity, mysub$reputation, paste("Chemistry Correl - Ecentricity vs Reputation  - Profile ", index))
  correlation(mysub$harmonic_closeness, mysub$reputation, paste("Chemistry Correl - Harmonic closeness vs Reputation  - Profile ", index))
  correlation(mysub$page_rank, mysub$reputation, paste("Chemistry Correl - Page rank vs Reputation  - Profile ", index))
  correlation(mysub$eigenvector, mysub$reputation, paste("Chemistry Correl - Eigenvector vs Reputation  - Profile ", index))
  correlation(mysub$clustering_coefficient, mysub$reputation, paste("Chemistry Correl - Clustering coefficient vs Reputation  - Profile ", index))
  correlation(mysub$interactions, mysub$reputation, paste("Chemistry Correl - Interactions vs Reputation  - Profile ", index))
  
  index = 1 + index
}