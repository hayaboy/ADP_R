if(!require("neuralnet")) { # 신경망 패키지 neuralnet 설치
  install.packages("neuralnet")
  library(neuralnet)
}
traininginput <- as.data.frame(runif(50, min=0, max=100)) # 훈련자료 생성
# 입력자료 생성, 균등분포에서 난수 50개 생성
trainingoutput <- sqrt(traininginput) # 출력값은 입력값의 제곱근으로 가정
trainingdata <- cbind(traininginput, trainingoutput)
colnames(trainingdata) <- c("Input","Output")
testdata <- as.data.frame((1:10)^2) # 검정자료 생성, 1부터 10까지 정수의 제곱값
net.sqrt <- neuralnet(Output~Input, trainingdata, # 신경망 학습
                      hidden=10, threshold=0.01)
print(net.sqrt) # 결과 출력하기
plot(net.sqrt) # 시각화
net.results <- compute(net.sqrt, testdata) # 예측
print(net.results$net.result)
cleanoutput <- cbind(testdata,sqrt(testdata), # 출력 결과 테이블 형태로 변형
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("Input","Expected Output","Neural Net Output")
print(cleanoutput)

# ■ 출력 테이블 결과 확인

# Input Expected Output NeuralNet Output
# 1 1 1 1.009193672
# 2 4 2 1.999715664
# 3 9 3 3.001308584
# 4 16 4 3.998627834
# 5 25 5 5.001204805
# 6 36 6 6.002078109
# 7 49 7 6.994684220
# 8 64 8 7.996689130
# 9 81 9 9.007109599
# 10 100 10 9.986093586