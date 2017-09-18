library(caret)
library(ggplot2)

data = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
gbmModel <- readRDS("gbm.rds")
gbm2Model <- readRDS("gbm2.rds")
#svnModel <- readRDS("svmLinearWeights.rds")

index = 1
while(index <= nrow(data)) {
  row = data[index, ]
  if(row$profile == 1) {
    data[index, "class"] = 'Junior'
  }
  if(row$profile == 2) {
    data[index, "class"] = 'Junior'
  }
  if(row$profile == 3) {
    data[index, "class"] = 'Junior'
  }
  if(row$profile == 4) {
    data[index, "class"] = 'Senior'
  }
  predictions <- predict(gbmModel, newdata = row)
  data[index, "gbm"] = predictions[1]
  predictions <- predict(gbm2Model, newdata = row)
  data[index, "gbm2Model"] = predictions[1]
  
  index = index + 1
}




set.seed(825)
trainIndex <- createDataPartition(data$class, p = .7, 
                                  list = FALSE, 
                                  times = 1)
dataTrain <- data[ trainIndex,]
dataTest  <- data[-trainIndex,]



runModel = TRUE

if(runModel) {
  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10, 
    classProbs = TRUE,
    summaryFunction = twoClassSummary,
    repeats = 10)  
  
  
  #eccentricity + indegree + outdegree  + page_rank + betweenness + eigenvector
  modelFit <- train(class ~ gbm + gbm2Model + degree + interactions + modularity_class, data = dataTrain, 
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
  

  
}


