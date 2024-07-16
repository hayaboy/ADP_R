install.packages("tree")
library(tree)

ls()

rm(list = ls())

set.seed(2000)

iris

N<-nrow(iris)


tr.idx<-sample(1:N, size = N*(2/3), replace = F)



train<-iris[tr.idx, ]


nrow(train)

test<-iris[-tr.idx, ]


nrow(test)

install.packages("tree")


dim(train)
dim(test)


train

test



?tree::tree()

colnames(train)

#formula    
#   종속 변수 ~ 독립변수 (.      +    )



tree_model<-tree(Species ~  .,  data = train )



plot(tree_model)
text(tree_model)

#최적 K를 구하는 방법


tree::cv.tree()

?cv.tree()

?prune.misclass

cv.tree(tree_model, FUN = prune.misclass )

plot(cv.tree(tree_model, FUN = prune.misclass))

best_tree_model<-prune.misclass(tree = tree_model, best =3)



best_tree_model

plot(best_tree_model)
text(best_tree_model)



rm(list=ls())

install.packages("prob")

install.packages("randomForest")
library(randomForest)


install.packages("caret")
library(caret)
caret::confusionMatrix()


str(iris)


N<-nrow(iris)



train.idx<-sample(1:N, size = N*2/3, replace = F)

head(iris)

iris.train<-iris[train.idx , -5]
iris.test<-iris[-train.idx , -5]

nrow(iris.train)
nrow(iris.test)


trainLabels<-iris[train.idx , 5]
testLabels<-iris[-train.idx , 5]


trainLabels

testLabels

?randomForest()


train<-iris[train.idx , ]

train

colnames(train)

rf_test<-randomForest(Species ~  .  , data =train ,  mtry=4 )

rf_test


rf<-randomForest(Species ~  .  , data =train , importance=T, mtry=4 ) #mtry 변수의 수

#변수의 중요도를 알아보려면 모델 작성 시 randomForest( )에 importance=TRUE


randomForest::importance()

importance(rf)

library(randomForest)

randomForest::varImpPlot()

varImpPlot(rf)


?confusionMatrix()





#서포트벡터머신을사용하기 위해 e1071 패키지 설치

install.packages("e1071")

library(e1071)

e1071::svm()

?svm()


iris


svm_model<-svm(Species ~ ., data = iris)



svm_model

summary(svm_model)


x<-iris[, -5]

y<-iris[,5]

pred<-predict(svm_model, x)

table(pred, y)



4/150
#오분류율 2.66

1-0.02666667

colnames(iris)

plot(svm_model, iris,  Petal.Width ~ Petal.Length , slice = list(Sepal.Width=3,Sepal.Length=4))

e1071::plot.svm
?plot.svm

slice	
#a list of named values for the dimensions held constant (only needed if more than two variables are used). The defaults for unspecified dimensions are 0 (for numeric variables) and the first level (for factors). Factor levels can either be specified as factors or character vectors of length 1.

plot(svm_model, iris,  Petal.Width ~ Petal.Length)



package_version(R.version)


rm(list=ls())


idx<-createDataPartition(iris$Species, p=0.7, list=F)
iris_train<-iris[idx, ] 
iris_test<-iris[-idx, ] 
naive.result<-naiveBayes(iris_train, iris_train$Species,laplace=1)

naive.result
naive.pred<-predict(naive.result, iris_test, type="class") 
table(naive.pred, iris_test$Species) 
confusionMatrix(naive.pred, iris_test$Species) 
