#로지스틱 회귀분석

rm(list=ls())

data("iris")

a<-subset(iris, Species=="setosa" | Species=="versicolor")
a

class(a)
class(a$Species)

str(a)
#setosa는 Y=1, versicolor는 Y=2로 인식


b<-glm( Species ~ Sepal.Length, data = a, family = binomial)

summary(b)


exp(5.140)


coef(b)





confint(b, parm = "Sepal.Length")


exp(confint(b, parm = "Sepal.Length"))


class(b)

fitted(b)


fitted(b)[c(1:5, 96:100)]


predict(b, newdata = a[c(1,50,51,100), ],type = "response")

plot(a$Sepal.Length, a$Species, xlab="Sepal.Lenth")

x=seq(min(a$Sepal.Length), max(a$Sepal.Length), 0.1)
x

lines(x, 1+(1/(1+(1/exp(-27.831+5.140*x)))), type = "l", col="red")





##예측 변수가 여러 개인 다중 로지스틱 회귀모형

attach(mtcars)

str(mtcars)



glm.vs<-glm(vs ~ mpg+am, data = mtcars, family = binomial)


summary(glm.vs)


exp(0.6809)


exp(-3.0073)



step.vs<-step(glm.vs, direction = "backward")


summary(step.vs)




ls(glm.vs)




str(glm.vs)







anova(glm.vs, test = "Chisq")



1-pchisq(18.327,1)

1-pchisq(4.887 ,1)



##신경망 모형

library(nnet)
nn.iris<-nnet(Species ~ . , data = iris, size=2, rang=0.1, decay=5e-4, maxit=200)


summary(nn.iris)

library(devtools)

source_url('https://gist.githubusercontent.com/Peque/41a9e20d6687f2f3108d/raw/85e14f3a292e126f1454864427e3a189c2fe33f3/nnet_plot_update.r')

plot.nnet(nn.iris)




install.packages("clusterGeneration")

library(clusterGeneration)
library(scales)
library(reshape)
plot(nn.iris)




table(iris$Species, predict(nn.iris,  type = "class"))



data("infert", package = "datasets")
str(infert)


install.packages("neuralnet")
library(neuralnet)


colnames(infert)

net.infert<-neuralnet(case ~ age+parity+induced+spontaneous, data = infert, hidden = 2, err.fct = "ce", linear.output = F, likelihood = T)


net.infert





plot(net.infert)

names(net.infert)


net.infert$result.matrix


out<-cbind(net.infert$covariate, net.infert$net.result[[1]])

out

dimnames(out) <- list(NULL, c("age", "parity", "induced", "spontaneous", "nn-output"))

head(out)


head(net.infert$generalized.weights[[1]])



par(mfrow=c(2,2))

gwplot(net.infert, selected.covariate = "age", min = -2.5, max=5)
gwplot(net.infert, selected.covariate = "parity", min = -2.5, max=5)
gwplot(net.infert, selected.covariate = "induced", min = -2.5, max=5)
gwplot(net.infert, selected.covariate = "spontaneous", min = -2.5, max=5)


#age=22, parity=1, induced<=1, spontaneous<=1

new.output<-compute(net.infert, covariate = matrix(c(22,1,0,0,
                                         22,1,1,0,
                                         22,1,0,1,
                                         22,1,1,1), byrow = T,ncol = 4))


new.output$net.result



#의사결정 나무 모형
library(rpart)
c <-rpart(Species ~ ., data = iris)
c

par(mfrow=c(1,1))

plot(c, compress = T, margin = 0.3)
text(c, cex=1.5)


head(predict(c, newdata = iris, type = "class"))

install.packages("rpart.plot")
library(rpart.plot)
prp(c,type = 4,extra = 2)



ls(c)

c$cptable


opt<-which.min(c$cptable[, "xerror"])
opt
cp<-c$cptable[opt,"CP"]
cp
prune.c<-prune(c,cp = cp)
plot(prune.c)
text(prune.c,use.n = T)

