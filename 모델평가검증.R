#모델 평가 검증


?ts
#frequency	
#the number of observations per unit of time.



# apply 계열 : 함수 적용하는 함수 (lapply, sapply,tapply)

#plyr 계열

# 데이터를 분할하고(split) 분할된 데이터에 특정 함수를 적용한 뒤(apply)
# 그 결과를 재조합(combine)하는 세 단계로 데이터를 처리하는 함수들을 제공

?plyr
# a는 array, d는 데이터 프레임 l은 리스트  

#  입력   출력
#   a     a
#   d     d            +      ply
#   l     l



adply



adply(iris, 1, function(row){row$Sepal.Length>=5.0 & row$Species=="setosa"} )



#교차 유효성 검사를 통한 예측모델 성능 평가 
library(randomForest)

data <- iris 
#K개의 데이터 세트
k = 5



data$id<-sample(1:5, nrow(data), replace = TRUE)


data$id

list<-1:k

prediction <- data.frame()

testing_data_copy <- data.frame()

subset(data,id %in% list[-1] )
testing_data

for(i in 1: k){
  training_data<- subset(data,id %in% list[-i] )
  testing_data <- subset(data, id %in% c(i)) 
  
  mymodel<-randomForest(training_data$Sepal.Length ~ . ,  data=training_data, ntree=100)
  
  temp<- predict(mymodel, testing_data[,-1])
  
  
  prediction<- rbind(prediction, temp)
  
  testing_data_copy<-rbind(testing_data_copy, as.data.frame(testing_data[,1]))
  
  
}

prediction
colnames(prediction)="p"
prediction$p
colnames(prediction)
colnames(testing_data_copy) = "t"
testing_data_copy$t
colnames(testing_data_copy)

abs(prediction$p - testing_data_copy$t)
mean(abs(prediction$p - testing_data_copy$t))





MAE_result = mean(abs(prediction$p - testing_data_copy$t))




MAE_result



install.packages("ROCR")
data(ROCR.simple)
ROCR.simple
?prediction
predict_simple<-prediction(ROCR.simple$predictions,ROCR.simple$labels)


predict_simple

perf_simple <- performance(predict_simple,"tpr","fpr")



plot(perf_simple)

abline(a=0, b=1)

performance(predict_simple,"auc")




install.packages("caret")
library(caret)

set.seed(102)

index4training <- createDataPartition(y=iris$Species, p=0.7,list=FALSE)

index4training


training_data <- iris[index4training,]
testing_data <- iris[-index4training,]
training.data <- scale(training_data[-5])
summary(training.data)
training_data

str(training_data)
kmeans_iris <- kmeans(training.data[,-5], centers=3,iter.max=10000)

training.data
library("rpart")

training_data$cluster
fitted <- train(x=training.data[,-5],y=training_data$cluster, method="rpart")





