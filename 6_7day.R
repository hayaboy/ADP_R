
#단순 회귀
adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)



adv
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104	,105,	121)

length(sales)


plot(adv, sales)



#formula  종속변수 ~ 독립변수

#lm(formula)

linear_model<-lm(sales ~ adv)

# y=  2.186  * x + 62.929



summary(lm(sales ~ adv))


cor(adv, sales)^2



#모형의 적합성 확인
#1.모형의 통계적으로 유의한가? F 통계량의 p값이 0.05보다 작으면 추정된 회귀식은  통계적으로 유의
#2.회귀 계수들의 유의미한가? 해당 계수의 t 통계량값과 p값을 확인 
#3.결정 계수 , 0에서 1사이의 값, 높은 값을 가질수록 추정된 회귀식의 설명력이 높다.


plot(lm(sales ~ adv))

#회귀 모형의 가정(선독등비정)
#1 선형성(독립변수의 변화에 따라 종속변수도 일정 크기로 변화)
#2.독립성(잔차와 독립변수의 값이 관련돼 있지 않음)
#3.등분산성(독립변수의 모든 값에 대해 오차들의 분산이 일정)
#4.비상관성(관측치들의 잔차들끼리 상관이 없어야 함)
#5.정상성(잔차항이 정규분포를 이뤄야 함)


boxplot(linear_model$residuals)


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







#의사 결정 나무

?rm
rm(list=ls())



data("iris")


n<-nrow(iris)

n


sample(c(1,2,3), 2)


c

1:n

?sample

train.idx<-sample(1:n, n*2/3)



train<-iris
head(train)
test<-iris[ -train.idx , ]



head(test)

nrow(train)

nrow(test)

install.packages("tree")
library(tree)


?tree



colnames(train)


# formula     종속변수 ~ 독립변수 ( 여러개일 때 .)

tree_model<-tree(Species ~ . , data = train)

summary(tree_model)


plot(tree_model)


text(tree_model)


?cv.tree()

?prune.misclass


plot(cv.tree(tree_model, FUN = prune.misclass))




#최적 의사 결정 트리
?prune.misclass()


prune.misclass(tree = tree_model, best =3)


best_tree_model<-prune.misclass(tree = tree_model, best =3)



best_tree_model



plot(best_tree_model)
text(best_tree_model)

#다중회귀


#최적 회귀 방정식의 선택:설명 변수의 선택
# 여기서 y의 변화를 회귀방정식으로 표현하고 설명하기 위해 필요한 설명변수들을 어떻게 선택해야 할 것인가를 고려
# 변수를 선택해 회귀모형을 설정해 주는 데는 다음의 두 가지 원칙을 따름
# 1. y에 영향을 미칠 수 있는 모든 설명변수 x들을 y의 값을 예측하는데 참여시킨다.
# 2. 데이터에 설명변수 x들의 수가 많아지면 관리하는데 많은 노력이 요구되므로, 가능한 범위내에서 적은 수의 설명변수를 포함 


# AIC(Akaike Information Criterion), BIC(Bayesian Information Criterion)의 기준으로 가장 적합한 회귀 모형을 선택
# 주로 AIC 사용
# 이 값이 가장 작은 모형을 최적의 모형으로 선택한다.

#방법1
#모든 가능한 조합의 회귀분석



#방법2
#전진선택법(forward selection), 후진제거법(backward elimination), 단계별 방법(stepwise method)




df<-read.csv(file.choose(), stringsAsFactors = F, na.strings = '?')
str(df)
summary(df)

colnames(df)

df<-na.omit(df)

str(df)

head(df[ , c(-9)])

df3<-df[ , c(-7,-8,-9)]
str(df3)

summary(lm( mpg ~  ., data = df2))


summary(lm( mpg ~  cylinders+displacement+horsepower+weight+acceleration+model.year+origin, data = df2))



lm_model<-lm( mpg ~  ., data = df2)

summary(lm_model)


#단계별 방법(stepwise method)
?step
#step(lm(종속변수 ~ 설명변수, 데이터세트), scope=list(lower=~1,upper=~설명변수),direction=변수 선택방법 )
#scope는 분석할 때 고려할 변수의 범위를 정한다.
#가장 낮은 단계는 lower에서 1을 입력하면 상수항을 의미, 가장 높은 단계를 설정하기 위해서는 설명변수들을 모두 써주면 된다.
#direction은 변수 선택방법(forward,backward,both)

colnames(df3)

step(lm( mpg ~  1,  data = df3), scope = list(lower=~1, upper=~cylinders+displacement+horsepower+weight+acceleration), direction = "both")



summary(lm( mpg ~ weight+ horsepower, data =df3 ))




summary(lm( mpg ~ weight+ horsepower+cylinders, data =df3 ))



