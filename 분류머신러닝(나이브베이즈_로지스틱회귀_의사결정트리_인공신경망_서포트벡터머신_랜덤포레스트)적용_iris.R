library(caret)
idx<-createDataPartition(iris$Species, p=0.7, list=F)
iris_train<-iris[idx,]
iris_test<-iris[-idx,]
table(iris_train$Species)
table(iris_test$Species)
library(e1071)
naive.result<-naiveBayes(iris_train,iris_train$Species,laplace = 1)
naive.pred<-predict(naive.result, iris_test,type="class")
table(naive.pred,iris_test$Species)
confusionMatrix(naive.pred,iris_test$Species)
library(nnet)
multi.result<-multinom(Species ~ . , iris_train)
multi.pred<-predict(multi.result, iris_test)
table(multi.pred,iris_test$Species)
confusionMatrix(multi.pred,iris_test$Species)
library(rpart)
rpart.result<-rpart(Species ~ . , iris_train)
rpart.result
rpart.pred<-predict(rpart.result,iris_test,type="class")
table(rpart.pred,iris_test$Species)
confusionMatrix(rpart.pred,iris_test$Species)
library(nnet)
iris_train_scale<-as.data.frame(sapply(iris_train[,-5],scale))
iris_test_scale<-as.data.frame(sapply(iris_test[,-5],scale))
iris_train_scale$Species<-iris_train$Species
iris_test_scale$Species<-iris_test$Species
nnet.result<-nnet(Species ~ . ,  iris_train_scale, size=3)
nnet.pred<-predict(nnet.result,iris_test_scale,type = "class")
table(nnet.pred,iris_test$Species)
confusionMatrix(factor(nnet.pred),factor(iris_test$Species))
library(kernlab)
svm.result<-ksvm(Species~., iris_train, kernel="rbfdot")
svm.pred<-predict(svm.result,iris_test,type="response")
table(svm.pred,iris_test$Species)
library(randomForest)
rf.result<-randomForest(Species~ . , iris_train, ntree=500)
rf.pred<-predict(svm.result,iris_test,type="response")
table(rf.pred,iris_test$Species)





