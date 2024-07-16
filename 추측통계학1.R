options(digits=5)
cor <- c(0.4196, 0.4172, 0.4237, 0.4182, 0.4324, 0.4365, 0.4354, 0.4156, 0.4172, 0.4414)


m<-mean(cor)

dev<- cor-m
dev

dev^2

denom<-length(cor)

denom2<-length(cor)-1


num<-sum(dev^2)


var.p<-num/denom

(var.p<-num/denom)

(var.s<-num/denom2)

var(cor)



two_f<-function(x){
  return (2*x)
}

is(two_f)

two_f(3)



user_defined_var<-function(x){
  
  n<-length(x)
  m<-mean(x)
  bunja<-sum((x-m)^2)
  bunmo<-n
  
  var_final<-bunja/bunmo
  return (var_final)
  
}


is(user_defined_var)


user_defined_var(cor)


mean_seq<-function(x){
  n<-length(x)
  sum<-0
  n2<-0
  for( i in 1:n  ){
    newx<-i*x[i]
    sum <- sum + newx
    n2 <- n2+i
  }
  return (sum/n2)
}

test<-c(1:10)

test

#n은 10
# newx 1*1, 

mean_seq(test)


rnorm(3)


y1<-rep(NA,1000)
y1

y2<-rep(NA,1000)

y2


mean(rnorm(3))

mean(rnorm(100000))

mean(rnorm(1000000000))



for(i in 1:1000){
  smp<-rnorm(3)
  y1[i]<-mean(smp)
  y2[i]<-mean_seq(smp)
}

y1

y2



n1<-length(y1[(y1 > -0.1 ) & (y1 < 0.1 )])



n2<-length(y2[(y2 > -0.1 ) & (y2 < 0.1 )])

n1
n2


summary(iris)






install.packages("psych")
library(psych)


?psych


psych::describe(iris)

psych::describeBy(iris)





library(datasets)



datasets::dia

ggplot2::diamonds

library(ggplot2)

?diamonds



str(diamonds)

summary(diamonds$cut)



str(diamonds$cut)

unique(diamonds$cut)


?is.na

length(diamonds$cut)

length(na.omit(diamonds$cut))


range(diamonds$cut)

?frequency
freq(diamonds$cut, display.na=FALSE)



install.packages("descr")
library(descr)

freq(diamonds$cut,display.na=FALSE)
freq(diamonds$cut,display.na=TRUE)

?freq

cars

is.na(cars)

na.omit(cars)


reshape2::melt()

reshape2::cast()

install.packages("mx")

str(cars)


str(mtcars)

mtcars["mpg"]

is(mtcars["mpg"])


mtcars[["mpg"]]






getwd()


setwd('C:/Ex/data')

getwd()




toeic_mean<-500

std_error<-100

#신뢰도 90%(z값이 1.64)

500-(100*1.64)

500+(100*1.64)

#신뢰도 95%(z값이 1.96)

500-(100*1.96)

500+(100*1.96)

#신뢰도 99%(z값이 2.58)

500-(100*2.58)

500+(100*2.58)









?pnorm()

?t
?dt

qt(0.975, 11)

?norm

?runif

duhagi<-function(a,b){
  return (a+b)
}


duhagi
is(duhagi)

duhagi(4,5)



rm(list=ls())




set.seed(9)


n<-10

x<-1:100
y<-seq(-3,3,by=0.01)
length(y)



matrix(1:12, nrow = 2)
matrix(1:12, ncol = 2)

n*length(y)

smps<-matrix(rnorm(n*length(y)),ncol = n)

View(smps)

?apply(smps)

xbar<-apply(smps,1, mean)

xbar

n

se<- 1/sqrt(10)

se

alpha<-0.05

z<- qnorm(1- alpha/2)

z

ll <- xbar - z*se

ul<- xbar + z*se


?plot

plot(y, type = "n", xlab="표본추출", ylab="z", xlim=c(1, 100), ylim=c(-1.5, 1.5), cex.lab=1.8 )


?abline


abline(h=0, col="red", lwd=2, lty=2)
x

l.c <- rep(NA, length(x))

l.c
ll
ul

l.c <- ifelse( ll * ul > 0, "red", "black")

?arrows

arrows( 1:length(x), ll, 1:length(x), ul, code=3, angle=90,length=0.02, col=l.c, lwd=1.5 )

