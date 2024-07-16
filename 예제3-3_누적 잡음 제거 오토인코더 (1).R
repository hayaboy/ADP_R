rm(list =ls())

install.packages("RcppDL")
library(RcppDL)

ionurl  <-
  'https://archive.ics.uci.edu/ml/machine-learning-databases/ionosphere/ionosphere.data'

names = c('V1', 'V2', 'V3', 'V4','V5', 'V6','V7', 'V8', 'V9', 'V10',
          'V11', 'V12', 'V13', 'V14','V15', 'V16','V17', 'V18', 'V19', 'V20',
          'V21', 'V22', 'V23', 'V24','V25', 'V26','V27', 'V28', 'V29', 'V30',
          'V31', 'V32', 'V33', 'V34','Class')

ionosphere = read.table(ionurl, header=F, sep =',', col.names=names)

set.seed(2018)
sample <- sample(1:351, floor(351*0.6), FALSE)

train <- 
  matrix(as.numeric(unlist(ionosphere[sample,])), nrow=nrow(ionosphere[sample,]))
test <- 
  matrix(as.numeric(unlist(ionosphere[-sample,])),nrow=nrow(ionosphere[-sample,]) )

x_train <- train[,-35]
x_test <- test[,-35]
y_train <- train[,35]
p_y_train <- (y_train ==1)
temp1 <- ifelse (p_y_train==FALSE, 1 , 0)
y_train <- cbind(p_y_train, temp1)
y_test <- test[, 35]
p_y_test <- (y_test ==1)
temp2 <- ifelse (p_y_test==FALSE, 1 , 0)
y_test <- cbind(p_y_test, temp2)

hidden = c(50,50,50)
fit <- Rsda(x_train, y_train, hidden)  #누적 잡음제거 오토인코더 생성

setCorruptionLevel (fit, x =0.25)      #잡음 수준을 25%로 설정
summary(fit)

pretrain(fit); finetune(fit)             #예비학습 및 세부조정
predprob <- predict(fit,x_test)       #검정자료에 대한 예측확률 계산 

pred <- ifelse(predprob[,1]>=0.5, 1, 0)
table(y_test[,1], pred, dnn=c("Observed","Predicted"))

