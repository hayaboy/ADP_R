###첫번째 방법

install.packages("nnet")

library(nnet)
?nnet::nnet()
#자료의 수는 150개, 입력 변수 차원은 4이며, 목표값 3개의 범주
nn.iris<-nnet(Species ~ . ,data = iris, size=2, rang=0.1, decay=5e-4,maxit= 200)
#size에는 은닉 노드 수 , rang : 초기 가중치 값, 
# decay	parameter for weight decay. Default 0.
# maxit 반복 학습 수,  디폴트는 100
summary(nn.iris)
source_url("https://gist.githubusercontent.com/Peque/41a9e20d6687f2f3108d/raw/85e14f3a292e126f1454864427e3a189c2fe33f3/nnet_plot_update.r")
plot.nnet(nn.iris)
#선의 굵기는 연결선의 가중치(weights)에 비례


###두번째 방법
install.packages("clusterGeneration")
library(clusterGeneration)
library(scales)
library(reshape2)
plot(nn.iris)




#정오분류표(confusion table)

table(iris$Species, predict(nn.iris, iris, type="class"))









