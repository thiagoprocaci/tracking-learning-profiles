options(warn=-1)
source("../functions/Functions.R")

biologyData = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
chemistryData = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")

outstandBio1 = subset(biologyData, biologyData$profile_1 == 4)
ordBio1 = subset(biologyData, biologyData$profile_1 == 1)

existsDiff(outstandBio1$betweenness, ordBio1$betweenness, "Bio Diff betweenness outstd. x ord. - 1")
existsDiff(outstandBio1$indegree, ordBio1$indegree, "Bio Diff indegree outstd. x ord. - 1")
existsDiff(outstandBio1$outdegree, ordBio1$outdegree, "Bio Diff outdegree outstd. x ord. - 1")
existsDiff(outstandBio1$page_rank, ordBio1$page_rank, "Bio Diff page_rank outstd. x ord. - 1")
existsDiff(outstandBio1$eigenvector, ordBio1$eigenvector, "Bio Diff eigenvector outstd. x ord. - 1")
existsDiff(outstandBio1$clustering_coefficient, ordBio1$clustering_coefficient, "Bio Diff clustering_coefficient outstd. x ord. - 1")

outstandBio2 = subset(biologyData, biologyData$profile_2 == 4)
ordBio2 = subset(biologyData, biologyData$profile_2 == 1)

existsDiff(outstandBio2$betweenness, ordBio2$betweenness, "Bio Diff betweenness outstd. x ord. - 2")
existsDiff(outstandBio2$indegree, ordBio2$indegree, "Bio Diff indegree outstd. x ord. - 2")
existsDiff(outstandBio2$outdegree, ordBio2$outdegree, "Bio Diff outdegree outstd. x ord. - 2")
existsDiff(outstandBio2$page_rank, ordBio2$page_rank, "Bio Diff page_rank outstd. x ord. - 2")
existsDiff(outstandBio2$eigenvector, ordBio2$eigenvector, "Bio Diff eigenvector outstd. x ord. - 2")
existsDiff(outstandBio2$clustering_coefficient, ordBio2$clustering_coefficient, "Bio Diff clustering_coefficient outstd. x ord. - 2")



outstandChemistry1 = subset(chemistryData, chemistryData$profile_1 == 4)
ordChemistry1 = subset(chemistryData, chemistryData$profile_1 == 1)

existsDiff(outstandChemistry1$betweenness, ordChemistry1$betweenness, "Chemistry Diff betweenness outstd. x ord. - 1")
existsDiff(outstandChemistry1$indegree, ordChemistry1$indegree, "Chemistry Diff indegree outstd. x ord. - 1")
existsDiff(outstandChemistry1$outdegree, ordChemistry1$outdegree, "Chemistry Diff outdegree outstd. x ord. - 1")
existsDiff(outstandChemistry1$page_rank, ordChemistry1$page_rank, "Chemistry Diff page_rank outstd. x ord. - 1")
existsDiff(outstandChemistry1$eigenvector, ordChemistry1$eigenvector, "Chemistry Diff eigenvector outstd. x ord. - 1")
existsDiff(outstandChemistry1$clustering_coefficient, ordChemistry1$clustering_coefficient, "Chemistry Diff clustering_coefficient outstd. x ord. - 1")

outstandChemistry2 = subset(chemistryData, chemistryData$profile_2 == 4)
ordChemistry2 = subset(chemistryData, chemistryData$profile_2 == 1)

existsDiff(outstandChemistry2$betweenness, ordChemistry2$betweenness, "Chemistry Diff betweenness outstd. x ord. - 2")
existsDiff(outstandChemistry2$indegree, ordChemistry2$indegree, "Chemistry Diff indegree outstd. x ord. - 2")
existsDiff(outstandChemistry2$outdegree, ordChemistry2$outdegree, "Chemistry Diff outdegree outstd. x ord. - 2")
existsDiff(outstandChemistry2$page_rank, ordChemistry2$page_rank, "Chemistry Diff page_rank outstd. x ord. - 2")
existsDiff(outstandChemistry2$eigenvector, ordChemistry2$eigenvector, "Chemistry Diff eigenvector outstd. x ord. - 2")
existsDiff(outstandChemistry2$clustering_coefficient, ordChemistry2$clustering_coefficient, "Bio Diff clustering_coefficient outstd. x ord. - 2")


