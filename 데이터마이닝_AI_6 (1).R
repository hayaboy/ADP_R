install.packages("class")#knn을 수행하기 위해
install.packages("gmodels")#cross table을 위한 
install.packages("scales")#최적 K를 그래프로 표현
library(class)
library(gmodels)
library(scales)


datasets::iris

attach(iris)





set.seed(100)

N<-nrow(iris)


#sample(c(1,2,3),2)


train_index<-sample(1:N, size = N*(2/3), replace = FALSE)

train_index

iris_train<-iris[train_index, -5]
iris_train
iris_test<-iris[-train_index, -5]
iris_test


iris_train_label<-iris[train_index, 5]

iris_test_label<-iris[-train_index, 5]


length(iris_train_label)

length(iris_test_label)

?class::knn()

md<-knn(train=iris_train,test =iris_test, cl=iris_train_label,k=5 )

md

iris_test

?CrossTable()

CrossTable(iris_test_label,md)

CrossTable(iris_test_label,md, prop.chisq=FALSE)


49/50


(a<-3*5)




install.packages("tree")
install.packages("caret")

datasets::iris

iris_df<-datasets::iris

attach(iris_df)

set.seed(2000)


N<-nrow(iris_df)


tr.idx<-sample(1:N,size = N*2/3, replace = FALSE)



train_data<-iris_df[tr.idx, ]
test_data<-iris_df[-tr.idx,]


View(test_data)

nrow(train_data)
nrow(test_data)


?tree
tree(Species ~ . ,data = train_data)

treedata<-tree(Species ~ . ,data = train_data)

plot(treedata)
text(treedata, cex=1)

?cv.tree()

cv.tree(treedata,FUN = prune.misclass)

cv.tr<-cv.tree(treedata,FUN = prune.misclass)
plot(cv.tr)



prune.tr<-prune.misclass(treedata,best = 3)
plot(prune.tr)
text(prune.tr,pretty = 0,cex=1)


install.packages("e1071")


iris_df<-datasets::iris
?svm

svm_md<-svm(Species ~ . , data=iris_df)

View(iris_df)

summary(svm(Species ~ . , data=iris_df))


x<-iris_df[,-5]
x
y<-iris_df[,5]

pred<-predict(svm_md, x)

table(pred,y)

?plot
?e1071::probplot()
#http://ugrad.stat.ubc.ca/R/library/e1071/html/plot.svm.html
library(MASS)
data(cats)
?cats
View(cats) #해부의
m <- svm(Sex~., data = cats)
plot(m, cats)

data(iris)
list(Sepal.Width = 3, Sepal.Length = 4)
m2 <- svm(Species~., data = iris)
plot(m2, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))


#a list of named numeric values for the dimensions held constant (only needed if more than two variables are used). Dimensions not specified are fixed at 0.
#상수로 유지되는 차원에 대한 명명 된 숫자 값 목록 (두 개 이상의 변수가 사용되는 경우에만 필요함) 지정되지 않은 치수는 0으로 고정됩니다.

str(iris)

plot(m2, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))

range(iris$Sepal.Length)
range(iris$Sepal.Width)

plot(m2, iris, Sepal.Width ~ Sepal.Length, slice = list(Petal.Width = 1,
                                                        Petal.Length = 2))
range(iris$Sepal.Length)
range(iris$Sepal.Width)


?data
data(iris)
attach(iris)
cor(iris[1:4])
#변수가 제로 중심이되도록 이동해야하는지 여부를 나타내는 논리 값. 또는 x의 열 수와 동일한 길이의 벡터를 제공 할 수 있습니다. 값은 스케일로 전달됩니다.
#분석이 수행되기 전에 변수가 단위 분산을 갖도록 척도 화되어야하는지 여부를 나타내는 논리 값. S와의 일관성을 위해 기본값은 FALSE이지만 일반적으로 확장하는 것이 좋습니다. 또는 x의 열 수와 동일한 길이의 벡터를 제공 할 수 있습니다. 값은 스케일로 전달됩니다.
?prcomp
prcomp(iris[,1:4],center = T,scale. =T)

pca_md<-prcomp(iris[,1:4],center = T,scale. =T)
summary(pca_md)
plot(pca_md,type='l')

5e-4 * 10000

5e-4 * 100000

