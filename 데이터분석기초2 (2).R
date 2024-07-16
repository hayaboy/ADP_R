?cars

library(datasets)
datasets::iris

View(iris)


cars
View(cars)
?plot
plot(cars)

str(cars)
summary(cars)
?plot

plot(cars,type='p',main="speed&dist" ,pch=3)

base::plot(cars,type='p',main="speed&dist" ,pch=3)

graphics::plot()

datasets::Nile

View(Nile)
str(Nile)




is(Nile)

plot(Nile)

?ts

getwd()

setwd('C:/Ex/r')

load('data2.rda')








str(data2)

colnames(data2)<-c('sex','age','rel','edu','baby')

str(data2)
#read.csv(file.choose(), na.strings = '.')

data2$baby

unique(data2$baby)


?barplot()

?table

man_woman_cnt<-c('m','m','m','w','w')
table(man_woman_cnt)

barplot(table(man_woman_cnt))

?barplot()



barplot(table(data2$baby) , main="출생아(남자)별 빈도", xlab="출생아수", ylab="빈도" )


unique(data2$age)
range(data2$age)

table(data2$age)

?hist()

hist(table(data2$age))

hist(data2$age)



seq(0,90,10)

?hist

hist(data2$age, breaks = 9)

hist(data2$age, breaks = seq(0,90,10))

hist(data2$age, breaks = c(seq(0,90,10)))

hist(data2$age, breaks = c(seq(0,90,10)), right=F,probability = T)



data2$edu
?pie
pie(table(data2$edu), cex=0.8)


pie(data2$edu)

?read_excel
ranicafe<-readxl::read_excel(file.choose(), na='na')

View(ranicafe)

#ranicafe2<-readxl::read_excel(file.choose())

?read.csv()
str(ranicafe)


summary(ranicafe$Coffees)

sort(ranicafe$Coffees)[1]

rc<-ranicafe$Coffees

w<-(1/length(rc))
sum(rc*w, na.rm = T)


mean(rc, na.rm = T)




max(rc, na.rm = T)

rc[rc==max(rc, na.rm = T)]
?which
which(rc==max(rc, na.rm = T))

rc[rc==max(rc, na.rm = T)] <-480

rc[22]

mean(rc,na.rm = T)



length(r)



if(4>3){"참"}


if(2>3){"참"}



readxl::read_excel()


rani_cof<-read_excel(file.choose(),na='na')


View(rani_cof)

rani_cof<-as.data.frame(rani_cof)



?na.exclude()

nrow(rani_cof)

length(rani_cof)

length(na.omit(rani_cof))

length(na.exclude(rani_cof))



rani_cof2<-na.omit(rani_cof)

med.idx<-(nrow(rani_cof2)+1)/2

as.

sort(rani_cof2$Coffees)



rc
?quantile()


rc[22]<-48
rc[22]

qs<-quantile(rc, na.rm = T)

is(qs)


qs[4] -  qs[2]

?IQR


IQR(qs)

quantile(rc, na.rm=T)

boxplot(rc)

range(rc, na.rm = T)

rc

?par

par(mfrow=c(1,2))

hist(rc)
boxplot(rc)

par()





cars

range(cars$dist)

summary(cars$dist)

seq(0,120,10)

par(mfrow=c(1,2))

hist(cars$dist, breaks = seq(0,120,10))
boxplot(cars$dist)

quantile(cars$dist)



IQR(cars$dist)*1.5

56+1.5*IQR(cars$dist)



if(4%%2==0){
  print("짝")
}else{
  print("홀")
}


install.packages("stringr")
library(stringr)
?stringr


stringr::str_split()

?str_split
str_split("액션/호러","/")

str_split_fixed("액션/호러/코믹","/",2)



1/factorial(45)    


1/(45*44*43*42*41*40)


combn()
combn(c(1:45),6)
install.packages("gtools")

library(gtools)

gtools::permutations()

?permutations

permutations(2,2,1:2, repeats.allowed=TRUE)
combinations(2,2,1:2,repeats.allowed=TRUE)

#수열 {1,2,3}
#전체 개수 n=3, 뽑는 개수 r =2

nPr #순열

permutations(3,2,1:3 )

nCr #조합
combinations(3,2,1:3)

#로또를 가지수 수

#45C6

combinations(45,6,1:45)


8144894+166



prob::tosscoin()

library(prob)
?tosscoin()
tosscoin(2,makespace = T)



n<-6

p<-1/3

#확률변수(x)
#0,1,2,3,4,5,6

x<-0:6

#distribution
#binomial

?dbinom()

