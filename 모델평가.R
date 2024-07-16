
?datasets


datasets::Titanic

View(Titanic)

str(Titanic)

titanic<-as.data.frame(Titanic)

titanic

colnames(titanic)

table(titanic$Sex)

par(mfrow=c(1,1))

pie(table(titanic$Sex))
pie(table(titanic$Class))
pie(table(titanic$Age))
pie(table(titanic$Survived))
pie(table(titanic$Freq))

datasets::iris

View(iris)


iris$Species

?createDataPartition()


library(caret)

caret::createDataPartition()

idx<-createDataPartition(iris$Species, p=0.7, list=F)


150*0.7

length(idx)

iris_train<-iris[idx , ]
iris_test<-iris[-idx , ]

table(iris_train$Species)
table(iris_test$Species)



library(rpart)
#formula  :  종속변수(y) ~ 독립변수(x1 + x2), 변수 다 넣어 줄 경우 .

?rpart()


datasets::iris

str(iris)


rpart.iris<-rpart(Species ~ . , data = iris_train)

install.packages(rpart.plot)

library(rpart.plot)

rpart.plot::rpart.plot()

rpart.plot(rpart.iris)


stats::

rpart.pred<-predict(rpart.iris, newdata=iris_test, type="class")


iris_test


length(iris_test[ , 1])

rpart.pred # 예측값

iris_test$Species #실제값

length(rpart.pred)



table(iris_test$Species, rpart.pred)


caret::confusionMatrix()





?confusionMatrix()



confusionMatrix(rpart.pred,iris_test$Species )



library(e1071)

e1071::naiveBayes()

bayes.iris<-naiveBayes(Species~., data=iris_train) 

bayes.pred<-predict(bayes.iris, newdata=iris_test, type="class")

bayes.pred

confusionMatrix(bayes.pred, iris_test$Species)

library(randomForest)




randomForest::randomForest()


?randomForest

rdf.iris<-randomForest(Species~., data=iris_train, importance=T)

?predict



rdf.pred<-predict(rdf.iris, newdata=iris_test, type="response")
rdf.pred


confusionMatrix(rdf.pred, iris_test$Species, positive="versicolor")
