discussion <- read.csv(file = "biology.csv", header = TRUE, sep = ";", dec = ",", row.names = NULL)
user = read.csv(file = "biology_outstanding.csv", header = TRUE, sep = ";")

#graphData[, "indegree"] <- ifelse(graphData$indegree == "\\N", 0, graphData$indegree)
#graphData[, "outdegree"] <- ifelse(graphData$outdegree == "\\N", 0, graphData$outdegree)
#graphData[, "pagerank"] <- ifelse(graphData$pagerank == "\\N", 0, graphData$pagerank)
#graphData[, "eccentricity"] <- ifelse(graphData$eccentricity == "\\N", 0, graphData$eccentricity)
#graphData[, "closeness"] <- ifelse(graphData$closeness == "\\N", 0, graphData$closeness)
#graphData[, "betweeness"] <- ifelse(graphData$betweeness == "\\N", 0, graphData$betweeness)
#graphData[, "eigenvector"] <- ifelse(graphData$eigenvector == "\\N", 0, graphData$eigenvector)


discussion[ , "goodDiscussion"] <- ifelse(graphData$finished  == 1, 'yes', 'no')

good = subset(discussion, discussion$goodDiscussion == 'yes')
bad = subset(discussion, discussion$goodDiscussion == 'no')

discussion = merge(discussion, user, by = "questionId")

#print(summary(good$avgIndegree))
#print(summary(bad$avgIndegree))


runModel = TRUE

if(runModel) {
  library(caret)
  set.seed(825)
  trainIndex <- createDataPartition(discussion$goodDiscussion, p = .6, 
                                    list = FALSE, 
                                    times = 1)
  dataTrain <- discussion[ trainIndex,]
  dataTest  <- discussion[-trainIndex,]
  
  grid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                       n.trees = (1:30)*50, 
                       shrinkage = 0.1,
                       n.minobsinnode = 20)
  
  
  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10 ,
    classProbs = TRUE,
    repeats = 10,
    summaryFunction = twoClassSummary)  
  
  
  modelFit <- train(goodDiscussion ~ outstanding + avgIndegree + avgOutdegree + avgBetweenness + avgEigenvector + avgPagerank, data = dataTrain, 
                    method = "gbm",  
                    trControl = fitControl,
                    #tuneGrid = grid,
                    metric = "ROC",
                    verbose = FALSE)
  print(modelFit)
  
  print("Prediction")
  predictions <- predict(modelFit, newdata = dataTest)
  
  cm = confusionMatrix(predictions, dataTest$goodDiscussion)
  
  print(cm)
  
  trellis.par.set(caretTheme())
  print(plot(modelFit, metric = "ROC"))
  
  print(plot(modelFit, metric = "ROC", plotType = "level",
             scales = list(x = list(rot = 90))))
}
