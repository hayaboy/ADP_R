if(!require("NeuralNetTools")) { # NeuralNetTools 패키지 설치
  install.packages("NeuralNetTools")
  library(NeuralNetTools)
}
garson(net.sqrt) # neuralnet 학습 후 생성된 모델의 중요 변수 도출

