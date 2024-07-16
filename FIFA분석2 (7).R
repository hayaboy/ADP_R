
rm(list=ls())
#미션 4

getwd()

setwd("C:/ex/r")

fifa<-read.csv("FIFA.csv")


sum(is.na(fifa))


install.packages("stringr")
library(stringr)


fifa$Height_cm<-(as.numeric(str_split_fixed(fifa$Height,"'",2)[,1])*30) + (as.numeric(str_split_fixed(fifa$Height,"'",2)[,2])*2.5)


fifa<-within(fifa, {
  Position_Class=character(0)
  Position_Class[Position %in% c( "LS","ST", "RS", "LW", "LF", "CF", "RF", "RW")] ="Forward"
  Position_Class[Position %in% c( "LAM", "CAM", "RAM", "LM", "LCM", "CM", "RCM", "RM")] ="Midfielder"
  Position_Class[Position %in% c( "LWB", "LDM", "CDM", "RDM", "RWB", "LB", "LCB", "CB", "RCB", "RB")] ="Defender"
  Position_Class[Position %in% c( "GK")] ="GoalKeeper"
})


str(fifa)


#미션 4
#Preferred_Foot(주로 사용하는 발)과 Position_Class 변수에 따라 Value(이적료)의 차이가 있는지를 
#알아보기 위해 이원배치분산분석을 수행하고 결과를 해석하시오.


#가정
#각 집단 측정치의 분포는 정규분포이어야 한다. (정규성)
#집단 간 측정치의 분산은 같다.(등분산성)

#주효과
#교호작용효과 : 여러 독립변수들의 조합이 종속변수에 주는 영향
#두 독립변수 A,B 사이에 상관 관계가 존재할 경우 교호작용이 있다.

#귀무 가설
#   1) 주로 사용하는 발에 따른 선수의 가치는 차이가 없다. 
#   2) 포지션의 따른 선수의 가치는 차이가 없다.
#   3) 상호 작용 간의 효과가 없다. 

#대립 가설
#1) 주로 사용하는 발에 따른 선수의 가치는 차이가 있다. 
#2) 포지션의 따른 선수의 가치는 차이가 있다.
#3) 상호 작용 간의 효과가 있다. 

#formula 표현식

#formula        종속변수(결과,y)        ~     독립변수(원인) (x)


#   + 독립 변수가 여러개인 경우 +

#   .  모든 변수

#   -   해당되는 변수 제외

#   :   상호 작용




 




fifa_twoway_anova<-aov(Value  ~  Preferred_Foot   +  Position_Class +  Preferred_Foot:Position_Class , data =fifa)



summary(fifa_twoway_anova)

#결론 
#1)주로 사용하는 발에 대한 p값이 0.05보다 작으므로 대립가설 채택, 차이가 있다.
#2)포지션에 대한 p값이 0.05보다 작으므로 대립가설 채택, 차이가 있다.
#3)교호작용에 대한 p값이 0.05보다 작으므로 대립가설 채택, 차이가 있다.








#미션
#R에 내장된 mtcars 데이터는 32개의 차종에 대한 다양한 특성과 단위 연료당 주행거리를 담고 있다.
#am변수는 변속기 종류이면, cyl변수는 실린더 개수


#데이터를 분석에 적절한 형태로 전처리한 후, 변속기 종류(am)와 실린더의 개수(cyl)에 따라 주행거리(mpg) 평균에
#유의미한 차이가 존재하는지 이원 분산 분석을 수행하고, 그 결과를 해석
#시간은 4시 50분까지 제출


data("mtcars")
?mtcars

str(mtcars)
#귀무 가설:
#1) 변속기 종류에 따른 주행거리 차이가 없다.
#2) 실린더의 갯수에 따른 주행거리 차이가 없다.
#3) 교호 작용에 따른 주행거리 차이가 없다.


#대립 가설:
#1) 변속기 종류에 따른 주행거리 차이가 있다.
#2) 실린더의 갯수에 따른 주행거리 차이가 있다.
#3) 교호 작용에 따른 주행거리 차이가 있다.

sum(is.na(mtcars))

summary(mtcars)

table(mtcars$cyl)



mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$am<-as.factor(mtcars$am)


str(mtcars)

colnames(mtcars)


aov( mpg ~ cyl + am + cyl:am, data=mtcars)

#summary(aov( mpg ~ cyl*am, data=mtcars))


summary(aov( mpg ~ cyl + am + cyl:am, data=mtcars))

#데이터프레임의 칼럼 순서대로 하기

#summary(aov( mpg ~ am + cyl+ am:cyl, data=mtcars))


#cyl는 주행거리간 유의미한 차이가 있다.
#am는 주행거리간 유의미한 차이가 없다.
#교호 작업 주행거리간 유의미한 차이가 없다.




?interaction.plot()


interaction.plot(mtcars$cyl,mtcars$am, mtcars$mpg)

#일반적으로 상호 작용 그래프에서 두 선이 서로 교차하고 있을 시에는
#x축에 있는 독립변수와 y축에 있는 독립변수 간에는 상호 작용이 존재한다고 해석할 수 없다. 


str(fifa)


#관계검정(교차분석, 상관분석, 회귀분석)

#교차(동독적)

#동질성 검정

#독립성 검정

#적합성 검정
#귀무 가설  : 바다에 대한 선호도와 산에 대한 선호도의 차이가 없다.
#대립 가설  : 바다에 대한 선호도와 산에 대한 선호도의 차이가 있다.




#검정 통계량(????^2)



((68-50)^2)/50      + ((32-50)^2)/50

12.96


#p     normal
#d     t
#q     f
#r     chisq


?qchisq


qchisq(1-0.05, 1)

3.841459

#결론 : 귀무가설을 기각
#바다에 대한 선호도와 산에 대한 선호도의 차이가 있다.


#문제 

library(MASS)

#MASS 패키지의  survey 데이터에서 W.Hand  변수는 설문 응답자가
#왼손잡이인지, 오른손 잡이인지를 나타낸다.

#W.Hand 변수에 대한 분할표를 생성하고, 
#아래와 같은 가설에 대한 적합도 검정을 수행해보자

#귀무가설: 전체 응답자 중 왼손잡이의 비율이 20%, 오른손 잡이 비율이 80%이다.
#대립가설: 전체 응답자 중 왼손잡이의 비율이 20%, 오른손 잡이 비율이 80%이라고 할 수 없다.



MASS::survey

summary(survey$W.Hnd)

table(survey$W.Hnd)

18 / (18  + 218)

hand<-table(survey$W.Hnd)

class(hand)

?chisq.test()

chisq.test(hand, p=c(0.2,0.8))


qchisq(1-0.01, df=1)

#지역과 구매의사는 독립적이지 않다라는 대립가설을 채택 







#문제

#MASS 패키지의 survey데이터에서 Exer 변수는 설문 응답자가 얼마나 자주 운동을 하는지에 대해
#Freq(자주), Some(약간), None(하지 않음)의 범주로 값을 저장하고 있다.
#주로 사용하는 손과 운동의 빈도가 서로 독립인지를 확인하기 위해 분할 표를 작성하고
#아래의 가설에 독립성 검정을 수행해보자

#귀무 가설 : W.Hnd(주로 사용하는 손)과 Exer(운동 빈도는) 독립이다.
#대립 가설 : W.Hnd(주로 사용하는 손)과 Exer(운동 빈도는) 독립이 아니다.



MASS::survey

str(survey)




table(survey$W.Hnd, survey$Exer )


chisq.test(table(survey$W.Hnd, survey$Exer))
#W.Hnd(주로 사용하는 손)과 Exer(운동 빈도는) 독립이다.


chisq.test


#동질성 검정

tab_data<-matrix(c(25,20,15,20,10,20), nrow = 2)

#귀무 : 교재에 따른 공부의 효과가 동일하다.
#대립 : 교재에 따른 공부의 효과가 동일하지 않다. 

chisq.test(tab_data)

#결론 : 교재에 따른 공부의 효과가 동일하다.


#독립성 검정

#귀무 : 성별과 게임의 선호도는 독립이다(즉 영향을 안 미친다.)
#대립 : 성별과 게임의 선호도는 독립이 아니다.(즉, 영향을 미친다.)


