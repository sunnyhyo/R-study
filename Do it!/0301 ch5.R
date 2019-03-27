# 0301 R- study 

is(3) #최소단위는 스칼라 x 벡터 o
class(3)
is('ㅋ')

english <- c(90,80,60,70)
math <- c(50,60,100,20)
df_midterm <- data.frame(english , math)
df_midterm

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

df_midterm <- data.frame(english =c(90,80,60,70),
                         math=c(50,60,100,20),
                         class=c(1,1,2,2))

colnames(df_midterm)
names(df_midterm) <- c('a1','a2','a3') #변수명 바꾸기
df_midterm

p88<- data.frame(product=c('사과','딸기','수박'),
                 price=c(1800,1500,3000),
                 sales=c(24, 38, 13))
p88

mean(p88$price)
mean(p88$sales)

#read.csv(file.choose())   파일 불러오기

install.packages('readxl')
library(readxl)

#csv 쉼표로 구분해서 용량 적게
#rda file r에서 구동되는 파일, 속도나 용량에서 이점이 있음

getwd() #현재위치 파악하기
setwd('c:/easy_r')
df_csv_exam <- read.csv('csv_exam.csv')
df_csv_exam

exam <- read.csv('csv_exam.csv')
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
#행,열 출력
dim(exam)
dim(exam)[1]
dim(exam)[2]

#변수의 속성을 먼저 확인하고 분석시작하기
str(exam)
summary(exam)

is(exam[1])  #열로 표시, dataframe
is(exam$id)  #한줄로 입력, intger
# int 정수 
# data.frame
# numaric
# character

#matrix

is(summary(exam))


#character   : 문자 자체로 가지고있는 것은 charater, 글자 자체에 순서가 없음
#facter   : 글씨는 똑같은데 숫자를 가지고 있는 것은 factor
# ex) '짜장','짬뽕','짜장'
# character -> factor -> integer


#data 결측치를 어떻게 처리하는가? 
df_midterm <- data.frame(english =c(90,80,60,70, NA),
                         math=c(50,60,100,20, NA),
                         class=c(1,1,2,2,NA))
summary(df_midterm)

#5-2 변수명 바꾸기
#ggplot2
install.packages('ggplot2')
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

#dplyr package의 rename function 은 바꾸고 싶은 변수 한가지만 바꿀 수 있음
df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw

install.packages('dplyr')
library(dplyr)
df_new<- df_raw
df_new

df_new<- rename(df_new, v2=var2)
df_new

# colnames 와 차이점 : c벡터에 모든 변수명을 입력해야한다.
colnames(df_new)<- c('v1','v2')
df_new


#5-3 파생변수 만들기
df<- data.frame(var1=c(4,3,8),
                var2=c(2,6,1))
df
df$var_sum <- df$var1+df$var2
df
df$var_mean <- (df$var1 +df$var2)/2
df
mpg$total <- (mpg$cty+mpg$hwy)/2
head(mpg)
mean

#attach
search()   #임시저장소
attach(mpg) #임시저장소에 mpg 올린다
str(year)
str(mpg$year)

# 118 page
mpg$test <- ifelse(mpg$total >= 20, 'pass','fail')
head(mpg)
table(mpg$test)
table(mpg$manufacturer)

#