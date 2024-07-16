

data("Titanic")

str(Titanic)

?Titanic


#knn

install.packages("class")
library(class)


?class::knn()


data("iris")


attach(iris)

set.seed(100)

N<-nrow(iris)

sample(c(1,2,3), 2)

1:N

train_idx<-sample(1:N, size = N*(2/3) , replace = FALSE)

train_idx

str(iris)

iris_train<-iris[train_idx , -5]

iris_test<-iris[-train_idx , -5]

nrow(iris_train)
nrow(iris_test)


head(iris_train)

head(iris_test)




iris_train_label<-iris[train_idx , 5]

iris_test_label<-iris[-train_idx , 5]


iris_train_label
iris_test_label



length(iris_train_label)
length(iris_test_label)





class::knn()




md<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=5)

md1<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=3)
md2<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=7)


md

install.packages("gmodels")
library(gmodels)

?gmodels::CrossTable()





CrossTable(iris_test_label, md)




1-(3/(14+15+2+1+18))

CrossTable(iris_test_label, md1)
CrossTable(iris_test_label, md2)




##SVM

install.packages("e1071")
library(e1071)



?e1071::svm

data("iris")

iris

svm_model<-svm( Species ~ . , data = iris  )



svm_model



summary(svm_model)


x<-iris[, -5]

y<-iris[,5]

pred<-predict(svm_model, x)


table(pred, y)


1-(4/150)


colnames(iris)


plot(svm_model, iris,  Petal.Width ~ Petal.Length , slice = list(Sepal.Width=3,Sepal.Length=4))

plot(svm_model, iris,  Petal.Width ~ Petal.Length)






#랜덤포레스트

library(randomForest)
data(iris)

set.seed(1000)
N<-nrow(iris)
#학습 데이터 셋을 2/3, 검증 데이터 셋을 1/3로 분할


tr.idx<-sample(1:N, size = N*2/3)


iris.train<- iris[tr.idx , -5]
iris.test<- iris[-tr.idx , -5]

iris.train

trainLabels<- iris[tr.idx, 5]
testLabels<- iris[-tr.idx, 5]





train<-iris[tr.idx, ]

test<-iris[-tr.idx, ]


?randomForest

rf<-randomForest(Species ~ . , data=train, importance=T, mtry=4)


#mtry 는 Number of variables 

rf

randomForest::varImpPlot()

?varImpPlot()

varImpPlot(rf)




#PCA

#국, 영,수, 과

#언어 
#수리


#주성분 분석은 데이터의 포인트를 가장 잘 구별해주는 변수인 주성분을 찾는 방법
#n개의 관측치와 p개의 변수로 구성된 데이터를 상관관계가 없는 k개의 변수로 구성되 데이터로 요약





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

USArrests


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



plot(pc1$scores[,1], pc1$scores[,2], xlab="Z1", ylab="Z2")
abline(v=0, h=0, col="gray")



#주성분 분석 결과로 축약된 차원 공간에서 각 데이터 관측치 n 개들의 상대적 위치
#와 p개 변수 사이의 관계를 평면상에서 한꺼번에 파악할 수 있는 시각화기법이 있는데 이
#를 행렬도(biplot) 기법이라고 한다.
biplot(pc1, cex=0.7)


