library(caret)
library(ggplot2)

data = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")

reputationList = sort(data$reputation)
print(length(reputationList))

limit10 = reputationList[trunc(90*length(reputationList)/100)]
limit15 = reputationList[trunc(85*length(reputationList)/100)]
limit20 = reputationList[trunc(80*length(reputationList)/100)]
#print(limit)

index = 1
while(index <= nrow(data)) {
  row = data[index, ]
  if(row$reputation < limit20) {
    data[index, "class"] = 'Newbie'
  } else if(row$reputation >= limit20 && row$reputation < limit15) {
    data[index, "class"] = 'Junior'
  } else if(row$reputation >= limit15 && row$reputation < limit10) {
    data[index, "class"] = 'Middle'
  } else {
    data[index, "class"] = 'Senior'
  }
  index = index + 1
}


set.seed(825)
trainIndex <- createDataPartition(data$class, p = .7, 
                                  list = FALSE, 
                                  times = 1)
dataTrain <- data[ trainIndex,]
dataTest  <- data[-trainIndex,]

#feature_plot = featurePlot(x=dataTrain[ , c("interactions", "degree", "betweenness")] ,
#              y = dataTrain$class, plot = "pairs")

#plot = qplot(interactions, degree, colour = class,  data =dataTrain) 
#plot2 = qplot(interactions, betweenness, colour = class,  data =dataTrain) 
#plot3 = qplot(interactions, modularity_class, colour = class,  data =dataTrain) 

#print(feature_plot)
#print(plot)
#print(plot2)
#print(plot3)

runModel = TRUE

if(runModel) {
  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10, 
    classProbs = TRUE,
    #summaryFunction = twoClassSummary,
    repeats = 10)  
  
  
  #eccentricity + indegree + outdegree  + page_rank + betweenness + eigenvector
  modelFit <- train(class ~  degree + answers + comments + modularity_class, data = dataTrain, 
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
  
  #saveRDS(modelFit, "gbm2.rds")
#  index = 1
#  while(index <= nrow(data)) {
#    row = data[index, ]
#    predictions <- predict(modelFit, newdata = row)
#    print(predictions[1])
#    index = index + 1
#  }
  
  
}



#u.reputation,
#n.betweenness,
#n.closeness,
#n.eccentricity,
#n.harmonic_closeness,
#n.page_rank,
#n.indegree,
#n.outdegree,
#n.degree,
#n.eigenvector,
#n.modularity_class,
#n.clustering_coefficient,
#n.interactions,
#n.strongly_component,
#n.weakly_component

