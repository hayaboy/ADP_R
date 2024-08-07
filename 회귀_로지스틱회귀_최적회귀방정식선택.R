?c
vec <- c(166,168,170,172,174)
#R은 인덱싱이 1부터 시작함
mean(vec)



?var()

var(vec)



vec2 <- c(60.0, 50.0 , 66.0 , 52.7 , 68.8 )


sd(vec2)


adv<-c(13,8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104,	105,	121)


cov(adv,sales)

cor(adv,sales)

install.packages("UsingR")

library(UsingR)

data(galton)

View(galton)

# structure
str(galton)


plot(galton$parent, galton$child)

time<-c(2,4,6,8)
score<-c(81,93,91,97)

plot(time,score)

cor(time,score)


한글가
?lm

#formula 식  종속변수  ~ 독립변수 

li_model1<-lm(score ~ time)


summary(li_model1)

#회귀식
y=2.3*x+79

#예측

2.3*10+79
#10시간 공부했을 경우 102점으로 예측


datasets::iris3

iris3

datasets::iris



#로지스틱 회귀

?glm()

datasets::iris

#내장 데이터(datasets) 불러오는 함수
?data
data(iris)


iris[ , ]


remove(list = ls())

#R의 자료구조
#l
#a
#m
#v
#s   f


#y값을 두가지로 하기 위해
# 종을 setosa냐 versicolor

#일부분 추출하는 함수
?subset()

iris$Species

y<-subset(iris, Species=='setosa' | Species=='versicolor')

y$Species

#범주형 데이터로 만드는 함수
?factor()

?glm()

#formula 식  종속변수  ~ 독립변수 

colnames(iris)


#데이터 구조 확인하는 함수
str

str(iris)

#데이터 타입 확인하는 함수

?class

?is

class(iris$Species)

is(iris$Species)

# 로지스틱 회귀 모델 만들기기            

loglm <- glm(Species ~ Sepal.Length  , data = iris, family = 'binomial')


loglm

#
?summary()


summary(loglm)


exp(5.176)



#plot(y$Sepal.Length, y$Species, xlab = "Sepal.Length")

#x<-seq(min(y$Sepal.Length), max(y$Sepal.Length), 0.1)

#lines(x, 1 + (1/(1+(1/exp(-27.829  + 5.176 *x)))), type = 'l', col='red')

plot(y$Sepal.Length, y$Species, xlab = "Sepal.Length")

x<-seq(min(y$Sepal.Length), max(y$Sepal.Length), 0.1)


x

lines(x, 1 + (1/(1+(1/exp(-27.829  + 5.176 *x)))), type = 'l', col='green')


lines(x, 1 + (1/(1+exp(27.829  - 5.176 *x))), type = 'l', col='blue')

#회귀 분석


adv<-c(13,8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104,	105,	121)

?plot

plot(adv, sales)

lm(sales ~ adv)

lin_model<-lm(sales ~ adv)

summary(lin_model)


plot(lin_model)


cor(adv, sales)

cor(adv, sales)^2

#R-squared:  0.7884,

#추정된 회귀식이 어느 정도 측정치들과 일치하는지의 정도

#설명력은 0~1까지의 숫자로 나타내거나 
#몇 %의 설명력을 가지는지 확률로 표현
#𝑅^2 의 값은 1에 근접할수록
#회귀선이 측정치를 잘 반영하고 있다고 할 수 있다. 



#y= 2.186*x + 62.929

#데이터의 양이 많지 않은 상황에서 통계적 데이터 분석 방법을 사용하고 수치를 예측하고자 하는 문제의 경우 
#회귀분석시 체크해야 할 사항
# 선형성 : 독립변수(광고액)의 변화에 따라 종속변수(매출액)도 일정 크기로 변화
# 독립성 : 잔차(오차)는 독립변수의 값과 관련이 없어야 함
# 등분산성 : 독립변수의 모든 값에 대해 오차들의 분산이 일정
# 비상관성 : 관측치들의 잔차들끼리 상권이 없어야 함
# 정상성 : 잔차항이 정규분포를 이루어야 함


#다중회귀, 다항회귀 
#최적 회귀 방정식의 선택 : 설명 변수의 선택
#1) 모든 가능한 조합의 회귀 분석
#2) 단계적 변수 선택 ( 전진 선택법(forward selection), 후진 제거법(backward), 단계별 방법(stepwise)))

