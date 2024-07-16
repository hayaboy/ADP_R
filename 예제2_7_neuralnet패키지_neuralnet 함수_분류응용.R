install.packages('neuralnet') # 패키지 설치 및 로딩
library(neuralnet)
data(infert, package="datasets") # 훈련자료 및 검정자료 설정
infert1 <- infert
set.seed(1010)

ind <- sample(1:nrow(infert1), nrow(infert1)*0.7)
traindata1 <- infert1[ind, ]
testdata1 <- infert1[-ind, ]
print(net.infert <- neuralnet(case~parity+induced+spontaneous, traindata1,
                              err.fct="ce", linear.output=FALSE, likelihood=TRUE)) # 신경망 학습
print(net.infert) # 학습 결과 확인
plot(net.infert) # 시각화(생성된 신경망 모델 확인)

net.results1 <- compute(net.infert, testdata1[,c(3,4,6)]) # 예측
print(net.results1$net.result)
pred1 <- net.results1$net.result
pred2 <- ifelse(pred1>= 0.5, 1, 0)
output <- data.frame(target=testdata1$case, predict1=pred2)
colnames(output) <- c("Expected","Neural Net")
table(output) # ■ 출력 테이블 결과 확인

# 모형 선택
set.seed(12)
h1 <- 2; h2 <- 2
grid <- expand.grid(1:h1,1:h2)
error <- c()
for (i in 1:NROW(grid)){
  net.infert1 <- neuralnet(case~parity+induced+spontaneous+ pooled.stratum,
                           data=traindata1,
                           err.fct="ce",
                           linear.output=FALSE,
                           likelihood=TRUE,
                           hidden = c(grid[i,1],grid[i,2]),
                           stepmax=1e6)
  y <- testdata1$case
  net.results1 <- compute(net.infert1, testdata1[,c(3,4,6,8)])
  pred1 <- net.results1$net.result
  p <- ifelse(pred1>= 0.5, 1, 0)
  fu_err = mean(y != p)
  error = c(error, fu_err)
}
grid_err= cbind(grid, error)
grid_fin=grid[which.min(error), ]
net.infert2 <- neuralnet(case~parity+induced+spontaneous+pooled.stratum,
                         data=traindata1, err.fct="ce",
                         linear.output=FALSE, likelihood=TRUE,
                         hidden = grid_fin, stepmax=1e6)
net.results2 <- compute(net.infert2, testdata1[,c(3,4,6,8)])


# ■ 은닉층의 최적 은닉노드 선정 및 결과 확인
grid_err
# Var1 Var2 error
# 1 1 1 0.2266666667
# 2 2 1 0.2933333333
# 3 1 2 0.2266666667
# 4 2 2 0.2666666667

grid_fin
# Var1 Var2
# 1 1 1
library(NeuralNetTools) # 중요 변수 확인(은닉층이 단일층인 경우만 확인 가능)
net.infert2 <- neuralnet(case~parity+induced+spontaneous+pooled.stratum,
                         data=traindata1, err.fct="ce", linear.output=FALSE,
                         likelihood=TRUE, hidden = 3, stepmax=1e6)

# 최솟값, 1~4분위 수, 최댓값을 기준으로
# 각 입력변수와 출력변수 간의 관계성을 확인할 수 있는 비교 그래프 출력
print(var.imp1 <- garson(net.infert2)) # 변수 중요도 그래프 출력하기

# ■ 중요 변수 도출 결과 확인
var.imp1$data
# rel_imp x_names
# 2 0.2227817679 induced
# 4 0.2298584798 pooled.stratum
# 3 0.2375188150 spontaneous
# 1 0.3098409373 parity

print(var.sens <- lekprofile(net.infert2))


# 함수식(formula) 생성
# 신경망 함수식 입력 시 종속변수의 개수가 많은 경우, 
# as.formula 함수를 활용해 손쉽게 함수식을 생성할 수 있음
n = names(traindata1)
print(f <- as.formula(paste("case ~", paste(n[!n %in% "case"],
                                            collapse = " + "))))
# [1] case ~ education + age + parity + induced + spontaneous + stratum + pooled.stratum

