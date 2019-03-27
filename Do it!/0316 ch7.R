# 0316 ch7 Missing Values 
# 0317

#7-1 결측치 정제하기
#결측치 찾기
df <- data.frame(sex= c("M","F",NA, "M","F"),
                 score= c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))   #sex의 결측치 빈도 출력
table(is.na(df$score)) #score의 결측치 빈도 출력
mean(df$sex)
mean(df$score)

#table(), barplot()
#str(), summary()
table(exam$math) 
table(exam$class)
barplot(table(exam$math))
barplot(table(exam$class))

#결측치 제거하기
library(dplyr)
#결측치 있는 행 제거하기
df %>% filter(is.na(score))  #score 가 NA 인 데이터만 출력
df %>% filter(!is.na(score)) #score 결측치 제거

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
#결측치가 있으면 기본적인 함수처리가 안됨

#여러 변수 동시에 결측치 없는 데이터 추출하기
#filter() 에 & 기호 
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex)) #score, sex 결측치 제거
df_nomiss 

#결측치가 하나라도 있으면 제거하기
#na.omit() 변수를 지정하기 않고 결측치가 있는 행을 한번에 제거
df_nomiss2 <- na.omit(df) #모든 변수에 결측치 없는 데이터 추출
df_nomiss2

#함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm=T) #결측치 제외하고 평균 산출
sum(df$score, na.rm=T)

exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA   #3,8,15행의 math에 NA 할당
exam

exam %>% summarise(mean_math =mean(math))
exam %>% summarise(mean_math =mean(math, na.rm=T))
exam %>% summarise(mean_math =mean(math, na.rm=T),
                   sum_math =sum(math, na.rm=T),
                   median_math =median(math, na.rm=T))
#평균값으로 결측치 대체하기
mean(exam$math, na.rm=T) 
exam$math <- ifelse(is.na(exam$math), 55, exam$math) #결측치가 NA 면 55로 대체
table(is.na(exam$math))
exam
mean(exam$math)


df$score <- ifelse(!is.na(df$score), df$score, mean(df$score, na.rm=T)) #결측치가 있으면 mean으로 대체
df$score

#7-2 이상치 정제하기
outlier <- data.frame(sex= c(1,2,1,3,2,1),
                      score= c(5,4,3,4,2,6))
outlier
#이상치 확인하기
table(outlier$sex) # 1이 3개 2가 2개 3이 하나
#존재할 수 없는 값 3
table(outlier$score)
#존재할 수 없는 값 6

#결측 처리하기
outlier$sex <- ifelse(outlier$sex ==3, NA, outlier$sex)
outlier

outlier$score <- ifelse(outlier$score >5, NA, outlier$score)
outlier

outlier %>% 
  filter(!is.na(sex) & ! is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score= mean(score))

#ifelse 
#continuous data를 factor data 로 변환할 때도 사용


#이상치 제거하기 - 극단적인 값
library('ggplot2')
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
# 1- 아래쪽 극단치 경계, 2- 1사분위수, 3-중앙값, 4- 3사분위수, 5- 위쪽 극단치 경계 12~37 값을 벗어나면 극단치로 분류된다는 것을 알 수 있음
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

?quantile
quantile(mpg$hwy)


#bind vs merge

#left join   -> 
#right join  <- 
#full join   <->

