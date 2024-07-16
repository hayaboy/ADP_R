test.err = function(h.size){ # 사용자 함수 생성, 입력변수는 노드의 개수
  ir1 <- nnet(ir[samp,], targets[samp,], size = h.size, rang = 0.1,
              decay = 5e-4, maxit = 200)
  y <- targets[-samp, ]
  p <- predict(ir1, ir[-samp, ])
  err = mean(y != p)
  c(h.size, err)
}
# sapply 함수를 활용해 1~5개의 은닉노드 개수에 따른 함수 적용 결과를 출력
out <- t(sapply(1:5, FUN = test.err)) 
out[which.min(out[, 2]), ] # 오차가 최소인 은닉노드의 개수와 오차 확인
plot(out, type = "b", xlab = "The number of Hidden units",
     ylab = "Test Error") # 시각화하기