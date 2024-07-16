# 비계층적 군집

x<-matrix(rnorm(100), nrow=5)
x

dist(x)

# 수학적거리
# dist()함수는 유클리드(euclidean)거리 Default 값이다.
# 맨하탄거리, 민콥스키거리 

# 통계적 거리 : 표준화거리(변수의 측정 단위를 표준화한 거리), 마할라 노비스(변수의 표준화와 함께 변수 간의
#상관성(분포 형태)을 동시에 고려한 통계적 거리 ) 

#유사성(similarity)과 거리(distance)는 반대 개념임에 유의하여 사용하기 바란다.



dist(x, method="manhattan")
dist(x, method="minkowski")


data(iris)
head(iris)

# iris의 Species 별로 잘 나누어지는지 알아봄

#kmenas()함수를 이용하여 비계층적 군집을 함
?kmeans
kmeans.iris<-kmeans(iris[-5], 3) #군집 수를 미리 지정


# 군집 내 제곱합의 합을 최소화는 하는 것이 목표이므로 그값을 구함
kmeans.iris
kmeans.iris$withinss # 군집 내 거리 제곱합의 벡터
# 소숫점 둘째자리 까지 반올림함
sum(kmeans.iris$withinss)

kmeans.iris$tot.withinss

round(kmeans.iris$tot.withinss,2)

kmeans.iris$cluster

iris[,5]

table(iris[,5], kmeans.iris$cluster)


kmeans10.iris<-kmeans(iris[-5],3, nstart=10) #처음에 시작할 때 10번 넣어서(횟수를 늘림) 정확하게 시작하자 !!

table(iris[,5], kmeans10.iris$cluster)
