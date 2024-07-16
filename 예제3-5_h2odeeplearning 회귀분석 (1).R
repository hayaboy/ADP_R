install.packages("h2o")
library(h2o)
h2o.init()                            

#=== AER 패키지에 있는 CreditCard 자료의 전처리 ===#
install.packages("AER")
library(AER)

data("CreditCard",package="AER")    
str(CreditCard)

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
tr_data <- as.h2o(tr_data)
te_data <- data[-tr_ind,]
te_data <- as.h2o(te_data)

#=== 학습된 심층 신경망을 사용하여 예측하기 ===#
# 오토인코더를 사용한 예비학습 
ae_model1 <- h2o.deeplearning(x = 1:11, training_frame = tr_data,
                              model_id = "cc_autoencoder1", ignore_const_cols = FALSE,
                              activation = "Tanh",  hidden = c(8,7,5,5), autoencoder = TRUE) 
# 역전파 알고리즘을 사용한 세부조정                    
fit1 <- h2o.deeplearning(x = 1:11, y = 12, training_frame = tr_data,
                         ignore_const_cols = FALSE, hidden = c(8,7,5,5),
                         pretrained_autoencoder = "cc_autoencoder1")
perf1 <- h2o.performance(fit1, newdata = te_data)
h2o.mse(perf1)     # 오토인코더를 사용하여 예비학습을 한 경우 MSE 계산
#[결과]
#0.001800618

#=== 설정된 심층 신경망과 역전파 알고리즘을 통하여 예측하기 ===#
fit2 <- h2o.deeplearning(x = 1:11, y = 12, training_frame = tr_data,
                         ignore_const_cols = FALSE, hidden = c(8,7,5,5))
perf2 <- h2o.performance(fit2, newdata = te_data)
h2o.mse(perf2) 
#[결과]
#0.002386772 

