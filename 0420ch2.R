#ch2 데이터 타입

#2-1 변수
#2-2 함수 호출 시 인자 지정
#2-3 스칼라

#숫자
a<-3
b<-4.5
c<-a+b
print(c)
c
#NA
#NA는 데이터 값이 없음
#결측치, 즉 값이 빠져있는 경우
one<-80
two<-90
three<-75
four<-NA 
is.na(four)
#four에 NA가 저장되어 있음을 확인하는 코드

#NULL
#NULL은 객체, 변수가 초기화되지 않았을 때 사용
#프로그래민의 편의를 위해 미정 undefined 값을 표현
x<-NULL
four<-NULL
is.null(x)
is.null(1)
is.null(na)

x<-c(1,2,3,4)
x
x[1]<-NA
x
x<-NULL
x



#문자열
a<-'hello'
print(a)
a<-"hello"
print(a)

#진리값

#팩터 Factor
#범주형 데이터 표현 - 명목형, 순서형
#명목형- 데이터 값들 간에 크기 비교가 불가능한 경우
#순서형- 대, 중, 소 같이 값에 순서를 둘 수 있는 경우
#수치형 Numerical
#값을 측정하거나 개수를 세는 경우와 같이 숫자로 나온 값 의미

sex<-factor("m",c("m","f"))
sex
nlevels(sex)
levels(sex)
levels(sex)[1]
levels(sex)[2]
sex
levels(sex)<-c("male","female")
sex
factor(c('m','m','f','m','m','f','f','f','f','g'),c('m','f'))
factor(c('m','m','f','m','m','f','f','f','f','g'))

ordered('a',c('a','b','c'))
factor('a',c('a','b','c'),ordered = TRUE)


#벡터 Vector
