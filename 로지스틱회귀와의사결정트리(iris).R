library(caret)
idx<-createDataPartition(iris$Species, p=0.7, list=F)
iris_train<-iris[idx, ] #생성된 인덱스를 이용, 70%의 비율로 학습용 데이터 세트 추출
iris_test<-iris[-idx, ] #생성된 인덱스를 이용, 30%의 비율로 평가용 데이터 세트 추출

nnet::

data(iris)
   
multi.result<-multinom(Species ~ ., iris_train)

multi.pred<-predict(multi.result, iris_test)
table(multi.pred, iris_test$Species)

confusionMatrix(multi.pred, iris_test$Species)



rpart.result<-rpart(Species ~ ., iris_train)
rpart.result
rpart.pred<-predict(rpart.result, iris_test,type="class")

table(rpart.pred, iris_test$Species)
confusionMatrix(rpart.pred,iris_test$Species)



?nnet()
nnet( Species ~ ., data=iris_train, size=2)

#size : number of units in the hidden layer.


sapply(iris_train[,-5], scale)
iris_train_scale<-as.data.frame(sapply(iris_train[,-5], scale))
iris_test_scale<-as.data.frame(sapply(iris_test[,-5], scale))


iris_train_scale

iris_train_scale$Species<-iris_train$Species

iris_test_scale$Species<-iris_test$Species


nnet.result<-nnet( Species ~ ., iris_train_scale, size=3)

nnet.pred<-predict(nnet.result, iris_test_scale, type="class")


table(nnet.pred, iris_test$Species) 


str(nnet.pred)
nnet.pred<-factor(nnet.pred)

confusionMatrix(nnet.pred, iris_test$Species)


