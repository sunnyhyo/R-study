fibo<-function(n){
  if (n==1||n==2){
    return(3)
  }
  return(fibo(n-1)+fibo(n-2))
}

fibo(1)
fibo(5)
#1 1 2 3 5
#2 2 4 6 10

f<- function(x1){
  return(function(x2){
    return(x1+x2)
  })
}

f(1)
g<-f(1)  
g  
g(2)


