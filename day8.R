


install.packages("doBy")

?sampleBy()

datasets::iris

?data()

rm(list = ls())

data(iris)

attach(iris)

sampleBy( . ~ Species, frac = 0.7, data = iris)

iris_train2<-sampleBy( ~Species, frac = 0.7, data = iris)

nrow(iris_train2)



str(iris_train2)

dim(iris_train2)

table(iris_train2$Species)


caret::createDataPartition()

library(caret)

data("iris")

str(iris)
attach(iris)
idx<-createDataPartition(iris$Species,p=0.7,list = FALSE)


class(train_idx)


iris_train<-iris[idx, ]
iris_test<-iris[-idx, ] 



e1071::naiveBayes()
naiv

library(e1071)
?naiveBayes
naiveBayes(iris_train[1:4],iris_train$Species, laplace = 1)

naive_b_model<-naiveBayes(iris_train[1:4],iris_train$Species, laplace = 1)

naive_pred<-predict(naive_b_model,iris_test,type = "class")


table(naive_pred, iris_test$Species)


confusionMatrix(naive_pred, iris_test$Species)

iris_train[1:4]

str(iris_train)


str(iris_train$Species)

?scale()


dim(iris_train)
dim(iris_test)

?dim

table(iris_train$Species)
table(iris_test$Species)


rm(list = ls())

data(iris)
attach(iris)


?subset()

colnames(iris)

table(Species)

a<-subset(iris, Species=="setosa" | Species=="versicolor")

class(a)

str(a)

?glm
#glm() 함수를 이용하여 로지스틱 회귀모형을 수행, family = binomial 옵션 사용

b<-glm(Species ~ Sepal.Length, family = binomial, data = a)



exp(5.140)

?summary()

summary(b)

nnet::multinom()

attach(iris_train2)

multinom(Species ~ . , data=iris_train)

multi.result<-multinom(Species ~ . , data=iris_train)

multi.pred<-predict(multi.result, iris_test)
table(multi.pred,iris_test$Species)

confusionMatrix(multi.pred,iris_test$Species)



?dist()


