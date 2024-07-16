# 인공 신경망

# R에서 사용하는 패키지 : neuralnet, nnet 
# 역전파 알고리즘 : ANN(artificial neural network)을 학습시키기 위한 가장 기본적이고 일반적인 알고리즘

# 신경망 모형의 장점
#  변수의 수가 많거나 입력, 출력변수간에 복잡한 비선형관계에 유용
#  잡음에 대해서도 민감하게 반응하지 않는다.
#  연속형이거나 이산형인 경우 모두 처리가 가능

# 신경망 모형의 단점
#   결과에 대한 해석이 쉽지 않다.
#   최적의 모형을 도출하는 것이 상대적으로 어렵다.
#   데이터의 정규화를 하지 않으면 지역해의 위험에 빠지기 쉽다.
#   모형이 복잡하면 훈련 과정에 시간이 많이 소요된다.




data(iris)
# scale()함수를 이용해서 정규화를 한다.

range(iris$Sepal.Length)
range(iris$Sepal.Width)
range(iris$Petal.Length)
range(iris$Petal.Width)

Sepal_min_dev<-iris$Sepal.Length-min(iris$Sepal.Length)



max_min<-max(iris$Sepal.Length)-min(iris$Sepal.Length)


Sepal_min_dev/max_min

range(Sepal_min_dev/max_min)





train_data<-scale(iris[1:4])
train_data

range(train_data)


cbind(train_data, iris[5])

#1-50 세토사, 51-100 versicolor 101-150 virginica


#7:3


50*(7/10)

idx<- c( sample(1:50, 35), sample(51:100, 35), sample(101:150, 35))
idx


train<-train_data[idx, ]
test<-train_data[-idx, ]
train
test



iris_scaled<-cbind(scale(iris[-5]), iris[5])


train<-iris_scaled[idx, ]
test<-iris_scaled[-idx, ]

?nnet
library(nnet)
model.nnet<-( Species ~ . , data=train, size=2, decay = 5e-4)
nnet
summary(model.nnet)


?predict
pred<-predict(model.nnet, test,type="class" )

pred

# 오분류표 : 실제결과와 예측결과에 대한 교차표
# table함수를 이용한다.


actual<-test$Species

class(actual)

actual

table(actual)






"""
library("caret")
?confusionMatrix
confusionMatrix(pred, actual)
"""

colnames(iris)<-tolower(colnames(iris))
data<-iris


Scale<-data.frame(lapply(data[ , 1:4], function(x){scale(x)}))

Scale

Scale$species<-data$species

index<-sample(1:nrow(Scale), round(0.75*nrow(Scale)), replace=FALSE)
train<-Scale[index, ]
test<-Scale[-index, ]


model<-nnet(species ~ . , size=2, decay=5e-04, data=train)

summary(model)
#출력, 은닉, 입력 노드의 수와 가중치으이 수를 보여준 후
# 입력 노드 -> 은닉 노드로 가는 가중치의 값과 은닉노드 -> 출력 노드로 
#가는 가중치의 값을 보여준다.



#weight의 수 ( input node +1 ) *hidden node + (hidden node +1)* output node
# (4+1)*2 + (2+1)*3 = 10 + 9


#신경망 모델의 검증

#predict 함수의 결과는 테스트 집합에 대한 예측 결과를 벡터의 형태로 제공

predict.model<-predict(model, test[1:4], type="class")


predict.model

actual<-test$species
confusion.matrix<-table<-table(actual, predict.model)
confusion.matrix

Table<-table(test$species, predict.model)
accuracy<-sum(diag(Table))/sum(Table)
accuracy
sum(predict.model==actual)/NROW(predict.model)







