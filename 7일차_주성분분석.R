#PCA

iris

cor(iris[1:4])


?prcomp()


iris.pca<-prcomp(iris[1:4], center = T, scale. = T)


iris.pca


#PC1=0.5210659 *Sepal.Length -0.2693474*Sepal.Width +0.5804131*Petal.Length +0.5648565*Petal.Width

summary(iris.pca)

plot(iris.pca, type='l', main="주성분")


#princomp를 통한 주성분 분석


data("USArrests")
str(USArrests)


pc1<-princomp(USArrests, cor = T)
pc1

summary(pc1)


plot(pc1, type="l")


#주성분 분석 구현 이전의 변수의 평균과 표준편차 확인

pc1$center

pc1$scale

#원래의 변수들이 각 주성분 변수에 기여하는 가중치(계수)는 loadings를 통해 확인
pc1$loadings
#제1주성분에는 각 변수들이 UrbanPop을 제외한 나머지 3개 범죄수가 비슷한 기여를 하고 있지만
#가중치 벡터와 원래의 데이터 값 x들을 곱하여 계산되는 실제 주성분 값 혹은 주성분 점수는 $scores를 통해 확인

pc1$scores

plot

plot(pc1$scores[,1], pc1$scores[,2], xlab="Z1", ylab="Z2")
abline(v=0, h=0, col="gray")

#주성분 분석 결과로 축약된 차원 공간에서 각 데이터 관측치 n 개들의 상대적 위치
#와 p개 변수 사이의 관계를 평면상에서 한꺼번에 파악할 수 있는 시각화기법이 있는데 이
#를 행렬도(biplot) 기법이라고 한다.



biplot(pc1, cex=0.7)

