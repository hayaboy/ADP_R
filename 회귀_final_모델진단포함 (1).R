data(cars)
head(cars)

mm<-lm(dist~speed,cars)
summary(mm)
#R(결정계수) 65% 설명력
#70%이하이기 때문에 진단이 필요

#잔차(Residual)
plot(mm)

#Residuals vs Fitted(x축 제동거리)
#1 선형성이 없다고 판단(오차의 평균이 0 에 가까워야 함), 선형회귀에서 오차는 평균값이 거의 0임

#2 Normal Q-Q
# 잔차들이 정규성을 잘 따르는지 (거의 일직선상에 있어야 함!)

#3 Scale-Location
#기울기가 0인 경우 가장 이상적인 형태(등분산성, 일직선)

#4 이상치(무작정 제거하면 안되고 신중하게 판단 해야 함!)
#"""
#• 이상치(outlier): 회귀모형으로 잘 예측되지 않는 관측치(즉 아주 큰 양수/음수의 residual)
#23,49,39의 값은(2와 -2범위를 벗어남, 정규분포 곡선 참조, 1.96은 2로 변경)

#• 큰지레점(high leverage point): 비정상적인 예측변수의 값에 의한 관측치. 즉 예측변수의 이상치로 볼 수 있다. 종속변수의 값은 관측치의 영향력을 계산하는 데 사용하지 않는다.
#큰 지렛점 hat = P/n    ( 인수개수(y절편포함) / n    )   y=ax+b   인수개수 2/전체 샘플의 개수, hat값의 2배에서 3배 큰 값인 경우 이상치이기때문에 유의깊게 살펴봐야함
# cars는 50개 이므로  2/50=0.04의 2배나 3배인 0.12인 값(여기서는 표기 안됨)

#• 영향관측치(influential observation): 통계 모형 계수 결정에 불균형한 영향을 미치는 관측치로 Cook’s distance라는 통계치로 확인할 수 있다.
#D statistics(Cook’s distance) : D >  4/n-k-1              n은 샘플 크기, k는 (독립 변수)의 수(빨간 라인안에 값이 들어가면 불안정한 모형)



#"""





women
#미국 여성 키, 몸무게

fit<-lm(weight ~ height, data=women)
fit

#weight = 3.45height - 87.52

#먼저 이 회귀식이 적합한 회귀 모형인지 진단

plot(fit)
#1. 선형선 판단(곡선 형태, 특정한 형태의 트렌드를 이루고 있기에 선형성을 만족하지 않음)
#2. 정규 분포(직선상에 있어야 하는데 벗어나는 형태를 띔, 잔차에 대한 정규성을 위배한다., 모델로 사용하기 애매)
#3. 등분산성(등분산성은 어느 정도 만족)
#4. 이상치
  # -Cook's distance값 있어 불안정한 형태 D >  4/n-k-1        4/15-1-1    4/13=

4/13

length(women$weight)


?I

#https://thebook.io/006723/ch08/03/04/


x <- 1:1000

y <- x^2 + 3 * x + 5 + rnorm(1000)

lm(y ~ I(x^2) + x)
lm(y ~ x^2)

#위 코드에서는 1 ~ 1000 값을 가진 x로부터 종속 변수 y를 만들었다. 그 뒤 formula에 y ~ I(x^2) + x를 지정해 계수를 찾았다.

#I(x^2) 대신 x^2를 사용하면 에러는 발생하지 않지만 전혀 다른 결과를 얻게 된다.

#그 이유는 lm에 formula 인자로 주어진 x^2는 x × x기 때문이다. x × x는 x + x + x:x와 같은 의미로, ‘x 변수, x 변수, x와 x의 상호 작용’을 의미한다. 이에 대해서는 ‘4.5.1 summaryBy( )’ 절의 ‘포뮬러 해석하기’에서 포뮬러의 일반적인 모양을 설명하며 알아본 바 있다. 상호 작용에 대해서는 ‘8.3.6 상호 작용’ 절에서 다시 다룬다.

#다음은 Y = 3(X1 + X2) + ε의 예다.


x1 <- 1:1000

x2 <- 3 * x1
y <- 3 * (x1 + x2) + rnorm(1000)
lm(y ~ I(x1 + x2))


lm(y ~ x1 + x2)

###다항회귀모형으로 

plot(weight~height, data=women)

fit2<-lm(weight~height+I(height^2), data=women)

plot(fit2)

#살펴보니 단순 회귀모형보다는 적합하다고 판단가능
#OLS라고 하는 방법(원리)에 의하여 전형적인 회귀 진단 방ㅂ