install.packages("nnet")
library(nnet)
data(iris)
attach(iris)
nnet(Species ~ . , data=iris, size=2,rang=0.1,decay=5e-4,maxit=200)
#size	number of units in the hidden layer
?nnet
nnet(Species ~ . , data=iris, size=2,rang=0.1,decay=0,maxit=200)

nn_md<-nnet(Species ~ . , data=iris, size=2,rang=0.1,decay=5e-4,maxit=200)
summary(nn_md)


library(devtools)

source_url('https://gist.githubusercontent.com/Peque/41a9e20d6687f2f3108d/raw/85e14f3a292e126f1454864427e3a189c2fe33f3/nnet_plot_update.r')

plot.nnet(nn_md)


install.packages("clusterGeneration")
library(clusterGeneration)
library("scales")
install.packages("reshape")
library("reshape")
plot(nn_md)


table(iris$Species,predict(nn_md,iris,type = 'class'))




install.packages("DAAG")
library(DAAG)
install.packages("lattice")
library(lattice)

wages1883<-DAAG::wages1833

str(wages1883)

dat<-wages1883
dat2<-na.omit(dat)
str(dat2)
distdat<-dist(dat2)
hc_a<-hclust(distdat,method = "single")
plot(hc_a, hang = -1,cex=0.7)
?plot
#The fraction of the plot height by which labels should hang below the rest of the plot. A negative value will cause the labels to hang down from 0
#플롯의 나머지 부분 아래에 레이블이 걸려야하는 플롯 높이의 비율입니다. 음수 값은 레이블이 0에서 중단되게합니다


hc_complete<-hclust(distdat,method = "complete")
hc_complete
plot(hc_complete, hang = -1,cex=0.7)



hc_average<-hclust(distdat,method = "average")
hc_average
plot(hc_average, hang = -1,cex=0.7)


hc_centroid<-hclust(distdat,method = "centroid")
hc_centroid
plot(hc_centroid, hang = -1,cex=0.7)

?hclust

hc_ward<-hclust(distdat,method = "ward.D2")
hc_ward
plot(hc_ward, hang = -1,cex=0.7)


rect.hclust(hc_ward,k=5)






wage_data<-wages1883
wage_data<-na.omit(wage_data)
install.packages("factoextra")
library(factoextra)
?fviz_nbclust
fviz_nbclust(wage_data,kmeans,method = "wss")

?kmeans
set.seed(200)
kmeans(wage_data,3,nstart = 25)

nstart	
#if centers is a number, how many random sets should be chosen?
#The kmeans() function has an nstart option that attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial configurations. This approach is often recommended

km<-kmeans(wage_data,3,nstart = 25)
?fviz_cluster
fviz_cluster(km,data = wage_data,ellipse.type = "convex",repel = TRUE)
#Character specifying frame type. Possible values are 'convex', 'confidence' or types supported by stat_ellipse including one of c("t", "norm", "euclid").
#프레임 유형을 지정하는 문자입니다. 가능한 값은 'convex', 'confidence'또는 c ( "t", "norm", "euclid") 중 하나를 포함하여 stat_ellipse에서 지원하는 유형입니다.
#a boolean, whether to use ggrepel to avoid overplotting text labels or not.
#boolean, ggrepel을 사용하여 텍스트 레이블을 오버 플로팅하지 않도록할지 여부입니다.



#https://en.wikipedia.org/wiki/K-medoids

#CLARA


library("cluster")
cluster::pam()


pam(wage_data,3)

pam_out<-pam(wage_data,3)

table(pam_out$clustering)

fviz_cluster(pam_out,data=wage_data,ellipse.type = "convex",repel = FALSE)

fviz_cluster(pam_out,data=wage_data,ellipse.type = "convex",repel = TRUE)



install.packages("arules")
library(arules)
m<-read.csv(file.choose())
m.list<-split(m$Item,m$ID)
m.list
?split


as(m.list,"transactions")
?as
m.trans<-as(m.list,"transactions")

inspect(m.trans)



apriori(m.trans,parameter = list(support=0.2,confidence=0.20,minlen=3))

m_rule<-apriori(m.trans,parameter = list(support=0.2,confidence=0.20,minlen=3))

inspect(m_rule)



m2_rule<-apriori(m.trans,parameter = list(support=0.2,confidence=0.20,minlen=2))
m2_rule
inspect(m2_rule)
?inspect
itemFrequencyPlot(m.trans,support=0.2,col="red")
install.packages("arulesViz")
library(arulesViz)
plot(m2_rule,method = "graph",engine='interactive')
