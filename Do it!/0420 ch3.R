#ch3
#3-2 조건문, 반복문

if (TRUE){
  print("TRUE")
  print("hello")
}else{
  print("FALSE")
  print("world")
}

x<-c(1,2,3,4,5)
ifelse(x%%2==0, "even","odd")

for (i in 1:10) {
  print(i)
}

i<-1
while(i<=10){
  print(i)
  i=i+1
  #i<-i+1
  #i+=1 안됨
}

i<-0
while(i<=9){
  i=i+1
  if (i%%2!=0){
    next
  }
  print(i)
}


i<-1
repeat{
  print(i)
  if (i>=10){
    break
  }
  i=i+1
}

#연산
1:5*2+1
x<-c(1,2,3,4,5)
x+1
x<-c(1,2,3,4,5)
x+x
x==x
x==c(1,2,3,5,6)
c(T,T,T)&c(T,F,T)
x<-c(1,2,3,4,5)
sum(x)
mean(x)
median(x)
x<-c(1,2,3,4,5)
ifelse(x%%2==0,"even","odd")
(d<-data.frame(x=c(1,2,3,4,5),
              y=c('a','b','c','d','e')))
d
d[c(TRUE, FALSE,TRUE,FALSE,TRUE),]

d[d$x%%2==0,]


#105page
df<-data.frame(x=1:5,y=seq(2,10,2))
df[3,2]<-NA
df
resid(lm(y~x, data=df, na.action=na.omit))
resid(lm(y~x, data=df, na.action=na.exclude))