#독립성 검정은 설계 단계에서 진행 
#회귀진단하기 위한 4가지 시각화 분석 도구 정리





### 다중 회귀 모형

state.x77

nrow(state.x77)
str(state.x77)
#살기 좋은 주(미국은 50개 주)
#Illiteracy 문맹률, 
colnames(state.x77)



states<-as.data.frame(state.x77[, c("Murder","Population","Illiteracy", "Income","Frost")])

states


fit<-lm(Murder ~ Population+Illiteracy+Income+Frost, data=states)
summary(fit)

#적합한 모형인지 진단
#다중 회귀 모형 중에 중요한 개념 
#다중공선선 여부 확인하여 (VIF의 제곱근이 2보다 큰 값이 나오는 경우 다중 공선성에 문제가 있다고 하고 해당 인자를 제거하는 것이 바람직하다.)  해결 후 진단



"다중공선성(multicollinearity)란 독립 변수의 일부가 다른 독립 변수의 조합으로 표현될 수 있는 경우이다. 독립 변수들이 서로 독립이 아니라 상호상관관계가 강한 경우에 발생한다."
"다중 공선성을 없애는 가장 기본적인 방법은 다른 독립변수에 의존하는 변수를 없애는 것이다. 가장 의존적인 독립변수를 선택하는 방법으로는 분산 팽창 요인VIF(Variance Inflation Factor)를 사용할 수 있다."
# 예를 들면 악력을 보고자 할 때, 예측 변수(독립, 설명)가 1) 나이 2)생년월일 3)몸무게일 경우 나이와 생년월일은 상관관계가 강해 다중 공선성 문제 발새
# 예측 변수가 서로 연관되어(다중 공선성) 있을 경우 다중 회귀 모형 성공하기가 힘들다., 서로 회귀 계수에 영향을 미침


#VIF의 제곱근이 2보다 큰 값이 나오는 경우 다중 공선성에 문제가 있다고 하고 해당 인자를 제거하는 것이 바람직하다.
#VIF는 4

install.packages("car")

vif(fit)
#4보다 큰 값이 없으므로 제거할 필요가 없다.
sqrt(vif(fit))
#2보다 큰 값이 없으므로 제거할 필요가 없다. 다중 공선성이 문제가 없다.

#이제 진단을 해봅시다.


plot(fit)
#선형성 분포 잘 되어 있음
#잔차에 대한 정규분포도 이상없음, 네바다 이상치
#등분산성도 좋고
#이상치 


#### 최적 회귀 방정식의 선택: 설명변수의 선택###


#단계별 선택방법



# backward stepwise regression(backward selection(elimination))
#모든 예측 변수 포함 후 p value가 높은 놈부터(영향력이 없는 놈부터 ) 제거
# 빼면 뺄수록 AIC 값이 작아지면 점점 모델 복잡도가 낮아짐








states
full.model<-lm(Murder~., data=states)
summary(full.model)
#설명력 52%

full.model1<-lm(Murder~Population+Illiteracy, data=states)

summary(full.model1)
#설명력 54%


full.model2<-lm(Murder~Population+Illiteracy+Income, data=states)
summary(full.model2)

#설명력 53%



# AIC(Akaike's an Information Criterion)
AIC(full.model, full.model1, full.model2)
#점수가 가장 낮은 놈을 선택


reduced.model<-step(full.model, direction="backward")
#하나씩 제거
summary(reduced.model)


# Forward stepwise regression

min.model<-lm(Murder~1, data=states)
#1은 상수부터 출발(즉, y 절편)
fwd.model<-step(min.model, scope=(Murder~Population+Illiteracy+Income+Frost),direction="forward")
summary(fwd.model)


# Stepwize regression
both.model<-step(full.model, direction="both")
#전진, 후진을 번갈아 가면서 사요
summary(both.model)

# all subset regression 모든 가능한 조합의 회귀분석
# 전진으로 조합하다가 뒤에 조합이 더 좋은 경우가 발생할 경우를 하지 않고  멈추버릴 경우 가 있기에 그런 경우가 안나오도록 
library(leaps)
leap<-regsubsets(Murder~Population+Illiteracy+Income+Frost, data=states, nbest=2)
#nbset은 가장 좋은 모형 2개를 표시하겠다.

plot(leap, scale="adjr2")

#y축 설명력(수정된 R제곱)
# 변수들끼리 조합에 따른 설명력 Population+Illiteracy 55%

plot(leap, scale="bic")
#가장 적은값이 가장 좋은 변수 조합 