plotcp(c)


##앙상블

#배깅

install.packages("adabag")
library(adabag)
data("iris")
iris.bagging<-bagging(Species ~ ., data = iris, mfinal = 10)


iris.bagging$importance


plot(iris.bagging$trees[[10]])
text(iris.bagging$trees[[10]])


pred<-predict(iris.bagging, newdata = iris)
table(pred$class,iris[,5])



#부스틩


library(adabag)
data(iris)
boo.adabag<-boosting(Species ~ . , data = iris, boos = T, mfinal = 10)

boo.adabag$importance


plot(boo.adabag$trees[[1]])
text(boo.adabag$trees[[1]])

pred<-predict(boo.adabag, newdata = iris)
tb<-table(pred$class,iris[,5])
tb

error.rpart<-1-(sum(diag(tb))/sum(tb))
error.rpart

install.packages("ada")

library(ada)

data("iris")
iris[iris$Species!="setosa", ] ->iris

iris



n<-dim(iris)[1]
n



trind<-sample(1:n, floor(.6*n), FALSE)
teind<-setdiff(1:n, trind)
iris[,5]<-as.factor((levels(iris[,5])[2:3])[as.numeric(iris[,5])-1])


gdis<-ada(Species ~ . , data = iris[trind, ], iter=20,nu=1, type="discrete")
gdis<-addtest(gdis,iris[teind,-5], iris[teind,5])
gdis


plot(gdis,TRUE,TRUE)


varplot(gdis)



pairs(gdis, iris[trind,-5], maxvar = 4)



#랜덤포레스트


library(randomForest)
library(rpart)
data("stagec")

stagec3<-stagec[complete.cases(stagec), ]
set.seed(1234)
ind<-sample(2, nrow(stagec3), replace = T,prob = c(0.7,0.3))
trainData<-stagec3[ind==1,]
testData<-stagec3[ind==2,] 
rf<-randomForest(ploidy ~ ., data = trainData, ntree=100, proximity=T)
table(predict(rf), trainData$ploidy)
print(rf)

plot(rf)


importance(rf)






rf.pred<-predict(rf, newdata = testData)
table(rf.pred, testData$ploidy)

plot(margin(rf))

library(party)
set.seed(1234)
cf<-cforest(ploidy ~ . , data=trainData)
cf.pred<-predict(cf, newdata=testData,OOB = TRUE,type="response")
cf.pred








#모형 평가

data("iris")
nrow(iris)
set.seed(1234)
idx<-sample(2,nrow(iris), replace = T, prob = c(0.7,0.3))
trainData<-iris[idx==1,]
testData<-iris[idx==2,]
nrow(trainData)
nrow(testData)





rm(list = ls())

data("iris")
set.seed(1234)
k=10
iris<-iris[sample(nrow(iris)), ]
folds<-cut(seq(1,nrow(iris)), breaks=k, labels=F)
folds

trainData=list(0)
testData=list(0)




for(i in 1:k){
  testIdx<-which(folds==i, arr.ind=TRUE)
  testData[[i]]<-iris[testIdx, ]
  trainData[[i]]<-iris[-testIdx, ]
}


head(trainData[[1]])



rm(list=ls())


data("iris")

iris<-subset(iris, Species=="setosa"|Species=="versicolor")

iris



iris$Species<-factor(iris$Species)
set.seed(1234)
iris<-iris[sample(nrow(iris)), ]
trainData<-iris[1:(nrow(iris)*0.7),]
testData<-iris[((nrow(iris)*0.7)+1):nrow(iris),]
nrow(trainData)



library(nnet)
library(rpart)
nn.iris<-nnet(Species~., data = trainData, size=2, rang=0.1, decay=5e-4, maxit=200)
dt.iris<-rpart(Species~.,  data=trainData)


nn_pred<-predict(nn.iris, testData, type = "class")
dt_pred<-predict(dt.iris, testData, type = "class")


