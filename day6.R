
library(prob)
?tosscoin
tosscoin(1)
tosscoin(1, makespace = T)

rolldie(1)
rolldie(1,makespace = T)

#단지(항아리)
urnsamples(1:3,1)
urnsamples(1:3,2)

rep("R",3)
rep("R",2)

urnsamples(c(rep("R",3), rep("B",2)),2)

?binomial()          

pnorm(0.259,56,94, sqrt)

rm(list = )

rm( list = ls())

getwd()

x1<-c(175,168,168,190,156,181,175,174,179)
x2<-c(185,169,173,188,173,186,175,179,180)

var(x1)
var(x2)

var(x1) / var(x2)

length(x1)-1
length(x2)-1
var.test (x1,x2)

#배수의 법칙(큰 수의 법칙)
# 큰 모집단에서 무작위로 뽑은 표본의 평균이 전체 모집단의 
# 평균과 가까울 가능성이 높다

#중심 극한의 정리(central limit theory) 동일한 확률분포를 가진 독립 확률 변수 n개의 평균의 분포는 
# n이 적당히 크다면 정규 분포에 가까워진다는 정의이다.

rm( list = ls())


before_study <- c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,76,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)
after_study <- c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)

length(before_study)
length(after_study)

boxplot(before_study,after_study, names = c("수헙전", "수헙후"))


#정규 분포 여부를 환인하는 방법 # Shapiro-Wilk 검정
#귀무가설 정규분포를 따른다
# 대립가설: 정규분포를 따르지 않는다 

?shapiro.test

shapiro.test(before_study)
shapiro.test(after_study)


t.test(before_study,after_study, paired = T, alternative = "less")

t.test(before_study,after_study, paired = T, alternative = "greater")

#p- value "다르다 크다 작다를 구분할수 있는 가능성이 얼마나 높은지에 대한 정보를 
#  제공할 뿐이지 p-value의 크고 작음이 두 집단 간 평균값 차이에 크다 작다를 의미하지 않는다



iris


iris$Sepal.Width

#일원분산분석

#aov와 bartlett.test( 오차의 등분산성 검정)



?aov


aov(Sepal.Width ~ Species, data = iris)

summary(aov(Sepal.Width ~ Species, data = iris))

boxplot(Sepal.Width ~ Species)
#p-value 값이 매우 작게 나와 대립가설 채택

#iris의 품종(Species)별로 Sepal.Width평균은 다르다라고 판달 할 수 있다.

#일원 배치 분산분석의 성립 전제 조건 : 오차의 등분산성 검정

?bartlett.test()


bartlett.test(Sepal.Width ~ Species, data = iris)

rm(list=ls())

x1<-c(10,1,5,2,4,6,1,3,8)
x2<-c(82,94,88,90,87,84,91,87,83)

cor(x1,x2)^2
plot(x1,x2)
lm(x2 ~ x1)


summary(lm(x2 ~ x1))
abline(lm(x2 ~ x1), col='red',lwd=2,lty=1)



setwd('C:/ex/day6')

data<-read.csv(file.choose())

x<-data$비타민복용
y<-data$감기발생


data.frame(Level=x, Pass=y)

result<-data.frame(Level=x, Pass=y)
table(result)

#교차 분석(검증)은 행변수와 열변수가 관련되어 있는지(비율의 차이가 있는지 검정)

install.packages("gmodels")
library(gmodels)
CrossTable(x,y)

chisq.test(x,y)


ls()

rm(list = ls())

car<-read.table(file.choose())

head(car)

colnames(car)

str(car)

attach(car)
