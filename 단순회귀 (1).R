


b_s<-c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,76,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)
a_s<-c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)
length(b_s)
length(a_s)

summary(b_s)
summary(a_s)
data.frame(b_s,a_s)
boxplot(b_s,a_s)





#  한집단을 두번 테스트해서 두개의 대응하는 집단

# 쌍체 t 검정을 해야함... t검정을 하기 위해서
# 정규 분포를 따른다는 가정이 필요하다.
#정규 분포를 따르는지 확인하는 검정은 
#shapiro-wilk 검정


# 귀무 : 정규분포를 따른다.

stats::shapiro.test()

shapiro.test(b_s)


#두 개의 집단의 경우 분산이 동일함을 가정

?var.test

var.test(b_s,a_s)

#귀무 : 분산이 동일하다




t.test(b_s,a_s, paired = T, alternative = 'less')





v1<-c(75,67,78,81,53,71,71,55,40,78,76,42,67,98,59,63,84,50,67,80,83)
v2<-c(58,81,77,80,76,63,54,64,85,54,70,71,71,55,40,78,76,100,51,42,63,61,82,57,48)


m1<-mean(v1)
m2<-mean(v2)

m1-m2

mean(v1-m1)
sd(v1-m1)

ad<-c(13,8,10,15,12,15,14,15,17,19,20,21,22,21,25)
sales<-c(94,70,90,100,95,100,85,95,105,105,110,105,104,105,121)

lm_model<-lm(sales ~ ad)

summary(lm_model)

#Residuals(잔차) : 표본에서 나온값이 회귀선과 비교해볼 때 나타나는 차이

#R-squared(결정계수):  0.7884 이 회귀식은 78.8%의 설명력을 가진다. 

#Adjusted R-squared : 모델에 반영되는 독립변수의 숫자가 증가함에 따라 결정계수가 커시는 성향이 #있는데 이를 조절하기 위함 

# 회귀식 y=2.186x + 62.929

#F 통계량은 이 모델의 신뢰성 검증, p값이 0.05보다 작아야 유의하다.
#p값이 0.05보다 작으면 기울기가 0이 될 확률이 낮다.



#############모델의 적합성 판정###############################

plot(lm_model)

#1 Residuals vs Fitted(잔차 분포 그래프)
# 실제값과 예측값을 나타내는 그래프로서 빨간선의 
#기울기가 0에 가까울수로 좋은 모델이다.
#특정 패턴 없이 골고루 산포되어 있어야 좋다.

#2 Normal Q-Q
# 실제값과 예측값의 차이(잔차)가 정규분포를 따르는지를
#확인하는 그래프로서, 정규성을 만족한다면 잔차들이 점선에 
#놓여 있어야 한다.


#3 Scale-Location(잔차 등분산성)
# 잔차를 표준화해서  제곱근한 그래프 빨간선의 기울기가
#0에 가까울 수록 좋은 모델

#4 Residuals vs Leverage(잔차 대 영향력)
#(이상관측치(outlier), 큰 지렛점)
#패턴을 벗어난 잔차들이 존재하는지 파악하는 그래프
#이상치를 표현하는 그래프로서 빨간 점선 안에 점들이 들어있지
#않을 수록 좋은 모델이다.

##########단순회귀 연습##############

str(cars)

?lm

lm(  cars$dist ~  cars$speed)






lm_model2<-lm(  cars$dist ~  cars$speed)


is(lm_model2)


lm_model2$coefficients
lm_model2$residuals




#도출된 회귀식 




x1<-cars$speed[1]

y<-3.932409*x1 -17.579095

cars$dist

y-cars$dist[1]


lm_model2$effects

summary(lm_model2)

#Residuals(잔차) : 표본에서 나온값이 회귀선과 비교해볼 때 나타나는 차이

#R-squared(결정계수):  0.6511 이 회귀식은 65.1%의 설명력을 가진다. 

#Adjusted R-squared : 모델에 반영되는 독립변수의 숫자가 증가함에 따라 결정계수가 커시는 성향이 #있는데 이를 조절하기 위함 

# 회귀식 y=3.9324x - 17.5791

