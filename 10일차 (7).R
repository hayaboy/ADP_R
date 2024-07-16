
rm(list=ls())

data(iris)

idx<-createDataPartition(iris$Species,p=0.7,list = F)

iris_train<-iris[idx,]
iris_test<-iris[-idx,]

table(iris_train$Species)

table(iris_test$Species)


install.packages("MASS")
library(MASS)

MASS::Boston

str(Boston)
?Boston

summary(Boston)

idx<-sample(1:nrow(Boston), size=nrow(Boston)*0.7, replace=F)
Boston_train<-Boston[idx,]
Boston_test<-Boston[-idx,]
dim(Boston_train)
dim(Boston_test)
colnames(Boston_train)



lm.fit<-lm(medv  ~ . , data = Boston_train)


summary(lm.fit)

lm.fit2<-step(lm.fit, method="both")


summary(lm.fit2)
lm.yhat2<-predict(lm.fit2, newdata=Boston_test)
lm.yhat2
mean((lm.yhat2-Boston_test$medv)^2)

sqrt(22.63435)


plot(lm.fit2)





# 의사 결정 트리(수치 예측)

library(tree)

?tree()

Boston_train


tree(    ~ )





