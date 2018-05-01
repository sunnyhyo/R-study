iris
plot(iris)
install.packages("mlbench")
library(mlbench)
data(Ozone)
plot(Ozone$V8, Ozone$V9)

plot(cars, type='l')
tapply(cars$dist, cars$speed, mean)
plot(tapply(cars$dist, cars$speed, mean),type='o',cex=0.5,xlab='speed', ylab='dist')


