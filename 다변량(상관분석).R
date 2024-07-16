
#상관분석

#1.피어슨 상관계수(수치형) - 선형관계
install.packages("Hmisc")
library(Hmisc)
str(mtcars)
data("mtcars")
head(mtcars)
drat<-mtcars$drat
disp<-mtcars$disp
plot(drat,disp)
cor(drat,disp)
# 상관 계수 -0.7102139로 배기량과 후방차축 비율은 서로 
#강한 음의 상관성을 가지고 있음을 알 수 있다.
#Hmisc::rcorr
#rcorr()함수는 모든 변수들 사이의 상관계수와 함께
#가설에 대한 p값을 출력한다.


options(digit=2)
rcorr(as.matrix(mtcars),type="pearson")


# P 행렬은 각 상관계수의 유의확률을 포함한다.
# carb(기화기 개수)와  am(변속기)의 p값이 0.7545로 두 변수 사이의 
# 상관계수가 유의하지 않음을 알 수있다.



cov(mtcars)
#공분산



#2.스피어만 상관계수(비선형) , 순위 
#피어슨의 상관계수는 두 변수간의 선형관계의 크기를 측정하는 값으로 
#비선형적인 상관 관계는 나타내지 못한다. 
#스피어만 상관계수는 두 변수 간의 비선형적인 관계도 나타낼 수 있는 
#값이다. 

str(mtcars)
class(as.matrix(mtcars))
?rcorr
rcorr(as.matrix(mtcars),type="spearman")



korean<-c(85,75,65,78,59,60,90,100,99,91,70)
math<-c(80,60,75,40,50,64,70,78,90,98,50)
english<-c(80,70,69,79,80,95,98,97,67,80,50)
test<-data.frame(korean,math,english)
rcorr(as.matrix(test), type="spearman")








