
?factor()

print("hi");print("hello")


a<-4
a<-6

b<-a



for(i in 1:5){
  print(i)
}


TRUE & TRUE
TRUE && TRUE
TRUE && FALSE
FALSE && TRUE
FALSE && FALSE

TRUE | TRUE
TRUE || TRUE
TRUE | FALSE
FALSE || TRUE

FALSE | FALSE
FALSE || FALSE

?NULL
?NA
is.na(NA)

?NaN

?Inf
-Inf



x1<-FALSE
mode(x1)

is(x1)


data.frame()


c(1:10)


matrix(c(1:10))
m<-matrix(c(1:10))
m[1,1]
m[1,]
m[5,]

m2<-matrix(c(1:10), nrow = 2)
m2[2,3]

matrix(c(1:10), ncol = 2)



m3<-matrix(c(1:10), ncol = 2,byrow = TRUE)


m3*2
m3/2
log(m3)


array(1:10)
?array

array(1:10, dim = c(2,5))

array(1:10, dim = c(5,2))

array(1:12, dim = c(2,2,3))
      
array(1:12, dim = c(3,2,2))
arr<-array(1:12, dim = c(3,2,2))

arr[2,1,2]       


?aperm

aperm(array(1:8, dim=c(2,2,2)), perm=c(2,1,3))



list(irum='hong')

li<-list(irum='hong')

is(li)

li2<-list(irum='hong', sung='man')

li2

li2$irum

li2$sung

li4<-list(num=c(1,2,3,4,5))

li4

li5<-list(num=c(1,2,3,4,5),mun=c('a','b','c'))

is(li5$num)
is(li5$mun)


list(arr)

li_arr<-list(arr)


li_li<-list(first=list(c(1,2,3)),second=list(c(1,2,3)))

li_li$first
is(li_li$first)
class(li_li$first)
li_li[1]



plot(c(1,2,3),c(1,2,3),xlab = "x",ylab="y",main="산점도")

plot(c(1,2,3),c(4,5,6),xlab = "x",ylab="y",main="산점도")

cor(c(1,2,3),c(4,5,6))


ggplot2::diamonds


library(ggplot2)
?diamonds

str(diamonds)

diamonds$price

length(diamonds$price)

hist(diamonds$price)

#head(sort(table(diamonds$price),decreasing = TRUE))

hist(diamonds$price, breaks = seq(0,20000,5000))

seq(0,20000,5000)

boxplot(diamonds$price)


?boxplot


boxplot(diamonds$price ~ diamonds$cut)


datasets::iris
library(datasets)
iris

str(iris)

summary(iris)


barplot(table(iris$Species))

prop.table(table(iris$Species))


round(prop.table(table(iris$Species)),2)


summary(iris[1:4])

boxplot(iris[1:4], range = 3)



?par()
?par()


par(mfrow=c(2,2))

colnames(iris)


boxplot(Sepal.Length  ~ Species , data=iris, main="Sepal.Length")
boxplot(Sepal.Width  ~ Species , data=iris, main="Sepal.Width")
boxplot(Petal.Length  ~ Species , data=iris, main="Petal.Length")
boxplot(Petal.Width  ~ Species , data=iris, main="Petal.Width")


par(mfrow=c(1,1))
boxplot(Sepal.Length  ~ Species , data=iris, main="Sepal.Length")


pairs(iris[1:4])
cor(iris[1:4])

study_time<-c(3,5,7,9,11)
score<-c(50,60,85,83,90)

plot(study_time,score)

cor(study_time,score)

?lm


plot(lm(study_time ~ score ))

?abline()

lm(study_time ~ score)


?abline


plot(study_time ~ score)


?abline
abline(lm(study_time ~ score),col='red', lwd=2,lty=1)

?line()

month<-c(1:12)

late<-c(4,5,7,10,12,13,6,5,4,2,8,9)

length(late)


?plot

?base::plot

?graphics::plot()



plot(month,late, type = "l", lwd=4)

plot(month,late, lwd=4 , type = "l",main="2019년 월별 지각 횟수" )

late2<-c(8,7,5,4,11,12,6,2,7,1,10,12)


lines(month,late2,type = "l", col="red")



datasets::Titanic


readxl::read_excel()

library(readxl)
getwd()

setwd("C:/ex/day4")
?read_excel
df_sc<-read_excel('남녀성적.xlsx', sheet='성별스코어')

df_sc1<-as.data.frame(df_sc)


str(df_sc1)

summary(df_sc1)




sum(df_sc1$score, na.rm = TRUE)


is.na(df_sc1$score)



is.na(df_sc1)

table(is.na(df_sc1))


install.packages("dplyr")


library(dplyr)



iris_data<-iris

str(iris_data)

iris_data %>% select(Species) %>% head()