scores<-c(42,	69,	56,	41,	57,	48,	65,	49,	65,	58)

?quantile()

quantile(scores, 0.25)
quantile(scores, 0.75)

63.25 - 48.25


IQR(scores)
#사분위수 구할 때 python, R은 quantile
#엑셀과 맞추고자 할 경우 type=6


IQR(scores, type = 6)

rm(list=ls())

df<-read.csv(file.choose())




rm(list=ls())

X1<-c(7,1,11,11,7,11,3,1,2,21,1,11,10)
X2<-c(26,29,56,31,52,55,71,31,54,47,40,66,68)
X3<-c(6,15,8,8,6,9,17,22,18,4,23,9,8)
X4<-c(60,52,20,47,33,22,6,44,22,26,34,12,12)
Y<-c(78.5,74.3,104.3,87.6,95.9,109.2,102.7,72.5,93.1,115.9,83.8,113.3,109.4)
df<-data.frame(X1,X2,X3,X4,Y)
df


str(df)


#회귀 분석
#10분
#회귀식 제출

?lm


lm(Y ~ ., data = df)
# lm(Y ~ X1 + X2 + X3 + X4, data = df)

#다중회귀
lm(Y ~ X1 + X2 + X3 + X4, data = df)

# 첫 번째 회귀식 
# y = 1.5511 * x1 + 0.5102 * x2 + 0.1019 * x3 -0.1441 *x4   +  62.4054


summary(lm(Y ~ ., data = df))


lm(Y ~ X1 + X2 +  X4, data = df)
summary(lm(Y ~ X1 + X2 +  X4, data = df))

# 두 번째 회귀식 
# y = 1.4519  * x1 + 0.4161 * x2 -0.2365 * x4   + 71.6483 




lm(Y ~ X1 + X2 , data = df)
summary(lm(Y ~ X1 + X2 , data = df))

#최종 회귀식 
# y = 1.4683  * x1 + 0.6623 * x2  + 52.5773 

#위가 바로 후진 제거법을 수동으로 변수 제거를 진행함
#이런 방법은 변수의 수가 많을 때는 번거로울 수 있다. 

#단계별 변수 선택의 방법을 자동으로 수행해주는 명려어는아래와 같음
#step(lm(종속변수 ~ 설명변수 , 데이터세트), scope=list(lower= ~ 1, upper= ~ 설명변수 ), direction="변수 선택 방법")
?step
#변수 선택 방법 "both", "backward", "forward"


#전진 선택법


step(lm(Y ~ 1, df), scope=list(lower= ~ 1, upper= ~ X1 + X2 + X3 + X4 ), direction = "forward")
# 전진 선택법을 통한 최종 회귀식
# y = 1.4519  * x1 + 0.4161 * x2  - 0.2365 * x4 + 71.6483 

#AIC

#Akaike 정보 기준 ( AIC )은 예측 오류 의 추정기 이므로 주어진 데이터 세트에 대한 통계 모델 의 상대적 품질 입니다. [1] [2] [3] 데이터에 대한 모델 모음이 주어지면 AIC는 다른 각 모델과 비교하여 각 모델의 품질을 추정합니다. 따라서 AIC는 모델 선택 수단을 제공합니다 .

#AIC는 정보 이론을 기반으로 합니다 . 데이터를 생성한 프로세스를 나타내기 위해 통계 모델을 사용할 때 그 표현은 거의 정확하지 않습니다. 따라서 프로세스를 나타내는 모델을 사용하면 일부 정보가 손실됩니다. AIC는 주어진 모델에 의해 손실된 정보의 상대적인 양을 추정합니다. 모델이 손실하는 정보가 적을수록 해당 모델의 품질이 높아집니다

#단계적 방법을 적용하여 모형을 선택하시오

step(lm(Y ~ 1, df), scope=list(lower= ~ 1, upper= ~ X1 + X2 + X3 + X4 ), direction = "both")


#MASS 패키지의 hills 데이터를 이용하여, step 함수를 이용해 전진 선택법을 적용하시오..
#회귀식은?
#이 때 time이 종속 변수

library(MASS)
MASS::hills
hills

str(hills)


step(lm(time  ~ 1, hills), scope=list(lower= ~ 1, upper= ~ dist + climb ), direction = "forward")


time = 6.21796 * dist +   0.01105 * climb     -8.99204 








