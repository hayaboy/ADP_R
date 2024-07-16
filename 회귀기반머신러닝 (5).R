read.csv(file.choose())

#R에서는 변수 할당(assignment)시 <-

sales_df<-read.csv(file.choose())

#R에서는 데이터프레임의 형태로 데이터를 탐색

x<-sales_df$광고비

y<-sales_df$매출액


is(x)

# 우선 주요 변수의 상관을 봐라.


#추정(점, 구간 추정)

#내일 코로나 환자 수 예측해봐라~~~ 2000명   
#내일 코로나 환자 수 예측해바라~~~ 1800 ~2100명

#통계학에서 모 평균, 모 표준 편차, 모 분산 등 모집단의 데이터를 말한다.
#추정치(estimate):모수를 추정하기 위해 선택된 표본을 대상으로 구체적으로 도출된 통계량


# 상관이 70%이상이면 회귀분석을 해도 무리가 없다.
# 그 회귀 모델이 유의한지 검정을 해야, 그 모델로 예측을 해도 사람들에게 신뢰도를 줄 수 있다. 


#평균
mean(x)
mean(y)
#분산
var(x)
var(y)
#공분산
cov(x,y)
#상관
cor(x,y)

#상관의 제곱(r square)

cor(x,y)^2

# 회귀모델 만드는 함수

?lm

lm(종속변수(x) ~ 독립변수(x) )

~ tilde

?summary

summary(lm(y ~ x))


#상관계수에 대한 유의성(significance)을 판단하자..

#유의성의 확률 有意性의確率 (수학)
#어떤 값에 대하여 그것이 실제로 관측되는 값과 같은 정도이거나 또는 그 이상으로 유의 수준인 확률.


#통계적 유의성 統計的有意性 
#모집단에 대한 가설(hypothesis)이 갖는 통계적 의미를 이르는 말.
#어떤 가설이 통계적 유의성을 갖는다는 것은 그 가설이 단순한 우연이 아니라 의미를 갖는다는 것을 뜻한다.



#여러분이 마시는 음료는 500 ml이다. (1년에 50만개를 만든다.)

#실제로 이 음료가 500 ml인지 직접 음료수의 양을 측정해봤더니 480ml였다.

#1. 언론사에 이 음료는 500ml가 아니다. 무작정 신고하는 것이 아닌..

#가설을 세우고 그 것에 대한 검정을 해서 기다 아니다.라는 식으로 주장을 해야 바른 주장이 된다.

#가설(hypothesis)주어진 사실 혹은 조사하고자 하는 사실이 어떠하다는 주장이나 추측

#모수를 추정할 때, 모수가 어떠하다(혹은 어떠할 것이다)는 조사자의 주장이나 추측을 일컬음



#가설을 다음 두 가지로 세울 수 있다.
#귀무(차이가 없다)가설, 대립(대립되는) 가설


#귀무가설(null, 영) : 모든 이 음료수의 평균 양은 500ml이다.  (지금까지 알고 있는 사실과 다름이 없는 것) H0

#귀무가설을 증명하기 위한 조사는 하지 않는다. 
#연구 목적이 되는 가설에 상반되는 의미를 가지는 가설이므로  귀무가설 자체를 연구해도 어떤 의미를 찾아내긴 어렵기 때문이다.




#위에서 여러분이 주장하고자 하는 가설은 바로 대립가설이다.

# 귀무(차이가 없다)가설 H0: 스포츠 이온 음료의 용량은 제품에 표기된 500ml이다.
#대립가설(연구,대안(alternative)) : 모든 이 음료수의 평균 양은 500ml가 아니다.!!!!!!
#이 말을 다른말로 표현하면 500ml보다 작다.  또는 크다 일 수도 있다.

# 둘 다 검정하는 것을 양측 검정이라하고, 한 쪽만 검정하는 것을 단측검정이라고 한다.





#유의성 검정 有意性檢定 
#회귀 분석에서 각 독립 변수(광고금액)와 종속 변수(매출액)의 관련 정도가 통계적으로 유의한지를 밝히는 검정.


plot(x,y)


summary(lm(y ~ x))

library(MASS)

studres(lm(y ~ x))

summary(stdres(lm(y ~ x)))

summary(studres(lm(y ~ x)))



linear_model<-lm(y ~ x)

summary(linear_model$residuals)



#read.csv("파일이 있는 경로")


child_parent_height<-read.csv(file.choose())

#str는 structure

?str

str(child_parent_height)

x<-child_parent_height$parent
y<-child_parent_height$child

#formula 식    종속 변수 ~ 독립변수

# lm()

lm( y ~ x )

plot(x,y)


summary(lm( y ~ x ))




#다중 선형 회귀




boston<-read.csv(file.choose())

str(boston)

# y ~ 변수1 + 변수 2 ....변수 n

boston$MEDV

lm(MEDV ~ . , data=boston)

summary(lm(MEDV ~ . , data=boston))

#회귀 모형의 가정(선독등비정)
#1 선형성(독립변수의 변화에 따라 종속변수도 일정 크기로 변화)
#2.독립성(잔차와 독립변수의 값이 관련돼 있지 않음)
#3.등분산성(독립변수의 모든 값에 대해 오차들의 분산이 일정)
#4.비상관성(관측치들의 잔차들끼리 상관이 없어야 함)
#5.정상성(잔차항이 정규분포를 이뤄야 함)

plot(lm(MEDV ~ . , data=boston))


lm_model<-lm(MEDV ~ . , data=boston)

head(lm_model$residuals)

