install.packages("drat", repos="https://cran.rstudio.com") # 패키지 설치 및 로딩
drat:::addRepo("dmlc")
install.packages("mxnet")
library(mxnet) ## 또는 require(mxnet)
library(mlbench)
data(Sonar, package="mlbench") # Sonar 데이터 로딩

# 신경망 출력변수의 값을 신경망에 맞게 목적변수의 1과 2의 값을 0과 1로 변경
Sonar[,61] = as.numeric(Sonar[,61])-1 

train.ind = c(1:50, 100:150) # 훈련자료와 검정자료 만들기
train.x = data.matrix(Sonar[train.ind, 1:60])
train.y = Sonar[train.ind, 61]
test.x = data.matrix(Sonar[-train.ind, 1:60])
test.y = Sonar[-train.ind, 61]
mx.set.seed(0) # 반복 훈련 시 동일한 결과가 산출되도록 seed값 설정
model <- mx.mlp(train.x, train.y, hidden_node=10, out_node=2, # 신경망 학습
                out_activation='softmax', num.round=20,
                array.batch.size=15, learning.rate=0.07,
                momentum=0.9, eval.metric=mx.metric.accuracy)

# ■ 신경망 학습 결과 확인
## Auto detect layout of input matrix, use rowmajor..
## Start training with 1 devices
## [1] Train-accuracy=0.488888888888889
## [2] Train-accuracy=0.514285714285714
## …
## [20] Train-accuracy=0.838095238095238


preds = predict(model, test.x) # 예측
pred.label = max.col(t(preds))-1
table(pred.label, test.y)


# ■ 예측 결과 확인
## test.y
## pred.label 0 1
## 0 24 14
## 1 36 33