#=== darch의 설치 및 darch에 연결 ===#
install.packages("devtools")
library(devtools)
install_github("maddin79/darch@v0.12.0")
library(darch)  

#=== AER 패키지에 있는 CreditCard 자료의 전처리 ===#
install.packages("AER")
library(AER)

data("CreditCard", package="AER")    
drops <- c("card","owner","selfemp","share")
num_vars <- CreditCard[, !(names(CreditCard) %in% drops)]  # 수치 변수들 생성

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))}    # 정규화 함수  
norm_num_vars <- as.data.frame(lapply(num_vars, normalize)) # 정규화 실행
share <- CreditCard$share
card <- factor(CreditCard$card)
owner <- factor(CreditCard$owner)   
selfemp <- factor(CreditCard$selfemp) 

data <- as.data.frame(cbind(card,owner,selfemp,norm_num_vars,share))

#=== 훈련자료와 검정자료 만들기 ===#
set.seed(20180202) 
tr_ind <- sample(1:nrow(data), 1200, replace=F)
tr_data <- data[tr_ind,]
te_data <- data[-tr_ind,]
tr_data <- tr_data[,4:12]
te_data <- te_data[,4:12]

#=== 딥러닝을 사용하여 심층 신경망을 학습하기 ===#
# darch는 RBM을 사용하여 예비학습을 수행하고 backpropagation 또는 
# rpropagation을 사용하여 세부조정한다
darch_fit <- darch(share~., data=tr_data, rbm.numEpochs = 50,
                   rbm.batchSize = 2, rbm.lastLayer = F, 
                   layers = c(8,8,7,5,5,1), 
                   # 입력층, 은닉층1, 은닉층2, 은닉층3, 은닉층4 및 출력층의 노드 수  
                   darch.fineTuneFunction = rpropagation, rprop.method = "iRprop+",
                   darch.isClass = F,  #회귀분석을 위해 반드시 필요함
                   darch.batchSize = 2, retainData = F, darch.numEpochs = 100,
                   darch.unitFunction = linearUnit)

#=== 학습된 심층 신경망을 사용하여 예측하기 ===#
y_pred <- predict(darch_fit, newdata=te_data[,1:8])
mean((y_pred - te_data[,9])^2)  #검정자료에 대한 MSE 계산
#[결과]
#0.5730008
