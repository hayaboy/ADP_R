#R에서 로지스틱 회귀 모형은 glm() 함수를 이용

data(iris)
iris
a<-subset(iris, Species=="setosa" |Species== "versicolor" )

#Species는 factor(범주형 변수)로 setosa는 Y=1, versicolor는 Y=2로 인식

a
class(a$Species)
a$Species<-factor(a$Species)
str(a)
?glm
b<-glm(Species~Sepal.Length, data=a, family = binomial)
summary(b)
#회귀 계수의 검정에서 p값이 거의 0이므로 Sepal.Length가 매우 유의한 변수이며
#Sepal.Length가 한 단위 증가함에 따라  versicolor(Y=2)일 오즈가
#exp(5.140)=170 배 증가함을 알수 있다.


#Null deviance(편차값): 절편만 포함하는 모형의 완전모형으로부터의이탈도(deviance)


coef(b)
exp(coef(b)["Sepal.Length"])
confint(b, parm="Sepal.Length")
exp(confint(b, parm="Sepal.Length"))

#fitted()함수를 통해 적합 결과 확인
fitted(b)[c(1:5,96:100)]

#predict()함수를 이용하여 새로운 자료에 대한 예측 수행
predict(b,newdata = a[c(1,50,51,100), ], type="response")

#cdplot() 함수는 Sepal.Length(연속형변수)의 변화에 따른 범주형 변수

cdplot(Species~Sepal.Length, data=a)
#정리 Sepal.Length가 커짐에 따라 versicolor의 확률이 증가





data(mtcars)
dat <- subset(mtcars, select=c(mpg, am, vs)) 
dat

log_reg <- glm(vs ~ mpg, data=dat, family="binomial") 
log_reg



summary(log_reg)




#분류분석

#로지스틱 회귀 모형

#1-1단순 로지스틱 회귀
#glm()함수 이용

#범주가 2개인 로지스틱 회귀를 적용하기 위해 iris 자료의 일부분만 이용


str(iris)

iris$Species
range(iris$Species)
table(iris$Species)
a<-subset(iris, Species=="setosa" | Species=="versicolor")
a
str(a)

a$Species


a$Species<-factor(a$Species)
str(a$Species)

#setosa 세토사로 분류될 결과 Y=1, versicolor는 Y=2

?glm

a$Sepal.Length

b<-glm(Species ~ Sepal.Length, data=a, family = binomial)
summary(b)
# p 값이 거의 영에 가까우므로 Sepal.Length가 매우 유의한 변수

#  y= 5.140 *  Sepal.Length   -27.831

# 로그 log(y) = e ^ (5.140 *  Sepal.Length   -27.831)

exp(5.140) 

#Sepal.Length가 한 단위 증가함에 따라 
#versicolor(Y=2)오즈(성공확률이 실패 확률에 비해 얼마나 높은가)
#exp(5.140) =170 배 증가함을 알 수 있다.
?exp

coef(b)

?confint
confint(b,parm="Sepal.Length")

exp(confint(b,parm="Sepal.Length"))
fitted(b)[c(1:5, 96:100)]

predict(b, newdata = a[c(1,50,51,100), ], type = "response")


cdplot(Species ~ Sepal.Length, data=a)



plot(a$Sepal.Length, a$Species, xlab="Sepal.Length")
x<-seq(min(a$Sepal.Length), max(a$Sepal.Length), 0.1)
lines(x, 1+(1/(1+(1/exp(-27.831+5.140*x)))), type="l",col="red")








