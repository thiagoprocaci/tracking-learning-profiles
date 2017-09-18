library(caret)
library(ggplot2)

data = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
index = 1
while(index <= nrow(data)) {
  row = data[index, ]
  if(row$profile == 1) {
    data[index, "class"] = 'Newbie'
  }
  if(row$profile == 2) {
    data[index, "class"] = 'Junior'
  }
  if(row$profile == 3) {
    data[index, "class"] = 'Middle'
  }
  if(row$profile == 4) {
    data[index, "class"] = 'Senior'
  }
  index = index + 1
}


set.seed(825)
trainIndex <- createDataPartition(data$class, p = .6, 
                                  list = FALSE, 
                                  times = 1)
dataTrain <- data[ trainIndex,]
dataTest  <- data[-trainIndex,]

feature_plot = featurePlot(x=dataTrain[ , c("interactions", "degree", "betweenness")] ,
              y = dataTrain$class, plot = "pairs")

plot = qplot(interactions, degree, colour = class,  data =dataTrain) 
plot2 = qplot(interactions, betweenness, colour = class,  data =dataTrain) 
plot3 = qplot(interactions, modularity_class, colour = class,  data =dataTrain) 

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
    repeats = 10)  
  
  
  modelFit <- train(class ~  indegree + outdegree  + page_rank + betweenness + eigenvector, data = dataTrain, 
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