dbinom(2,size = n,prob=p)

dbinom(4,size = n,prob=p)


px<-dbinom(x,size = n,prob=p)

2*(1:3)

xx<-1:3
yy<-2*(1:3)
?plot
plot(xx,yy,type = 'c')


plot(x,px,type = 's',xlab="성공 횟수(x)", ylab="확률(P[X=x])", main="B(6, 1/3)")

#options(digits=3)


mu<-170
sigma<-6
ll<-mu-3*sigma
ul<-mu+3*sigma

x<-seq(ll,ul,by=0.01)


?dnorm

nd<-dnorm(x,mean = mu,sd=sigma)
nd


plot(x,nd, type='l', xlab="x", ylab="P(X=x)", lwd=2, col="red")


pnorm(x,mean = mu,sd=sigma)
?options
options(digits=3)
pnorm(158,mean = mu,sd=sigma)

pnorm(182, mean=mu, sd=sigma)

1-0.977

pnorm(180, mean=mu, sd=sigma) - pnorm(160, mean=mu, sd=sigma)





qnorm(0.25, mean=mu, sd=sigma)


qnorm(0.5, mean=mu, sd=sigma)


qnorm(0.75, mean=mu, sd=sigma)

options(digits=5)

set.seed(5)

smp <- rnorm(400, mean=mu, sd=sigma)


smp2 <- rnorm(4000000, mean=mu, sd=sigma)


mean(smp)

sd(smp)


mean(smp2)

sd(smp2)

#1
score<-c(80,60,70,50,90)
mean(score)

?data.frame

product_table<-data.frame(제품=c('사과','딸기','수박'),가격=c(1800,1500,3000),판매량=c(24,38,13))
View(product_table)



mean(product_table$가격)

mean(product_table$판매량)

library(ggplot2)
ggplot2::mpg

?mpg

str(mpg)
head(mpg)

mpg2<-mpg


colnames(mpg2)

?rename()
mpg3<-rename(mpg2, city=cty)
colnames(mpg3)

# rename(데이터프레이명, 새변수명=기존변수명)

mpg4<-rename(mpg3, highway=hwy)
colnames(mpg4)

head(mpg4)
mpg5<-as.data.frame(mpg4)
head(mpg5)

?ggplot()

View(ggplot2::midwest)
?midwest
midwest<-ggplot2::midwest
str(midwest)
midwest2<-as.data.frame(midwest)

str(midwest2)
summary(midwest2)
#데이터 탐색시 주로 사용하는 함수
#str,View,head,tail,dim,summary

dim(midwest2)
colnames(midwest2)
#rename(midwest2, =)
library(dplyr)

midwest3<-data.frame(midwest2$state, midwest2$area)

head(midwest3)


colnames(midwest3)<-c('s','a')



midwest4<-rename(midwest2, total=poptotal, asian=popasian)

colnames(midwest4)

head(midwest4)


midwest_final<-data.frame(midwest4$total,midwest4$asian)

asian_ratio<-(midwest_final$midwest4.asian / midwest_final$midwest4.total) *100

asian_ratio_mean<-mean(asian_ratio)

asian_ratio
?ifelse


asian_ratio_mean


hist(asian_ratio)

asian_ratio_two<-ifelse(asian_ratio>asian_ratio_mean, "large", "small")

table(asian_ratio_two)
asian_ratio_two
?barplot
plot(table(asian_ratio_two))
library(ggplot2)


ggplot2::qplot()


qplot(asian_ratio_two)


ggplot2::mpg

mpg_new<-ggplot2::mpg

mpg_new_df<-as.data.frame(mpg_new)

str(mpg_new_df)

library(dplyr)
colnames(mpg_new_df)
mpg_new_df %>% select(manufacturer,model)

unique(mpg_new_df$manufacturer)

base::summary()

#반드시 암기할 것
dplyr::select()
dplyr::filter()
dplyr::arrange()
dplyr::group_by()
dplyr::summarise()

?summarise
?arrange

colnames(mpg_new_df)
mpg_new_df %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)

base::mean()


unique(mpg_new_df$class)

mpg_new_df %>% group_by(class) %>% summarise(mean_city=mean(cty)) %>% arrange(desc(mean_city))

mpg_new_df %>% group_by(manufacturer) %>% summarise(mean_highway=mean(hwy)) %>%  arrange(desc(mean_highway)) %>% head(3)

unique(mpg_new_df$class)


?n()

mpg_new_df %>% filter(class=="compact") %>% group_by(manufacturer) %>% summarise(count=n()) %>% arrange(desc(count))




