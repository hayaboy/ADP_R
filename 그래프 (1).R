# 그래픽 기능

# 산점도(scatter plot)
# x축과 y축으로 이루어진 그래프에 두변수의 값을 점으로 나타낸 그래프

group<-c(1,1,1,2,2,2,2,2,1,1,2,1)
age<-c(12,15,28,22,40,33,31,38,12,30,25,19)
weight<-c(30,45,58,50,61,65,50,51,28,62,50,40)
dat<-cbind(group, age, weight)
dat

plot(x=age, y=weight)
plot(age, weight)

plot(formula=weight~age, data=dat)

plot(formula=weight~age, data=dat, main="Scatter plot",
     xlab="age(seoul)", ylab="weight(average)")


plot(formula=weight~age, data=dat, col=c("red","blue")[group])

#산점도 행렬 : 각각의 산점도를 한눈에 살펴볼 수 있도록 확장된 산점도 행렬
#pairs() 함수 

pairs(dat)

# 히스토그램
# hist()

height<-c(182, 160, 165, 170, 163, 160, 181, 166, 159, 145, 175)
hist(height)

# 상자그림
# boxplot()

boxplot(height)










