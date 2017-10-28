library(caret)
library(ggplot2)
library(pROC)

dataGraph = read.csv("biology_graph.csv", header = TRUE, sep = ";", dec = ",")
index = 1
while(index <= nrow(dataGraph)) {
  row = dataGraph[index, ]
  if(row$profile_1 == 4) {
    dataGraph[index, "class"] = 'outstanding'
  } else {
    dataGraph[index, "class"] = 'ordinary'
  }
  index = index + 1
}

dataLanguage = read.csv("biology_language.csv", header = TRUE, sep = ";", dec = ",")
dataLanguageAnswers = subset(dataLanguage, dataLanguage$post_type == "answer")

dataEntropy = read.csv("biology-entropy.csv", header = TRUE, sep = ",", dec = ",")

colnames(dataEntropy)[1] <- "id"

data = merge(dataGraph, dataLanguageAnswers, by = "id", all.x = TRUE)
data = merge(data, dataEntropy,  by = "id", all.x = TRUE )


data[, "entropy"] = ifelse(is.na(data$entropy),  0, data$entropy)
data[, "complexWordsTextAvg"] = ifelse(is.finite(data$complexWordsTextAvg), data$complexWordsTextAvg, 0)


set.seed(825)
trainIndex <- createDataPartition(data$class, p = .6, 
                                  list = FALSE, 
                                  times = 1)
dataTrain <- data[ trainIndex,]
dataTest  <- data[-trainIndex,]



runModel = TRUE

if(runModel) {
  fitControl <- trainControl(## 5-fold CV
    method = "repeatedcv",
    number = 5, 
    classProbs = TRUE,
    summaryFunction = twoClassSummary,
    repeats = 10)  
  
  
  #eccentricity + indegree + outdegree  + page_rank + betweenness + eigenvector
  modelFit <- train(class ~  entropy + indegree + page_rank + outdegree + answers + comments + betweenness + complexWordsTextAvg, data = dataTrain, 
                    method = "gbm",  
                    trControl = fitControl,
                    #tuneGrid = grid,
                    metric = "ROC",
                    verbose = FALSE)
  print(modelFit)
  
  print("Prediction")
  predictions <- predict(modelFit, newdata = dataTest)
  
  cm = confusionMatrix(predictions, dataTest$class)
  
  print(cm)
  
  precision <- cm$byClass['Pos Pred Value']    
  recall <- cm$byClass['Sensitivity']
  
  print("F-measure")
  fmeasure = (2 * precision * recall)/(precision + recall)
  print(fmeasure)
  

  
  trellis.par.set(caretTheme())
  print(plot(modelFit, metric = "ROC"))
  
  print(plot(modelFit, metric = "ROC", plotType = "level",
             scales = list(x = list(rot = 90))))
  

  predictions <- predict(modelFit, newdata = dataTest, type = "prob")
  r = roc(dataTest$class, predictions[[2]])
  print(r$auc)
  
  
}





