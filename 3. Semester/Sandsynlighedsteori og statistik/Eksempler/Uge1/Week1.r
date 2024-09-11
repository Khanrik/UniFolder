data = read.table("gaet2024_raa.csv", header=TRUE, sep=";")
minimum = min(data$Gaet)
maximum = max(data$Gaet)
medianen = median(data$Gaet)
middel = mean(data$Gaet)

barplot(data$Gaet)
stripchart(data$Gaet)
hist(data$Gaet)
    