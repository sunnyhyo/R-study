#0522 ch9
#데이터 탐색 
install.packages("psych")
install.packages("Hmisc")
library(ggplot2)
library(psych)
library(Hmisc)

#기술통계
str(mtcars)
describe(mtcars)
summary(mtcars)
summary(mpg~cyl+hp, data=mtcars)
summary(mpg~cyl+hp, data=mtcars, fun=var)
summary(cyl~mpg+hp, data=mtcars, method="reverse")
summary(mpg~cyl+hp, data=mtcars, method="cross")

plot(iris)
scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

plot(iris$Sepal.Length)
plot(iris$Species)
plot(Species~Sepal.Length, data=iris)
with(iris, {
  plot(Sepal.Length, Sepal.Width, pch=as.numeric(Species))
  legend("topright", legend = levels(iris$Species), pch=1:3) })

install.packages("caret", dependencies = TRUE)
library(caret)
featurePlot(iris[,1:4], iris$Species, "ellipse")

#02전처리 

#정규화
cbind(as.data.frame(scale(iris[1:4])), iris$Species)

#주성분 분석
x<-1:10
y<-x+runif(10,min=-.5, max=.5)
z<-x+y+runif(10,min=-10,max=10)
(data<-data.frame(x,y,z))
pr<-princomp(data)
summary(pr)
pr$scores[,1:2]


#원핫인코딩
(all<-factor(c(paste0(LETTERS, "0"), paste0(LETTERS, "1"))))
(data<-data.frame(lvl=all, value=rnorm(length(all))))
install.packages("randomForest")
library(randomForest)
m<-randomForest(value~lvl, data=data)
(x<-data.frame(lvl=factor(c("A","B","A","A","C")),
               value=c(1,3,2,4,5)))
model.matrix( ~lvl, data=x)[, -1]  

#결측치 처리
iris_na<-iris
iris_na[c(10,20,25,40,32),3]<-NA
iris_na[c(33,100,123),1]<-NA
iris_na[!complete.cases(iris_na),]
iris_na[is.na(iris_na$Sepal.Length),]
mapply(median, iris_na[1:4], na.rm=TRUE)

#install.packages("DMwR")
library(DMwR)
iris_na[!complete.cases(iris_na),]
centralImputation(iris_na[1:4])[
  c(10,20,25,32,33,40,100,123), ]
knnImputation(iris_na[1:4])[c(10,20,25,32,33,40,100,123),]

#변수 선택
library(mlbench)
data(Soybean)
nearZeroVar(Soybean, saveMetrics = TRUE)
nearZeroVar(Soybean)
mySoybean<-Soybean[, -nearZeroVar(Soybean)]

#상관계수 
library(mlbench)
library(caret)
data(Vehicle)
findCorrelation(cor(subset(Vehicle, select=-c(Class))))
cor(subset(Vehicle, select=-c(Class)))[c(3,8,11,7,9,2),c(3,8,11,7,9,2)]
myVehicle<-Vehicle[,-c(3,8,11,7,9,2)]

#