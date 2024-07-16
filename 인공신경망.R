# 인공 신경망

# R에서 사용하는 패키지 : neuralnet, nnet 

# 역전파 알고리즘 : ANN(artificial neural network)을 학습시키기 위한 가장 
#     기본적이고 일반적인 알고리즘

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

iris.scaled<-cbind(scale(iris[-5]), iris[5])

# 데이터를 training set과 test set으로 분할

idx<-c(sample(1:50, 35), sample(51:100, 35), sample(101:150, 35))

train<-iris.scaled[idx,]
test<-iris.scaled[-idx,]

#install.packages("nnet")
library(nnet)

model.nnet<-nnet(Species ~., data = train, size=2, decay=5e-04)
summary(model.nnet)

pred <-predict(model.nnet, test, type="class")
pred

# 오분류표 : 실제결과와 예측결과에 대한 교차표
# table함수를 이용한다.

actual <- test$Species
table(actual, pred)


