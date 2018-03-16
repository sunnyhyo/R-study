# 0316 ch6 Data preprocessing
library('dplyr')
getwd()
setwd("C:/easy_r")
exam <- read.csv("csv_exam.csv")
exam

#6-1 조건에 맞는 데이터만 추출하기
exam %>% filter(class==1)
# exam 에서 class 변수 값이 1 인 행만 추출
exam %>% filter(class==2)
exam %>% filter(class!=1)
exam %>% filter(class!=3)

#초과, 미만, 이상, 이하 조건 달기
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

#여러 조건을 충족하는 행 추출하기
#1반이면서 수학 점수가 50점 이상인 경우
exam %>%  filter(class==1 & math >50)  # and 안됨
#2반이면서 영어 점수가 80점 이상인 경우
exam %>%  filter(class==1 & english >=80)

#여러 조건 중 하나 이상 충족하는 행 추출하기
#수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>%  filter(math >= 90 | english >=90)
#영어 점수가 90점 미만이거나 과학 점수가 50 점 미만인 경우
exam %>%  filter(english < 90 | science < 50)

#목록에 해당하는 행 추출하기
# 1,3,5 반에 해당하면 추출
exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5) )  # %in% , c() 활용

#추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

#6-3 필요한 변수만 추출하기 
#변수 추출하기
exam %>%  select(math)
exam %>%  select(english)
exam %>%  select(class, math, english)
exam %>%  select(-math)
exam %>%  select(-math, -english)

#dplyr 함수 조합하기
#filter(), select() 조합
#class 가 1인 행만 추출한 다음 english 추출
exam %>% 
  filter(class==1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)

#6-4 순서대로 정렬하기
#오름차순으로 정렬하기
exam %>% arrange(math)
#내림차순으로 정렬하기
exam %>% arrange(desc(math))
exam %>% arrange(class, math)
#먼저 반을 기준으로 오름차순 정렬한 후 각 반에서 
#수학 점수를 기준으로 오름차순 정렬해서 출력

#6-5 파생변수 추가하기
#파생변수 추가하기
exam %>% 
  mutate(total = math +english + science) %>% 
  head

exam %>% 
  mutate(total = math +english +science,
         mean = (math + english +science)/3 ) %>%
  head

exam %>% 
  mutate(test = ifelse(science >= 60, 'pass', 'fail')) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

#6-6 집단별로 요약하기
#집단별로 요약하기
exam %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>%  
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n=n())   # 데이터가 몇 행으로 되어 있는지 빈도 구함
#각 집단별로 다시 집단 나누기
library('ggplot2')
mpg %>% 
  group_by(manufacturer, drv) %>%  #회사별,구동 방식별 분리 
  summarise(mean_cty = mean(cty)) %>%  #cty 평균 산출
  head(10)
#회사별로 'suv'자동차의 도시 및 고속도로 통합 연비 평균을 구해 
#내림차순으로 정렬하고, 1-5 위 까지 출력하기
mpg %>% 
  group_by(manufacturer) %>%   #회사별로 분리
  filter(class=='suv') %>%     #suv 추출
  mutate(tot = (cty+hwy)/ 2) %>%        #통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%   #통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%   #내림차순 정렬
  head(5)  #1-5위 까지 출력

#6-7 데이터 합치기
#가로로 합치기
#중간고사, 기말고사 데이터 생성
test1 <- data.frame(id = c(1,2,3,4,5), 
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2

#dplyr package, left_join(), 기준 변수 by=""
#특정 변수의 값을 기준으로 다른 데이터의 값을 추가할 수 있음
total <- left_join(test1, test2, by='id')  
total

name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c('kim','lee','park','choi','jung'))
name

exam_new <- left_join(exam, name , by='class')
exam_new

#세로로 합치기
#학생, 시험점수 데이터 생성
group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))
group_a
group_b

#bind_rows()
#두 데이터의 변수 명이 같아야 세로로 합칠 수 있음
#변수 명이 다르면 rename() 이용해 변수명 통일
group_all <- bind_rows(group_a, group_b)
group_all