#F 통계량은 이 모델의 신뢰성 검증, p값이 0.05보다 작아야 유의하다.
#p값이 0.05보다 작으면 기울기가 0이 될 확률이 낮다.

?par
par(mfrow=c(2,2))

plot(lm_model2)


#1 Residuals vs Fitted(잔차 분포 그래프)
# 실제값과 예측값을 나타내는 그래프로서 빨간선의 
#기울기가 0에 가까울수로 좋은 모델이다.
#특정 패턴 없이 골고루 산포되어 있어야 좋다.

#2 Normal Q-Q
# 실제값과 예측값의 차이(잔차)가 정규분포를 따르는지를
#확인하는 그래프로서, 정규성을 만족한다면 잔차들이 점선에 
#놓여 있어야 한다.


#3 Scale-Location(잔차 등분산성)
# 잔차를 표준화해서  제곱근한 그래프, 빨간선의 기울기가0에 가까울 수록 좋은 모델

#4 Residuals vs Leverage(잔차 대 영향력)
#(이상관측치(outlier), 큰 지렛점)
#패턴을 벗어난 잔차들이 존재하는지 파악하는 그래프
#이상치를 표현하는 그래프로서 빨간 점선 안에 점들이 들어있지
#않을 수록 좋은 모델이다.


speed2<-c(50,60,70,80,90,100)


df2<-data.frame(speed2)


df2

?predict

lm_model2<-lm(cars$dist ~  cars$speed)

cars

lm_m<-lm(dist~speed, data = cars)

predict(lm_m,df2)



rm(list=ls())

data(cars)

cars
cars$speed
cars$dist

li_result<-lm(dist ~ speed , data=cars)

speed<-c(50,60,70,80,90)

speed<-data.frame(speed)
speed

pred_dist<-predict(li_result,speed)

speed
pred_dist<-data.frame(pred_dist)

cbind(speed, pred_dist)


?predict
pr<-predict(li_result, speed, interval = "confidence", level = 0.95)



cbind(speed, pr)


predict(li_result, speed, interval = "prediction", level = 0.95)




str(iris)

str(iris3)
is(iris3)

nrow(iris)


iris[1:50,]

iris[51:100,]
iris[101:150,]

levels(iris$Species)


nrow(iris[iris$Species=="setosa" , ])
nrow(iris[iris$Species=="versicolor" , ])
nrow(iris[iris$Species=="virginica" , ])

table(iris$Species)

install.packages("caret")

createDataPartition(iris$Species, p=0.8)


150*0.8

createDataPartition(iris$Species, p=0.8)

iris_row<-createDataPartition(iris$Species, p=0.8, list=F)


iris_row

iris_row2<-iris[iris_row, ]

nrow(iris_row2[iris_row2$Species=='setosa', ])
nrow(iris_row2[iris_row2$Species=='versicolor', ])
nrow(iris_row2[iris_row2$Species=='virginica', ])

iris_train_data<-iris[iris_row, ]

nrow(iris_train_data)
table(iris_train_data$Species)

iris_test_data<-iris[-iris_row, ]
table(iris_test_data$Species)



rpart::rpart()

?rpart


str(iris_train_data)
rpart(Species ~  .  , data=iris_train_data)

#rpart(Species ~  .  , data=iris_train_data, control = 2)



iris_model<-rpart(Species ~  .  , data=iris_train_data)
iris_model

iris_model2<-rpart(Species ~  .  , data=iris_train_data, control = rpart.control(minsplit = 2))
iris_model2


install.packages("rpart.plot")

library(rpart.plot)

rpart.plot::rpart.plot()

rpart.plot(iris_model2)

iris_model2$cptable



?prune()

iris_model2_tree<-prune(iris_model2,cp=0.01875)
?par



#화면  par(mfrow=c(2,2))

#화면 분할 초기화

opar <- par(no.readonly = TRUE)
par(opar)


iris_model2<-prune(iris_model2 ,cp=0.01875)
rpart.plot(iris_model2_tree)

#type : class, prob
actual<-iris_test_data$Species
actual

expect<-predict(iris_model2, iris_test_data,type="class" )
expect

iris_pred_df<-data.frame(actual,expect)

table(iris_pred_df)


install.packages("e1071")
confusionMatrix(expect,actual)
