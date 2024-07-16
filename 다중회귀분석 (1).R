# 다중  회귀분석

set.seed(1234)
x1<-runif(10, 0, 11)
x2<-runif(10,11,20)
x3<-runif(10, 1, 30)


y<-3+0.1*x1+2*x2-3*rnorm(10,0,0.1)

df<-data.frame(y, x1, x2, x3)
df

m<-lm(y~x1+x2+x3, data=df)
m

summary(m)

# MASS 패키지에는 Diet 를 적용한 닭에 대한 데이터가 들어 있음.

install.packages("MASS")
library(MASS)

head(ChickWeight)

chick<-ChickWeight[ChickWeight$Diet==1,]
chick


chick<-ChickWeight[ChickWeight$Chick==1,]

# 시간의 경과에 따른 닭들의 무게를 단순회귀 분석
lm(weight~Time, chick)

m1<-lm(weight~Time, chick)
summary(m1)


data(cars)
head(cars)

mm<-lm(dist~speed, cars)
summary(mm)
plot(mm)

nrow(cars)

women
plot(weight~height, data=women)

fit<-lm(weight~height, data=women)
fit

plot(fit)


#### 다항 회귀모형 ####
fit2<-lm(weight~height+I(height^2), data=women)
plot(fit2)

### 다중 회귀모형 ####
state.x77


states<-as.data.frame(state.x77[, c("Murder", "Population","Illiteracy","Income","Frost")])
states

fit <- lm(Murder~Population+Illiteracy+Income+Frost, data=states)
plot(fit)
summary(fit)

install.packages("car", dependencies=TRUE)
library(car)

vif(fit)
sqrt(vif(fit))






