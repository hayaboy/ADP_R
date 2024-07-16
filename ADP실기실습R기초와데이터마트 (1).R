## ADP 실기 

install.packages()
library()
help("par")


#R의 데이터 구조 (lamvs f  df)

x<-c(1,10,24,40)
y<-c("사과","바나나","오렌지")
z<-c(TRUE,FALSE,TRUE)

mx<-matrix(c(1,2,3,4,5,6), ncol = 2)
mx

r1<-c(10,10)
c1<-c(20,20,20)

rbind(mx,r1)

cbind(mx,c1)




income<-c(100,200,150,300,900)
car<-c("kia","hyundai","kia","toyota","lexus")
marriage<-c(FALSE,FALSE,FALSE,TRUE,TRUE)

mydat<-data.frame(income,car,marriage)



mydat




data1<-read.table("C:/ex/example.csv",header = T,sep =",")

data1

data2<-read.table("C:/ex/example.txt")

data2
install.packages("readxl")
library(readxl)

test1<-read_excel(file.choose())


test1




#R의 기초 함수
rep(1,3)

1:3

seq(1,3)

seq(1,11, by=2)


seq(1,11, length=6)
seq(1,11, length=8)


rep(2:5,3)


a<-1:10
a+a
a-a
a*a
a/a




a<-c(2,7,3)

a

t(a)



A=a%*%t(a)
A



mx<-matrix(c(23,41,12,35,67,1,24,7,53),nrow=3)

mx
5*mx

solve(mx)


a<-1:10



mean(a)

var(a)



sd(a)



sum(a)



median(a)

log(a)


b<-log(a)


cov(a,b)

cor(a,b)



summary(a)





#R의 데이터 핸들링


b<-c("a","b","c","d","e")

b[2]

b[-4]

b[c(2,3)]


mydat

mydat[3,2]


mydat[ , 2]

mydat[4 , ]



#반복 구문과 조건문

a<-c()


for (i in 1:9){
  a[i]<-i*i
}


a



isum=0



for (i in 1:1000){
  
  isum <- isum +i
}


isum




x<-1


while(x<5){
  x<-x+1
  print(x)
}


x<-1
while(x<5){
  if(x==3){
    print(x)
  } 
  x<-x+1
}


addto<-function(a){
  isum<-0
  for(i in 1:a){
    isum<-isum+i
  }
  print(isum)
}


addto(10)


#기타 유용한 기능

number<-1:10

alphabet<-c("a","b","c")


paste(number,alphabet)


paste(number,alphabet, sep = " to the ")



substr("BigDataAnalysis", 1,4)


#as.data.frame(x)
#as.list(x)
#as.matrix(x)
#as.vector(x)
#as.factor(x)








as.integer(3.14)

as.numeric("foo")


as.character(101)

as.numeric(FALSE)

as.logical(0.45)



mydat



as.matrix(mydat)




Sys.Date()
#as.Date()   날짜 객체로 변환 




#R 그래픽 기능


height<-c(170,168,174,175,188,165,190,173,168,159,170,184,155,165)
weight<-c(68,65,74,77,92,63,67,95,72,69,60,69,73,56)

length(height)
length(weight)

plot(height,weight)



pairs(iris[1:4])

?pairs


hist(height)

hist(height, probability = T)

boxplot(height)




##데이터마트


##R reshape를 활용한 데이터 마트 개발


install.packages("reshape")
library(reshape)



data("airquality")



head(airquality)





names(airquality)


names(airquality)<-tolower(names(airquality))

names(airquality)




aqm<-melt(airquality, id=c("month","day"), na.rm = TRUE)
aqm



a<-cast(aqm, day ~ month ~ variable)

a


b<-cast(aqm, month ~ variable, mean)

b




c<-cast(aqm, month ~ . | variable, mean)


c




d<-cast(aqm, month ~ variable, mean, margins=c("grand_row", "grand_col"))

d



e<-cast(aqm, day ~ month, mean, subset = variable=="ozone")


e



f<-cast(aqm, month ~ variable, range)

f




##sqldf를 이용한 데이터 분석


install.packages("sqldf")

library(sqldf)

data(iris)


sqldf("select * from iris")


sqldf("select * from iris limit 10")





##plyr


#                입력되는 데이터 형태
#                   data.frame          list                array
#data.frame          ddply              ldply               adply
#list                dlply              llply               alply
#array               daply              laply               aaply





set.seed(1)
d<-data.frame(year=rep(2012:2014, each=6),count=round(runif(9,0,20)))
d

library(plyr)

ddply(d, "year", function(x){
  mean.count<-mean(x$count)
  sd.count<-sd(x$count)
  cv<-sd.count/mean.count
  data.frame(cv.count=cv)
})


ddply(d, "year", summarise, mean.count=mean(count))




ddply(d, "year", transform, total.count=sum(count))



#데이터 테이블

install.packages("data.table")
library(data.table)

DT<-data.table(x=c("b","b","b","a","a"), v=rnorm(5))

DT

data("cars")
head(cars)


CARS<-data.table(cars)
head(CARS)



tables()

sapply(CARS,class)



DT[DT$x=="b",]



setkey(DT,x)
tables()


DT["b", ]


DT["b", mult="first"]


DT["b", mult="last"]



## 결측값 처리와 이상값 검색

data("iris")

str(iris)



y<-c(1,2,3,NA)

is.na(y)

x<-c(1,2,NA,3)
mean(x)



mean(x, na.rm = T)




install.packages("Amelia")

library(Amelia)



data("freetrade")

head(freetrade)



#m 몇 개의 imputation 데이터 세트를 만들지를 결정하는 값
#ts
#cs

a.out<-amelia(freetrade, m=5, ts="year", cs="country")

hist(a.out$imputations[[3]]$tariff, col="grey",border="white")

save(a.out, file = "imputations.RData")

write.amelia(obj=a.out, file.stem = "outdata")


missmap(a.out)


freetrade$tariff<-a.out$imputations[[5]]$tariff

missmap(freetrade)



##이상값 검색


#ESD(Extreme Studentized Deviation)
#평균으로부터 k*표준편차만큼 떨어져 있는 값들을 이상값으로 판단하고 일반적으로 k는 3



x<-rnorm(100)
boxplot(x)


x<-c(x,19,28,30)
outwidth<-boxplot(x)
outwidth$out




install.packages("outliers")
library(outliers)

set.seed(1234)
y<-rnorm(100)
outlier(y)

outlier(y, opposite = T)

dim(y)<-c(20,5)
outlier(y)
outlier(y, opposite = T)


boxplot(y)
