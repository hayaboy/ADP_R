


install.packages("MASS")
?MASS


MASS::Cars93
str(Cars93)
attach(Cars93)

lmodel<-lm( Price ~ EngineSize + RPM + Weight, data = Cars93)

summary(lmodel)
nrow(Cars93)




install.packages("boot")
boot::nodal
?nodal

str(nodal)


?glm

glm( r ~ . , family = 'binomial', nodal)

logit_model<-glm( r ~ . , family = 'binomial', nodal)



summary(logit_model)


nodal$xray
nodal$acid
nodal$stage

glm( nodal$r ~  nodal$stage + nodal$xray + nodal$acid, family = "binomial")

data1<-iris[iris$Species=='setosa' | iris$Species=='versicolor', ]

str(data1)
tail(data1,10)

levels(data1$Species)

data1[data1$Species=='virginica', ]

is(data1$Species)

data1$Sepal.Length

glm(data1$Species ~ data1$Sepal.Length, family='binomial', data=data1)

is(data1$Species)



log_model<-glm(data1$Species ~ data1$Sepal.Length, family='binomial', data=data1)

summary(log_model)

exp(5.14)
?exp
#Sepal.length가 한 단위 증가함에 따라 
# versicolor일 odds가 exp(5.14)이므로 약 170배 증가함을 알 수 있다. 

#Null deviance는 절편만 포함하는 모형의 완전모형으로부터의 이탈도(deviance)

#Residual deviance
#Sepal.length가 추가된 적합모형의 이탈도 


coef(log_model)

?confint

predict(log_model, newdata = data1[c(1,50,51,100), ], type = "response")
?predict


?cdplot()
data1$Sepal.Length
data1$Species

cdplot(data1$Species~data1$Sepal.Length, data = data1)

rm(list=ls())

a<-subset(iris, Species=='setosa' | Species =='versicolor')

is(a$Species)
a$Species<-factor(a$Species)
is(a$Species)
a$Species
glm(Species ~ Sepal.Length, family = "binomial", data=a)

cdplot(Species ~ Sepal.Length, data=a)


pred

str(a)

plot(a$Sepal.Length, a$Species)

x<-seq(min(a$Sepal.Length), max(a$Sepal.Length),0.1)


lines(x, 1+ 1/(1 + exp((-1)*(5.14*x -27.83 ))), type = 'l',col='red')



rm(x)

x1<-c(7,1,11,11,7,11,3,1,2,21,1,11,10)
x2<-c(26,29,56,31,52,55,71,31,54,47,40,66,68)
x3<-c(6,15,8,8,6,9,17,22,18,4,23,9,8)
x4<-c(60,52,20,47,33,22,6,44,22,26,34,12,12)
y<-c(78.5,74.3,104.3,87.6,95.9,109.2,102.7,72.5,93.1,115.9,83.8,113.3,109.4)


df<-data.frame(x1,x2,x3,x4,y)

df

lm(y ~ x1+x2+x3+x4, data = df)

a<-lm(y ~ x1+x2+x3+x4, data = df)

summary(a)

b<-lm(y ~ x1+x2+x4, data = df)
summary(b)

c<-lm(y ~ x1+x2, data = df)
summary(c)


??vif

#벌점화 전진 선택법 
?step()

#1은 상수항을 의미 
step(lm(y ~ 1, data=df), scope=list(lower=~1,upper=~x1+x2+x3+x4), direction = "forward")


install.packages("ElemStatLearn")

ElemStatLearn::prostate



str(prostate)


Data<-prostate

data.use<-Data[ , -ncol(prostate)]
?prostate




lm.full.model<-lm( lpsa ~ . , data = data.use)


lm.full.model


summary(lm.full.model)


?step
lpsa



###이 방식으로 사용할 것을 권장 
#step(lm(종속변수 ~ 독립변수 , 데이터 셋트 ), scope=list(lower=~1, upper=~독립변수), direction='변수 선택 방법')

# 1) lm(종속변수 ~ 독립변수 , 데이터 셋트 )은 우리가 사용할 분석 방법은 #회귀분석임
#2) scope는 분석할 때 고려할 변수의 범위를 정한다.
# 가장 낮은 단계는 lower에서 ~ 1을 입력하면 상수항을 의미하고,
# 가장 높은 단계를 설정하기 위해서는 독립변수들을 모두 써주면 된다.
# direction은 변수 선택 방법이다.ㅣ 선택 가능한 옵션은 
# forward, backward, both가 있다.

step(lm.full.model, lpsa~1 ,   direction = "backward")


step(lm.full.model, lpsa~1 ,   direction = "both")





