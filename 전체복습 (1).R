
?rm
rm(list=ls())

datasets::iris
data("iris")
150*0.7
iris_train<-iris[1:105,]
iris_test<-iris[106:150, ]


?sample
sample(c(1,2,3,4),2)

sample(c(1,2,3,4),2, replace = TRUE)



nrow(iris)*0.7



iris

idx<-sample(1:nrow(iris), size=nrow(iris)*0.7, replace=F)
iris_train<-iris[idx, ] 
iris_train
View(iris_train)
iris_test<-iris[-idx, ]
iris_test
nrow(iris_test)
?dim
dim(iris_test)

table(iris$Species)


table(iris_train$Species)

table(iris_test$Species)

install.packages("doBy")
library(doBy)

?sampleBy

iris_train<-sampleBy(~Species, frac=0.7, data=iris)

table(iris_train$Species)

?caret::createDataPartition()


createDataPartition

createDataPartition(iris$Species, p=0.7, list=F)


#랜덤포레스트

install.packages("randomForest")

library(caret) #cross-validation

rm(list = ls())

attach(iris)
set.seed(1000)
N<-nrow(iris)
tr.idx<-sample(1:N, size = N*2/3,replace = FALSE)
iris_train<-iris[tr.idx, -5]
iris_test<-iris[-tr.idx, -5]

trainLabel<-iris[tr.idx, 5]
testLabel<-iris[-tr.idx, 5]

train<-iris[tr.idx, ]
test<-iris[-tr.idx, ]

?randomForest::randomForest()


#mtry : Number of variable
rf<-randomForest( Species ~ . , data = train, importance=T, mtry=4)

rf
randomForest::importance(rf)

varImpPlot(rf,main = "중요 변수 확인")

#나이브 베이즈 모형

install.packages("e1071")

library(e1071)

e1071::naiveBayes()


?naiveBayes

rm(list=ls())
library(caret)
idx<-createDataPartition(iris$Species, p=0.7, list=F)





iris_train<-iris[idx, ] 
iris_test<-iris[-idx, ] 

naive_model<-naiveBayes(iris_train, iris_train$Species,laplace = 1)
naive_model


result<-predict(naive_model, iris_test, type="class")


result

table(result, iris_test$Species)

confusionMatrix(result, iris_test$Species)





#주성분 분석

rm(list=ls())
data("iris")

attach(iris)
cor(iris[1:4])

iris[,1:4]

?prcomp()

iris_pca<-prcomp(iris[,1:4], center = TRUE, scale. =TRUE)

#PC1= 0.5210659*Sepal.Length-0.2693474*Sepal.Width+0.5804131*Petal.Length + 0.5648565*Petal.Width

summary(iris_pca)
#PC1과 PC로 이 데이터의 95.81%를 설명


plot(iris_pca, type='l', main="주성분")


datasets::USArrests

#미국의 50개 주의 인구 10만명당 살인, 폭행, 강간으로 인한 체포의 수와 도시 인구의 비율


summary(USArrests)
str(USArrests)

head(USArrests)

boxplot(USArrests)

?prcomp
?princomp()

fit<-princomp(USArrests, cor=TRUE)
summary(fit)

#cor=TRUE 옵션은 공분산행렬이 아닌 상관계수 행렬을 사용하여 수행하도록 한다.

?loadings()

#로딩벡터(같은 방향이면 상관관계가 많음 )
#직교하면 상관관계가 0
loadings(fit)
?plot
#스크리 플롯(주성분을 선택할 때 1미만인 애들은 선택안함), 엘보우 포인트까지 선택
#70~90%인 주성분을 선택한다.
plot(fit,type='l')


fit$scores

?biplot()

biplot(fit)

#biplot은 관측치들의 첫번재와 두번째 주성분을 좌표에 그린 그림
#첫 번재 주성분(Comp1)이 Assault, Murder,Rape 변수들에 대해 상대적으로 큰 가중치를 적용하여 계산된 것
#두 번재 주성분(Comp2) UrbanPop와 상대적으로 평행하기 때문데 다른 변수들에 비해 UrbanPop의 영향을 크게 받아 구성된 것으로 보인다. 





