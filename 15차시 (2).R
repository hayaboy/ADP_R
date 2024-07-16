
?datasets

datasets::cars

data("cars")

str(cars)

summary(cars)

hist(cars$dist, breaks = seq(0,120,10))

"
#이상치 판별

일반적으로 다음의 값을 이상치로 판별합니다.
제 3사분위수 + 1.5 X 사분위수 범위 보다 큰 값
제 1사분위수 - 1.5 X 사분위수 범위 보다 작은 값

"
cars$dist

Q<-quantile(cars$dist)

ul<-Q[4] + 1.5*IQR(cars$dist)
ul


ll<-Q[2] - 1.5*IQR(cars$dist)
ll

boxplot(cars$dist, main="Boxplot of Distance")


which(cars$dist>101)

cars$dist[49]

which(cars$dist<19)


tosscoin(1)