install.packages("e1071")
library(e1071)
library(caret)

class(nn_pred)
class(testData$Species)

nn_pred<-factor(nn_pred)

nn_con<-confusionMatrix(nn_pred, testData$Species)

dt_con<-confusionMatrix(dt_pred, testData$Species)


nn_con$table

dt_con$table



accuracy<-c(nn_con$overall['Accuracy'], dt_con$overall['Accuracy'])

precision<-c(nn_con$byClass['Pos Pred Value'], dt_con$byClass['Pos Pred Value'])

recall<-c(nn_con$byClass['Sensitivity'], dt_con$byClass['Sensitivity'])


f1<- 2* ((precision*recall) / (precision+recall))
  
  
result <-data.frame(rbind(accuracy, precision,recall, f1))


names(result)<-c("Neural Network", "Decision Tree")
result






#ROC 그래프

set.seed(1234)

infert<-infert[sample(nrow(infert)), ]
infert<-infert[, c("age","parity","induced","spontaneous","case")]


trainData<-infert[1:(nrow(infert)*0.7), ]
testData<-infert[((nrow(infert)*0.7)+1):nrow(infert), ]

library(neuralnet)


net.infert<-neuralnet(case ~ age+parity+induced+spontaneous, data=trainData, hidden = 3, err.fct = "ce", linear.output = F, likelihood = T)

n_test<-subset(testData, select=-case)


nn_pred<-compute(net.infert, n_test)


testData$net_pred<-nn_pred$net.result

head(testData)

install.packages("C50")
library(C50)
trainData$case<-factor(trainData$case)
dt.infert<-C5.0(case ~ age+parity+induced+spontaneous, data=trainData)

testData$dt_pred<-predict(dt.infert, testData, type = "prob")[ ,2]
head(testData)

install.packages("Epi")

library(Epi)

neural_ROC<-ROC(form=case~net_pred, data = testData, plot="ROC")


dtree_ROC<-ROC(form=case~dt_pred, data = testData, plot="ROC")



#이익도표


install.packages("ROCR")
library(ROCR)
n_r<-prediction(testData$net_pred, testData$case)
d_r<-prediction(testData$dt_pred, testData$case)

n_p<-performance(n_r,"tpr","fpr")
d_p<-performance(d_r,"tpr","fpr")


plot(n_p, col="red")

par(new=TRUE)
plot(d_p,col="blue")
abline(a=0,b=1)


#향상도 곡선 예제

n_lift<-performance(n_r,"lift","rpp")
plot(n_lift,col="red")
abline(v=0.2)




#계층적 군집


data("USArrests")
str(USArrests)


?dist


d<-dist(USArrests, method = "euclidean")

d


?hclust()



fit<-hclust(d, method = "ave")


par(mfrow=c(1,2))
plot(fit)
plot(fit, hang=-1)
par(mfrow=c(1,1))



groups<-cutree(fit,k=6)

groups

plot(fit)

rect.hclust(fit,k=6, border = "red")


hca<-hclust(dist(USArrests))


plot(hca)


rect.hclust(hca, k=3, border = "red")


rect.hclust(hca, h=50, which = c(2,7), border = 3:4)





library(cluster)
agn1<-agnes(USArrests, metric = "manhattan", stand = T)
agn1


par(mfrow=c(1,2))
plot(agn1)


agn2<-agnes(daisy(USArrests), diss = TRUE, method = "complete")
plot(agn2)



agn3<-agnes(daisy(USArrests), method = "flexible", par.method = 0.6)
plot(agn3)


par(mfrow=c(1,1))



#k-평균 군집



wssplot<-function(data,nc=15,seed=1234){
  wss<-(nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:nc){
    set.seed(seed)
    wss[i]<-sum(kmeans(data,centers = i)$withinss)
  }
  plot(1:nc, wss, type="b", xlab="Number of clusters", ylab="Within groups sum of squares")
}