tab_data2<-matrix(c(50,30,30,30,20,40), nrow = 2)
chisq.test(tab_data2)

#결론 성별과 게임의 선호도는 독립이 아니다.(즉, 영향을 미친다.)

#적합성 검정

obs<-c(10,35,40,15)
proba<-c(1/8, 3/8,3/8,1/8)

chisq.test(obs, p = proba)

#귀무 : 나무의 비율 1/8, 3/8,3/8,1/8
#대립 : 귀무가 아니다.

#결론 : 나무의 비율 1/8, 3/8,3/8,1/8 이다.



x<-c(2,4,6,8)


y_real<-c(81,93,91,97)


?lm

#formula  종속변수 ~ 독립변수

#. 모든 변수

#+ 
  
#:
  
  

lm(y_real ~ x)





adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104	,105,	121)

length(adv)


lm(sales ~ adv)



#광고 40하면 매출이 얼마이지 예측하시오?




cor(adv, sales)^2





summary(lm(sales ~ adv))



plot(lm(sales ~ adv))







#모형의 적합성 확인
#1.모형의 통계적으로 유의한가? F 통계량의 p값이 0.05보다 작으면 추정된 회귀식은  통계적으로 유의
#2.회귀 계수들의 유의미한가? 해당 계수의 t 통계량값과 p값을 확인 
#3.결정 계수 , 0에서 1사이의 값, 높은 값을 가질수록 추정된 회귀식의 설명력이 높다.


#회귀 모형의 가정(선독등비정)
#1 선형성(독립변수의 변화에 따라 종속변수도 일정 크기로 변화)
#2.독립성(잔차와 독립변수의 값이 관련돼 있지 않음)
#3.등분산성(독립변수의 모든 값에 대해 오차들의 분산이 일정)
#4.비상관성(관측치들의 잔차들끼리 상관이 없어야 함)
#5.정상성(잔차항이 정규분포를 이뤄야 함)

linear_model<-lm(sales ~ adv)

boxplot(linear_model$residuals)

plot(lm(sales ~ adv))

#Residuals vs Fitted
#그래프에서 x축은 회귀모형을 통해 예측된 y값이며, y축은 잔차를 나타낸다.
#선형회귀 모형은 오차가 정규분포를 따른다는 정규성을 가정하므로, 이 그래프에서 오차의 분포는 기울기가 0인 직선의 형태를 가지는 것이 이상적이다. 

#Normal Q-Q plot은 표준화된 잔차의 확률도, 정규성 가정을 만족한다면 45도 각도의 직선을 이루는 형태를 띄어야 한다.

#Scale-Location plot에서 x축은 회귀모형을 통해 예측된 y값이며, y 축은 표준화된 잔차를 나타낸다.
#첫번째 그래프와 마찬가지로 기울기가 0 인 직선의 형태가 관측되는 것이 이상적이다.
#해당직선에서 멀리 떨어진 점이 있다면, 그 지점에서 회귀모형이 y값을 잘 예측하지 못함을 나타낸다. 또한 이 점은 이상치일 가능성이 있다. 




#Residuals vs Leverage
#x축은 레버리지, y축은 표준화된 잔차값
#레버리지란 관측치가 다른 관측치 집단으로부터 떨어진 정도를 나타내며 설명변수가 얼마나 극단에 치우쳐 있는지를 보여준다.
#그래프의 상단과 하단에는 쿡의 거리가 빨강색 선으로 표현되어 있다. 쿡의 거리가 0.5이상인 빨간 점선의 밖에 있는 점은
#예측치를 크게 벗어난 관측치이다.



#문제
#MASS 패키지에 제공하는 Cars93데이터의 엔진크기(EngineSize)를 독립변수, 가격(Price)를 종속변수로 설정하여
#단수 선형 회귀 분석을 실시한 후, 추정된 회귀 모형에 대해 해석해보시오....










#미션5
#Age, Overall, Height_cm, Weight_lb가 Value에 영향을 미치는지 알아보는 회귀분석을
#단계적 선택법을 사용하여 수행하고, 결과를 해석하시오.


















