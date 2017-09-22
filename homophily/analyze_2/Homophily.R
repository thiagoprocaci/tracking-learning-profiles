 calcDesc <- function(data) {
   index = 1
   while(index <= nrow(data)) {
     row = data[index,]
     if(row$profileUserSource == 1 && row$profileUserDest == 1) {
       data[index, "description"] = "Only Ordinary"
       data[index, "desc"] = "1_1"
     }
     if(row$profileUserSource == 4 && row$profileUserDest == 4) {
       data[index, "description"] = "Only Outstanding"
       data[index, "desc"] = "4_4"
    }
     if(row$profileUserSource == 1 && row$profileUserDest == 4) {
       data[index, "description"] = "Outstanding Helping Ordinary"
       data[index, "desc"] = "1_4"
     }
     if(row$profileUserSource == 4 && row$profileUserDest == 1) {
       data[index, "description"] = "Ordinary Helping Outstanding"
       data[index, "desc"] = "4_1" 
    }
     index = 1+ index
     
   }
   return (data)
 }


dataBiology = calcDesc(read.csv("biology.csv", header = TRUE, sep = ";", dec = ","))
dataChemistry = calcDesc(read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ","))

library(ggplot2)

bioPlot = ggplot(data=dataBiology,
                        aes(x = period, y = total, colour = description)) +
  xlab("Time Slice - Biology") + ylab("Total of Unique Interaction") +
  geom_point()

print(bioPlot)


chemistryPlot = ggplot(data=dataChemistry,
                 aes(x = period, y = total, colour = description)) +
  xlab("Time Slice - Chemistry") + ylab("Total of Unique Interaction") +
  geom_point()

print(chemistryPlot)


source("../../functions/Functions.R")

#existsDiff(subset(dataBiology, dataBiology$desc == "4_1")$total, subset(dataBiology, dataBiology$desc == "1_1")$total, "")





