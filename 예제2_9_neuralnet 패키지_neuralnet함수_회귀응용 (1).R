# 회귀모형 적용(linear.output=TRUE인 경우)
install.packages('ModelMetrics'); install.packages('AER')
library(ModelMetrics)
library(AER);library(neuralnet)
library(NeuralNetTools);library(caret)
data("CreditCard");str(CreditCard)
drops <- c("card","owner","selfemp","share", "majorcards")
num_vars <- CreditCard[, !(names(CreditCard) %in% drops)] # 수치변수들 생성
normalize <- function(x) { # 정규화함수 생성
  return ((x - min(x)) / (max(x) - min(x)))}
norm_num_vars <- as.data.frame(sapply(num_vars, normalize)) # 정규화 실행
str(norm_num_vars)
share <- CreditCard$share
data1 <- as.data.frame(cbind(norm_num_vars,share))
set.seed(100) # 훈련자료와 검정자료 생성
tr_ind <- sample(1:nrow(data1), 1200, replace=F)
tr_data <- data1[tr_ind,]; te_data <- data1[-tr_ind,]
h1 <- 8; h2 <- 3
grid <- expand.grid(1:h1,1:h2)
error <- c(); str(tr_data)
n = names(tr_data)

print(f <- as.formula(paste("share~", paste(n[!n %in% drops], collapse = "+"))))
for (i in 1:NROW(grid)){
  net1 <- neuralnet(f, tr_data, hidden = c(grid[i,1],grid[i,2]),
                    linear.output = T, threshold = 0.01)
  net.results1 <- compute(net1, tr_data[,-8])
  pred1 <- net.results1$net.result
  fu_err=mse(tr_data$share, pred1) ; error = c(error, fu_err)
}

# ■ 최적 모수 확인
grid_err=cbind(grid, error)
(grid_fin=grid[which.min(error), ])
# Var1 Var2
# 5 5 1


# 성능 평가
net2 <- neuralnet(f, tr_data, err.fct="sse", linear.output=T, 
                  likelihood=T, hidden = grid_fin, threshold = 0.01, stepmax=1e6)
net.results2 <- compute(net2, te_data[,-8])
pred2 <- net.results2$net.result

# ■ 성능 평가 확인
mse(te_data$share, pred2)
# [1] 0.00004102169266

head(cbind(te_data$share, pred2))
# [,1] [,2]
# 5 0.0670505900 0.074648203087
# 7 0.0125757600 0.013843665636
# 13 0.0006936416 0.001334076044
# 30 0.3344596000 0.309199592793
# 35 0.0890156600 0.088552421390
# 38 0.1197419000 0.122960536098

