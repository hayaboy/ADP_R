install.packages("randomForest")
install.packages("caret")
library(caret)

str(iris)

N<-nrow(iris)
tr_idx<-sample(1:N, size = N*(2/3),replace = F)
tr_idx
train_data<-iris[tr_idx, -5]
test_data<-iris[-tr_idx, -5]

train_label<-iris[tr_idx, 5]
test_label<-iris[-tr_idx, 5]

str(train_data)
str(test_data)
length(train_label)
length(test_label)


?randomForest

attach(iris)

train<-iris[tr_idx, ]



randomForest(Species ~ . , data =train , importance=T,mtry=4)

rf<-randomForest(Species ~ . , data =train , importance=T,mtry=4)

?randomForest::importance()

importance(rf)

randomForest::varImpPlot()


varImpPlot(rf,main = "중요변수 분석")