install.packages("rattle")

library(rattle)

data("wine", package = "rattle")

head(wine)



df<-scale(wine[-1])

wssplot(df)

install.packages("NbClust")

library(NbClust)
set.seed(1234)


nc<-NbClust(df, min.nc = 2, max.nc = 15, method = "kmeans")

par(mfrow=c(1,1))

barplot(table(nc$Best.n[1,]), xlab = "Number of Clusters", ylab = "Number of Criteria", main="Number of Clusters Chosen by 26 Criteria")





set.seed(1234)


fit.km<-kmeans(df,3,nstart = 25)
fit.km$size


fit.km$centers



plot(df, col=fit.km$cluster)

points(fit.km$centers, col=1:3, pch=8, cex=1.5)



aggregate(wine[-1], by = list(cluster=fit.km$cluster), mean)






ct.km<-table(wine$Type, fit.km$cluster)
ct.km


install.packages("flexclust")
library(flexclust)
randIndex(ct.km)


data("Nclus")
plot(Nclus)

cl<-kcca(Nclus,k=4,family = kccaFamily("kmeans"))
image(cl)
points(Nclus)
barplot(cl)
stripes(cl)



install.packages("cclust")
library(cclust)
cl.1<-cclust(Nclus,4,20,method = "kmeans")
plot(Nclus,col=cl.1$cluster)
points(cl.1$centers, col=1:4, pch=8, cex=1.5)


library(cluster)
clusplot(Nclus, cl.1$cluster)


#혼합분포 군집

install.packages("mixtools")
library(mixtools)


data("faithful")

attach(faithful)


hist(waiting, main="Time between Old Faithful eruptions",xlab="Minuites", ylab="", cex.main=1.5, cex.lab=1.5, cex.axis=1.4)

wait1<-normalmixEM(waiting, lambda = .5, mu=c(55,80), sigma = 5)
summary(wait1)

plot(wait1, dens=TRUE, cex.axis=1.4,cex.main=1.8,main2="Time between Old Faithful eruptions", xlab2="Minutes")


install.packages("mclust")

library(mclust)
mc<-Mclust(iris[,1:4], G=3)
summary(mc, parameters=TRUE)

plot.Mclust(mc)

str(mc)

mc$classification


##SOM

install.packages("kohonen")
library(kohonen)
data("wines")
str(wines)
head(wines)

wines.sc<-scale(wines)
set.seed(7)

?som
wine.som<-som(wines.sc, grid=somgrid(5,4,"hexagonal"), alpha=c(0.05,0.01),keep.data=TRUE)
plot(wine.som, main="Wine data")




summary(wine.som)

colnames(wine)
wine$Type

par(mfrow=c(1,2))
plot(wine.som, type="counts", main="wine data:counts")
plot(wine.som, type="quality", main="wine data:mapping quality")

par(mfrow=c(1,3))

colour1<-tricolor(wine.som$grid)
plot(wine.som,"mapping",bg=rgb(colour1))



colour2<-tricolor(wine.som$grid, phis = c(pi/6, 0,-pi/6))
plot(wine.som,"mapping",bg=rgb(colour2))


colour3<-tricolor(wine.som$grid, phis = c(pi/6, 0,-pi/6), offset = .5)
plot(wine.som,"mapping",bg=rgb(colour3))

#연관분석

library(arules)
data("Adult")

Adult

#as(Adult, "data.frame")


rules<-apriori(Adult)

inspect(head(rules))




adult.rules<-adult.rules<-apriori(Adult, parameter = list(support=0.1, confidence=0.6),appearance = list(rhs=c('income=small', 'income=large'), default='lhs'), control = list(verbose=F))


adult.rules.sorted<-sort(adult.rules, by='lift')


inspect(head(adult.rules.sorted))



library(arulesViz)

plot(adult.rules.sorted, method="scatterplot")

plot(adult.rules.sorted, method="graph", control=list(type='items', alpha=0.5))
