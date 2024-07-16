rm(list=ls())
mower.df<-read.csv(file.choose())

library(rpart)
install.packages("rpart.plot")
library(rpart.plot)


colnames(mower.df)

class.tree<-rpart(Ownership ~ . , data=mower.df, control = rpart.control(maxdepth = 2), method = "class")
class.tree

rpart.plot::prp()


?prp

prp(class.tree, type = 1, extra = 1, split.font = 1, varlen = -10)








# iris 자료를 이용하여 의사 결정 나무 분석 수행


c<-rpart(Species ~ . , data=iris)
c

#정지규칙이란 더 이상 분리가 일어나지 않고 현재의 마디가 끝마디가 되도록 하는

#여러 가지 규칙으로 최대 나무의 깊이, 자식 마디의 최소 관측치 수, 카이제곱 통계량, 지니 지수, 엔트로피 지수 등이 있다.

# 가지치기란 끝마디가 너무 많으면 모형이 과대 적합된 상태로 현실문제에 적용할 수 있는 적절한
# 규칙이 나오지 않게 된다. 따라서 분류된 관측치의 비율 또는 MSE 등을 고려하여 수준의 가지치기 규칙을 제공해야 한다. 



plot(c, compress = T, margin = 0.3)
text(c, cex=1.5)


head(predict(c, newdata = iris,type = "class"))
tail(predict(c, newdata = iris,type = "class"))

prp(c, type = 4, extra = 2)


ls(c)

#cptable
#트리의 크기에 따른 비용-복잡도 모수(cost-complexity parameter)

c$cptable



opt<-which.min(c$cptable[, "xerror"])
cp<-c$cptable[opt,"CP"]
cp
prune.c<-prune(c,cp = cp)
plot(prune.c)
text(prune.c, use.n = T)

plotcp(c)

rm(list = ls())

#패키지 party의 ctree()함수 

install.packages("party")

library(party)
data("stagec")

str(stagec)

?stagec

stagec1<-subset(stagec, !is.na(g2))
stagec2<-subset(stagec1, !is.na(gleason))
stagec3<-subset(stagec2, !is.na(eet))

str(stagec3)


set.seed(1234)
ind<-sample(2, nrow(stagec3), replace = TRUE, prob = c(0.7,0.3))
ind


trainData<-stagec3[ind==1,]
nrow(trainData)

testData<-stagec3[ind==2,]
nrow(testData)

colnames(trainData)
tree<- ctree(ploidy ~ . , data = trainData)
tree
plot(tree)


testPred<-predict(tree, newdata=testData)
table(testPred, testData$ploidy)





#회귀나무


airq<-subset(airquality, !is.na(Ozone))
head(airq)
airct<-ctree(Ozone ~ .   , data = airq)
airct

plot(airct)

head(predict(airct, data=airq))


head(airq)


predict(airct, data=airq,type="node")

mean((airq$Ozone - predict(airct))^2)

