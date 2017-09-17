dataBiology = read.csv("biology.csv", header = TRUE, sep = ";", dec = ",")
dataChemistry = read.csv("chemistry.csv", header = TRUE, sep = ";", dec = ",")

print("Dist Indegree - Biology")
print(summary(dataBiology$indegree))
print("Dist Outdegree - Biology")
print(summary(dataBiology$outdegree))

print("Dist Indegree - Chemistry")
print(summary(dataChemistry$indegree))
print("Dist Outdegree - Chemistry")
print(summary(dataChemistry$outdegree))


