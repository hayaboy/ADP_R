#빅데이터 분석모델 확장 및 활용

id <- c("c01", "c02", "c03", "c04", "c05", "c06", "c07")
age <- c(25, 45, 31, 30, 49, 53, 27)
customers <- data.frame(id, age, stringsAsFactors = F)
customers
str(customers)
?class
?sapply
sapply(customers,class)
?transform
customers <- transform(customers,age20s = ifelse(age >= 20 & age < 30, 1, 0),age30s = ifelse(age >= 30 & age < 40, 1, 0),age40s = ifelse(age >= 40 & age < 50, 1, 0),age50s = ifelse(age > 50 & age < 60, 1, 0))
customers


# 앙살블 모형(bagging, boosting, random forest)

#1. bagging

# bootstrap(훈련 표본, 크기가 같은 표본을 여러번 단순 임의 복원 추출 )

# bootstrap에 대해 분류기(classsifier)를 생성한 후 그 결과를 앙상블하는 방법

# bootstrap + aggregation

install.packages("adabag")

data(iris)
?adabag::bagging


iris.bagging<-bagging(Species ~ . , data=iris, mfinal=10)

?bagging
iris.bagging$importance
iris.bagging$trees

plot(iris.bagging$trees[[10]])


text(iris.bagging$trees[[10]])

#plot함수를 통해 분류 결과를 트리 형태로 나타낼 수 있다.
#predict함수를 통해 새로운 자료에 대한 분류(예측)를 수행할 수 있다.


pred<-predict(iris.bagging, newdata = iris)



table(pred$class, iris[,5])


# bootstrap(훈련 표본, 크기가 같은 표본을 여러번 단순 임의 복원 추출 )

#2 boosting
# bagging의 과정과 유사하나  bootstrap 표본을 구성하는
# 재표본 과정(resample)에서 각 자료에 동일한 확률을 부여하는 것이 아니라
#분류가 잘못된 데이터에 더 큰 가중을 주어 표본을 추출
# 부트스트랩 표본을 추출하여 분류기를 만든 후, 그 분류 결과를 이용하여 각 데이터가 추출될 확률을 
# 조정한 후, 다음 부트스트랩 표본을 추출하는 과정을 반복
# 아다부스팅(Adaboosting : Adaptive boosting )은 가장 많이 사용되는 부스팅 알고리즘이다.


library(adabag)

data(iris)
?boosting
boo.adabag<-boosting(Species ~ . , data=iris, boos = TRUE, mfinal = 10 )


boo.adabag$importance



plot(boo.adabag$trees[[10]])


text(boo.adabag$trees[[10]])



pred<-predict(boo.adabag, newdata = iris)

tb<-table(pred$class, iris[,5])
tb



#3 random forest
# 배깅(bagging)에  랜덤 과정을 추가한 방법이다.
# 부트스트랩 표뵨을 추출하고, 각 부트스트랩 샘플에 대해 트리를 형성해 나가는 
# 과정은 배깅과 유사하나, 각 노드마다 모든 예측 변수 안에서 최적의 분할을 선택하는 방법 대신
# 예측 변수들을 임의로 추출하고, 추출된 변수 내에서 최적을 분할을 만들어 나가는 방법을 사용


#랜덤 포레스트는 여러 개의 의사결정트리를 임의로 학습하는 앙상블 방법이다. 다른 모델
#에 비해 속도가 현저히 빠르고 성능도 좋은 편이다. 분류 및 회귀문제 모두 다 양호한 성
#능을 나타낸다. 랜덤 포레스트는 두 가지 방법을 사용해서 다양한 의사결정트리를 만든다. 첫 번째는 의사결정트리를 만들 때 데이터를 복원추출로 샘플링 하여 해당 데이터에 대한
#모델을 만들어가는 방식이다. 모델을 만들어 나갈 때 모든 데이터를 사용하지 않고 일부
#데이터만을 사용하는 것이 특징이다. 두 번째는 노드 내에 데이터를 분기할 때 사용되는
#기준을 정할 때 전체 변수를 대상으로 분기하는 것이 아니라 일부 변수에 대해서 분기를
#시도하여 여러 의사결정트리를 생성한다. 여러 개의 의사결정트리 모델이 만들어지면 이
#들의 결과들을 종합하여 다수결(majority voting) 방식 등을 이용하여 최종값을 산출한다. 다음은 R에서 randomForest 패키지를 이용하여 랜덤 포레스트 기법을 적용하는 예제를
#살펴보도록 한다



data(iris)

nrow(iris)
?sample

index<-sample(2, nrow(iris), replace = T, prob = c(0.7,0.3))
# 훈련 데이터세트(1)과 검증 데이터 세트(2) 구분을 위해 7:3의 비율로 무작위 샘플링 수행
training_data <- iris[index==1,]

testing_data <- iris[index==2,]


install.packages("randomForest")

?randomForest

if_iris<-randomForest(Species ~ ., data=training_data, ntree=100, proximity=TRUE)


# 100개의 의사결정트리를 통해서 랜덤 포레스트를 학습


if_iris

predicted_iris <- predict(if_iris, newdata=testing_data)



predicted_iris

