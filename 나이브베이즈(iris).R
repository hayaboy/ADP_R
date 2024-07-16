

idx<-createDataPartition(iris$Species,p=0.7,list = F)


iris_train<-iris[idx,]

iris_test<-iris[-idx,]


table(iris_train$Species)


table(iris_test$Species)

install.packages("e1071")



?naiveBayes()


naive.result<-naiveBayes(iris_train, iris_train$Species, laplace = 1)
#laplace인자는 나이브 베이즈 알고리즘 적용 시 특정 속성범주의 발생확률이 0이 될
#경우 전체 추정결과가 왜곡되는 것을 방지하기 위해 작은 값을 추가하는 것으로 일종
#의 보정 인자로 보면 된다. 일반적으로 laplace 인자에는 1로 설정한다




is(model)



naive.pred<-predict(naive.result,iris_test,type="class" )

table(naive.pred,iris_test$Species)



confusionMatrix(naive.pred, iris_test$Species)







