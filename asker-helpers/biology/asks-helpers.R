data = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")

askers = subset(data, data$pattern == 'askers')$total
helpers = subset(data, data$pattern == 'helpers')$total
askersHelpers = subset(data, data$pattern == 'askers-helpers')$total
all = subset(data, data$pattern == 'all')$total

print("Askers")
print(askers * 100/all)

print("Helpers")
print(helpers * 100/all)

print("askers Helpers")
print(askersHelpers * 100/all)