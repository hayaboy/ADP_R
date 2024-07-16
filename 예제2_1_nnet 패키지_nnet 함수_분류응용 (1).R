install.packages("nnet")
library(nnet)
ir <- rbind(iris3[,,1],iris3[,,2],iris3[,,3]) #Dataset 설정
targets <- class.ind( c(rep("s", 50), # 신경망 출력변수를 위해 원-핫 벡터 생성
                        rep("c", 50),
                        rep("v", 50)))
samp <- c(sample(1:50,25), # 훈련자료 및 검정자료 설정
          sample(51:100,25),
          sample(101:150,25))
ir1 <- nnet(ir[samp,], targets[samp,], size = 2, # 신경망 학습
            rang = 0.1, decay = 5e-4, maxit = 200)
pred01 <- predict(ir1, ir[-samp,]) # 예측
test.cl <- function(true, pred) { # 결과 출력용 함수 생성
  true <- max.col(true)
  cres <- max.col(pred)
  table(true, cres)
}
test.cl(targets[-samp,], pred01) # 출력 결과 확인