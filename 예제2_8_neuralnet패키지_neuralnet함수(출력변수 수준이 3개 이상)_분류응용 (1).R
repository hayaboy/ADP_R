# liner.output=FALSE인 경우
library(neuralnet)
iris1 <- iris
out1 <- matrix(nrow=nrow(iris1), ncol=nlevels(iris1$Species))
iris1$Species <- as.numeric(iris1$Species)
for (i in 1:nrow(iris1)){
  if(iris1$Species[i] == 1) {out1[i,]<- c(1,0,0)}
  else if (iris1$Species[i]==2) {out1[i,]<- c(0,1,0)}
  else{out1[i,] <- c(0,0,1)}
}
set.seed(1010)

ind1 <- sample(1:nrow(iris1), nrow(iris1)*0.7, replace=F)
trainx <- iris1[ind1, -2]; trainy <- out1[ind1, ]
train = data.frame(trainx, trainy)
names(train)
# [1] "Sepal.Length" "Petal.Length" "Petal.Width" "Species"
# [5] "X1" "X2" "X3"
testx <- iris1[-ind1, -2]; testy <- out1[-ind1, ]
net.iris1 <- neuralnet(X1+X2+X3~Sepal.Length+Petal.Length+Petal.Width,
                       train, hidden=0, err.fct="ce", linear.output=FALSE)
print(net.iris1); plot(net.iris1)
pred01 <- compute(net.iris1, testx[,-4])
pred02 <- pred01$net.result
pred03 <- round(pred02)
## 또는 pred03 <- ifelse(pred02 >= 0.5, 1, 0) 사용 가능

# ■ 생성된 신경망 모델 및 검정자료의 결과 정확도 확인
pred04 <- max.col(pred03)
table(testx$Species, pred04)


