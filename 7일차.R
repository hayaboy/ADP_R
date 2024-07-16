rm(list=ls())

study_time<-c(2,4,6,8)

score<-c(81,93,91,97)

st_m<-mean(study_time)
sc_m<-mean(score)


st_pyuncha<- st_m - study_time


va_st<-sum(st_pyuncha^2)/(length(study_time)-1)
va_st
var(study_time)

sc_pyuncha<- sc_m - score

?sd


sd(study_time)
sd(score)

cov(study_time,score) / (sd(study_time) * sd(score))


cor(study_time, score)


plot(study_time,score)

?lm
lm(score ~ study_time)


ggplot2::Cars


auto_mpg<-read.table(file.choose(),header = FALSE, na.strings = "?")
View(auto_mpg)

str(auto_mpg)

colnames(auto_mpg)<-c('mpg','cylinders','displacement','horsepower','weight','acceleration','model year','origin','name')
str(auto_mpg)

library(dplyr)

auto_mpg4<-auto_mpg %>% select(mpg,weight,horsepower) %>% filter(horsepower!="?")


auto_mpg3

attach(auto_mpg4)

colnames(auto_mpg4)

plot(mpg ~ weight)

lm(mpg ~ weight)

summary(lm(mpg ~ weight))

colnames(auto_mpg)

auto_mpg5<-auto_mpg %>% select(mpg,displacement,horsepower,weight,acceleration) %>% filter(horsepower!="?")

auto_mpg5


lm(mpg ~ displacement + horsepower + weight + acceleration , data = auto_mpg5)



colnames(auto_mpg)<-c('mpg','cyl','disp','hp','wt','acc','model year','origin','name')

colnames(auto_mpg)
attach(auto_mpg)


car_lm<-lm(mpg ~ disp + hp + wt + acc, data =auto_mpg )

hp


summary(car_lm)




str(auto_mpg)

x_test<-c('mpg','disp','hp','wt','acc')

pairs(auto_mpg[x_test], cex=1,col=as.integer(auto_mpg$cyl))

str(auto_mpg)

?step

#AIC는 정보 이론을 기반으로 합니다. 데이터를 생성 한 프로세스를 나타내는 데 통계 모델이 사용되면 그 표현은 거의 정확하지 않습니다. 따라서 프로세스를 나타내는 모델을 사용하면 일부 정보가 손실됩니다. 
#AIC는 주어진 모델에 의해 손실되는 정보의 상대적인 양을 추정합니다. 모델이 손실하는 정보가 적을수록 해당 모델의 품질이 높아집니다.
#모델에 의해 손실되는 정보의 양을 추정 할 때 AIC는 모델의 적합도 와 모델의 단순성 간의 균형을 다룹니다 . 즉, AIC는 과적 합 위험과 과소 적합 위험을 모두 처리합니다.
step(car_lm, direction = "both")

