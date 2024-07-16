rm(list=ls())
DF<-data.frame(Work_hour=1:7,Total_pay=seq(10000,70000,by=10000))
DF
#visualization
# 1. plot() : 빠르게 데이터를 탐색하기 위한 그래프 그리기(EDA,탐색적 자료 분석)
# 2. ggplot2 패키지: 보다 정교한 데이터의 특징을 나타내기 위해 그래프 그리기
# 3. rCharts 패키지(자바스크립트 라이브러리)  : Report를 위한 그래프 
?plot

plot(Total_pay ~ Work_hour, data=DF, pch=20, col="red" )

LR<-lm(Total_pay ~ Work_hour, data=DF)
str(LR)
class(LR)
is(LR)
#mode() 객체의 속성을 보기 위하여
mode(LR)
names(LR)
summary(LR)
grid()
?abline
abline(LR, col="blue", lwd=2)





setwd("C:/Ex/R")

DF<-read.csv("example_kbo2015.csv")

str(DF)


DF$H
DF$HR
cor(DF$H,DF$HR)
# 0.83 으로 어느정도 상관관계가 있다고 본다.
attach(DF)

plot(HR ~ H, data=DF, pch=20, col="grey", cex=1.5)



Lm<-lm(HR ~ H,data=DF)

Lm

#안타 1개 치면 홈런 0.28개(안타 10개 치면, 홈런 2.8개 칠 것으로 예측) ->인과 관계




# 선형회귀 모형 검정

#결정계수(상관계수 제곱해서 얻은 값, R제곱 값)

summary(Lm)

# 수정된 결정계수 : 독립변수가 많아지면서 자연스럽게 값이 커지는 현상을 조절한 계수




# 선형 회귀모형 가설검정 절차

#1. 가설 설정
#2. 유의 수준 알파 : 0.05
#3. 검정 통계량 F =MSR/MSE

#p-value: 0.002442 매우 유의하다.

#회귀분석을 위한 가정 : 오차(𝜀_𝑖)에 대한 가정
#독립성 : 오차들은 서로 독립이다.
#동일분산성 : 오차들의 분산은 𝜎^2으로 모두 동일하다.
#정규성 : 오차는 평균이 0이고 분산이 𝜎^2 인 정규분포를 따른다










