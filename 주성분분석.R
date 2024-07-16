#주성분  분석

#1 iris data example
data("iris")
iris
str(iris)
iris.pca<-prcomp(iris[ ,1:4])
iris.pca
summary(iris.pca)
?biplot
biplot(iris.pca)
getwd()

#2 라면 data example
setwd("C:/EX/R")
myun<-read.csv("datapca.csv")
myun

 myun$X
 


str(myun)
myun1<-myun[,2:4]
myun2<-prcomp(myun1, scale=TRUE)
round(predict(myun1),2)
biplot(myun2)
myun$X


?biplot

#3 소비자 선호도 data example




Price <- c(6,7,6,5,7,6,5,6,3,1,2,5,2,3,1,2)
Software <- c(5,3,4,7,7,4,7,5,5,3,6,7,4,5,6,3)
Aesthetics <- c(3,2,4,1,5,2,2,4,6,7,6,7,5,6,5,7)
Brand <- c(4,2,5,3,5,3,1,4,7,5,7,6,6,5,5,7)
data <- data.frame(Price, Software, Aesthetics, Brand)
data
pca<-princomp(data, cor=T)

pca

summary(pca)


summary(pca,loadings =T)

biplot(pca)


#                          Comp.1    Comp.2

#Proportion of Variance 0.6075727 0.2403006
# Comp.1이 60%, Comp.1 + Comp.2까지 하면 84%를 설명해 준다.


#Comp1은 Aesthetics와 Brand가 클수록, Price는 낮을 수록 높은 값을 갖는다.

#Comp2는 Software의 영향만을 크게 받는다.







