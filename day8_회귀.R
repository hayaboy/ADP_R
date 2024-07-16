print("hi")

?c


#<-
  
height<-c(166,168,170,172,174)
class(height)
is(height)
mean(height)
?sd
sd(height)
var(height)

summary(height)
boxplot(height)
IQR(height)
?IQR




?datasets

datasets::iris
?str
#structure 데이터 구조
str(iris)
View(iris)


ad<-c(13,8,10,15,12,15,14,15,17,19,20,21,22,21,25)
is(ad)

sales<-c(94,70,90,100,95,100,85,95,105,105,110,105,104,105,121)

plot(ad,sales)


ad_mean<-mean(ad)
sales_mean<-mean(sales)

length(sales)
sum((ad - ad_mean)*(sales-sales_mean))


sum((ad - ad_mean)*(sales-sales_mean)) / (length(sales) -1)


?cov()

cov(ad, sales)

cor(ad, sales)

cor(ad, sales)^2


?lm

# formula     종속변수  ~ 독립변수 

lm(sales  ~ ad)


summary(lm(sales  ~ ad))
#결정계수 R제곱 =SSR(회귀 제곱합)/SST(총제곱합) 
#결정계수는 총편차 중 회귀선으로 설명되는 양을 나타내므로, 설명되는 비율이 높다면
#1에 수렴하게 된다. 