table(iris_data$Species)

colnames(iris_data)

summary(iris_data$Sepal.Width)

iris_data %>% select(Sepal.Width) %>% filter(!is.na(iris_data))

iris_data %>% select(Sepal.Width) %>% filter(is.na(iris_data))

?filter()


da1<-data.frame(sung=c('M',"F",NA,"M","F"),score=c(4,5,3,4,NA))


is.na(da1)

colnames(da1)

da1 %>% filter(is.na(score))

da1 %>% filter(is.na(sung))


da1 %>% filter(!is.na(score))


da2 <- da1 %>% filter(!is.na(score))


is(da2) 


da3<-da2 %>% filter(!is.na(sung)) 

mean(da3$score)

da1[ is.na(da1$sung), ]

da1[ !is.na(da1$sung), ]

da1

!is.na(da1$sung) &  !is.na(da1$score)


da1 %>% filter(!is.na(da1$sung) &  !is.na(da1$score))


na.omit(da1)



x<-mean(da1$score,na.rm = TRUE)

is.na(da1$score)

ifelse( is.na(da1$score),x, da1$score)

da1$score<-ifelse( is.na(da1$score),x, da1$score)
da1


test<-c(1,500,550,400,590,600)

boxplot(test)

median(test)
summary(test)

IQR(test)

580-425





test


test<-ifelse(test>=500 & test<=600, test,NA) 

boxplot(test, na.rm=TRUE)


c(TRUE,FALSE) & c(TRUE,FALSE)
#벡터 끼리의 연산시 각  원소 값을 계산

c(TRUE,FALSE) && c(TRUE,FALSE)
#벡터의 첫번째  값만 체크
c(TRUE,FALSE) && c(FALSE,FALSE)

c(FALSE,TRUE) && c(FALSE,TRUE)



rm(list=ls())

setwd("c:/ex/day4")


car<-read.table('auto-mpg.data')


colnames(car)<-c('mpg','cylinders','displacement','horsepower','weight','acceleration','model_year','origin','car_name')

str(car)

length(car)

dim(car)
head(car)

View(head(car,10))
View(tail(car,10))


class(car["mpg"])

mode(car["mpg"])

class(car[['mpg']])



install.packages("tm")
library(tree)
install.packages("tree")
install.packages("psych")
library(psych)
psych::describe(iris)


install.packages("reshape")
library(reshape)
reshape::melt()
reshape::cast()

install.packages("prob")
library(prob)

prob::rolldie()


rolldie(2)
tosscoin(1)



datasets::cars

?cars
str(cars)


cor(cars$speed, cars$dist)


lm( dist~ speed , data = cars)

plot(cars$speed, cars$dist)

plot(lm( dist~ speed , data = cars))



?Nile
class(Nile)

plot(Nile)

range(Nile)


boxplot(Nile)

setwd('C:/ex/day5')

rm( list = ls())


read.csv(file.choose())

LaniCafe<-read.csv(file.choose(), header = T, na.strings = c("na") )

View(head(LaniCafe))

str(LaniCafe)

attach(LaniCafe)

colnames(LaniCafe)
cf<-Coffees

length(cf)

cf1<-na.omit(cf)

length(cf1)


summary(cf1)
#sort(table(cf))
#class(cf)
#cf1<-as.numeric(cf)
#class(cf1)


x1<-c(10,15,17,20)

#평균/분산/표준분차
# 1) 공식에 의한 계산
# 2) 함수에 의한 계산 후 두 값이 일치하는지 확인하세요.


m<-mean(x1)

pyuncha<-(m-x1)

pyuncha_square<-pyuncha^2
bunsan<-sum(pyuncha_square) / (length(x1) -1)
bunsan

var(x1)

sqrt(bunsan)


sd(x1)


rnorm(100)

mean(rnorm(100))

mean(rnorm(1000))

mean(rnorm(10000))

mean(rnorm(100000000))

library(prob)


?norm()

?Uniform

?dchisq()


?pt
?pf

hist(rnorm(100))

hist(rnorm(1000))
hist(rnorm(10000))
hist(rnorm(100000))



?Nile
class(Nile)

plot(Nile)


?ldeaths


class(ldeaths)

plot(ldeaths)
str(ldeaths)

par(mfrow=c(2,1))
plot(Nile)
plot(ldeaths)

par(mfrow=c(1,1))
plot(ldeaths)
de_l<-decompose(ldeaths)
plot(de_l)
plot(de_l$seasonal)

#차분
?diff
Nile
diff(Nile)
963 - 1160

diff(Nile,2)

963-1120

par(mfrow=c(2,1))

plot(Nile)

plot(diff(Nile, 1))
par(mfrow=c(2,1))

plot(Nile)

plot(diff(Nile, 2))


