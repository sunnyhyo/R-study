#ch8

data(cars)
head(cars)
(m<-lm(dist~speed, cars))
coef(m)
fitted(m)[1:4]
residuals(m)[1:4]
fitted(m)[1:4]+residuals(m)[1:4]
cars$dist[1:4]

confint(m)
deviance(m)  #SSE
#예측과 신뢰구간
(m<-lm(dist~speed, data=cars))
predict(m,newdata=data.frame(speed=3))
coef(m)
predict(m,newdata=data.frame(speed=c(3)), interval='confidence')
predict(m,newdata=data.frame(speed=c(3)), interval='prediction')
#모델평가
summary(m)


#분산분석 및 모델 간의 비교
anova(m)
(full<-lm(dist~speed,data=cars))
(reduced<-lm(dist~1, data=cars))
anova(reduced,full)


data(Orange)
Orange
with(Orange,plot(Tree,circumference, xlab="tree",ylab="circumference"))
with(Orange, interaction.plot(age,Tree,circumference))
Orange[,"fTree"]<-factor(Orange[,"Tree"], ordered=FALSE)
m<-lm(circumference ~fTree*age, data=Orange)
anova(m)
head(model.matrix(m))
mm<-model.matrix(m)
mm[,grep("age", colnames(mm))]


data(Orange)
m<-lm(circumference~age+ I(age^2), data=Orange)
rstudent(m)

Orange<-rbind(Orange, data.frame(Tree=as.factor(c(6,6,6)),
                                 age=c(118,484,664),
                                 circumference=c(177,50,30)))
tail(Orange)
car::outlierTest()
outlierTest(m)
install.packages("car")
car

plot(m)



summary(iris)
m<-lm(Sepal.Length~.,data=iris)
summary(m)
model.matrix(m)[c(1,51,101),]
2**2
2^2
data(Orange)
Orange[,"fTree"]<-factor(Orange[,"Tree"], ordered=FALSE)
m<-lm(circumference~fTree*age,data=Orange)
model.matrix(m)
library(car)

tail(Orange)




