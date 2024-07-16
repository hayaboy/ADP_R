install.packages('ModelMetrics')
install.packages('AER')
library(ModelMetrics);library(AER)
library(nnet);library(caret)
data("CreditCard");str(CreditCard)
drops <- c("card","owner","selfemp","share")
num_vars <- CreditCard[, !(names(CreditCard) %in% drops)] # 수치변수들 생성
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))} # 정규화 함수 생성
norm_num_vars <- as.data.frame(sapply(num_vars, normalize)) # 정규화 수행
str(norm_num_vars)
share <- CreditCard$share

card <- CreditCard$card; str(card)
owner <- CreditCard$owner
selfemp <- CreditCard$selfemp
data1 <- as.data.frame(cbind(card, owner, selfemp, # 자료 생성
                             norm_num_vars, share))
set.seed(100) # 훈련자료와 검정자료 만들기
tr_ind <- sample(1:nrow(data1), 1200, replace=F)
tr_data <- data1[tr_ind,]
te_data <- data1[-tr_ind,]
my.grid <- expand.grid(.decay = c(0.3, 5e-4), .size = c(1, 2, 3))
fit1 <- train(share~., data=tr_data[,-(1:3)], method = "nnet", maxit = 200,
              tuneGrid = my.grid, trace = F, liner.output=T)
# ■ 최적 모수 확인
fit1$bestTune
# size decay
# 3 3 5e-04

# ■ 성능 평가 확인
pred1 <- predict(fit1, newdata=tr_data[,-(1:3)])
mse(tr_data$share, pred1)
# [1] 0.0001474989
pred2 <- predict(fit1, newdata=te_data[,-(1:3)])
mse(te_data$share, pred2)
# [1] 0.0001639177
head(cbind(te_data$share, pred2))

# [,1] [,2]
# 5 0.0670505900 0.08047601
# 7 0.0125757600 0.01675447
# 13 0.0006936416 0.02479125
# 30 0.3344596000 0.30227298
# 35 0.0890156600 0.08044641
# 38 0.1197419000 0.12276339