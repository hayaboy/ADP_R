install.packages("kernlab")
kernlab::ksvm()
?ksvm


  
#종속변수 ~ 독립변수
#독립변수 여러개 x1 + x2 
#모든 독립변수  .
  
#caret

install.packages("caret")
  
caret::createDataPartition()
  
iris$Species

?createDataPartition

idx<-createDataPartition(iris$Species, p=0.7, list=F)

150*0.7

idx

iris_train<-iris[idx, ]

iris_train

iris_test<-iris[-idx, ] 


table(iris_train$Species)
table(iris_test$Species)

?ksvm

svm_model<-ksvm(Species ~ . , data=iris_train, kernel="rbfdot")
svm_model

summary(svm_model)


?predict

svm.pred<-predict(svm_model,iris_test, type="response" )


table(svm.pred, iris_test$Species) #분류 결과도출

?confusionMatrix

1 - (2/45)

confusionMatrix(svm.pred, iris_test$Species)
