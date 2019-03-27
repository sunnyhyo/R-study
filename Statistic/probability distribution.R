#http://zoonek2.free.fr/UNIX/48_R/07.html
#Poisson distribution

N <- 10000
x <- rpois(N,1)
hist(x, xlim=c(min(x), max(x)), probability = T, nclass = max(x)- min(x)-1,
     col = 'lightblue', main ="Poission distrution, labda=1")
lines(density(x, bw=1), col= "red", lwd=3)
