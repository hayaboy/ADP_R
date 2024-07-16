install.packages("rpart")
library(rpart)
data("iris")
c<-rpart(Species ~ . , data=iris)
c
plot(c, compress=T, margin = 0.3)
summary(c)
?plot

text(c, cex=1.5)

# predict()함수를 이용하여 새로운 자료에 대해 예측을 수행한다.
iris

predict(c, newdata = iris, type="class")

install.packages("rpart.plot")
?rpart.plot::prp
library(rpart.plot)
prp(c,type=4,extra=2)
# 최종노드(terminal node)에 대한 해석
# 두 조건( Petal.length >= 2.5 와 Petal.Width < 1.8 )을 만족하는
#노드에서 49/54는 이 노드에 속하는 해당 개체가 54개이며 이 가운데
#versicolor가 49임을 나타낸다.