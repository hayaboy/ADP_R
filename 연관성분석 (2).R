
iris


dim(iris)[1]

idx<-sample(1:dim(iris)[1],40)

iris.s<-iris[idx,]

View(iris.s)

iris.s$Species<-NULL



View(iris.s)

?dist



a<-1:8




dist(iris.s)

a

?dim
dim(a)<-c(2,4)
a
is(a)
class(a)

matrix(1:8, nrow = 2, ncol = 4,byrow=T)


d<-matrix(c(0,1,11,5,8,
            1,0,2,3,4,
        11,2,0,4,5,
        5,3,4,0,6,
        7,5,6,12,0), nrow=5,ncol=5)


dist(d)
#거리 행렬 만들기 함수 as.dist함수


?as.dist


d<-as.dist(d)
d

dist(d)

?hclust


hclust(d, method = "single") #single linkage 최단연결법

plot(hclust(d, method = "single"))
plot(hclust(d, method = "complete"))# complete linkage 최장(완전)연결법
plot(hclust(d, method = "average")) # average linkage 평균연결법
# 평균 연결법 : 모든 항목에 대한 거리 평균을 구하면서 군집하는 연결법
#               계산량이 불필요하게 많아짐
plot(hclust(d, method="centroid")) # centroid 중심 연결법
plot(hclust(d, method="ward.D2")) # Ward linkage 와드연결
#와드 연결법 : 군집 내의 오차제곱합에 기초하여 군집을 수행



newiris<-iris

newiris$Species<-NULL
newiris


?kmeans
kc<-kmeans(newiris, 3)

kc$cluster

table(iris$Species, kc$cluster)




newiris[c(newiris$Sepal.Length, newiris$Sepal.Width), ]



plot(newiris[c("Sepal.Length", "Sepal.Width")],col=kc$cluster)


plot()



install.packages("kohonen")
kohonen
library(kohonen)
data("wines")
str(wines)


View(wines)

?scale()

wines.sc<-scale(wines)


?som


wine.som<-som(wines.sc, grid=somgrid(5,4,"hexagonal"), rlen=100, alpha=c(0.05,0.01))

plot(wine.som)


install.packages("arules")
arules::

  install.packages("arulesViz")


data(Groceries)


str(Groceries)

head(Groceries,6)
View(Groceries)

inspect(Groceries[1:10])

summary(Groceries)
?inspect
head(Groceries,5)





#transactions데이터는 일반 데이터처럼 그냥 이름이나 head(data)와 같은 형태로 볼 수 없고,
#'inspect'라는 함수를 통해서 볼 수 있습니다.


itemFrequency(Groceries)
g<-as.data.frame(itemFrequency(Groceries))
g
g[['itemFrequency(Groceries)']]
sum(g[['itemFrequency(Groceries)']])
nrow(g)  #169개의 식품

summary(Groceries)

#matrix, data frame, list를 transactions class로 변형해 보겠습니다.

itemFrequency(Groceries, type='absolute')

barplot(itemFrequency(Groceries, type='absolute'))

itemFrequencyPlot(Groceries,topN=20, type='absolute')

mtx <- matrix(c(1,1,1,0,0,
                
                1,1,1,1,0,
                
                0,0,1,1,0,
                
                0,1,0,1,1,
                
                0,0,0,1,0), ncol=5, byrow=T)

rownames(mtx)<-paste0("man",1:5)
rownames(mtx)

colnames(mtx)<-letters[1:5] # a,b,c,d,e는 식품 
mtx

#위 matrix 데이터를 transaction 데이터로 변환 
?as
mtx.trans<-as(mtx,"transactions")

class(mtx.trans)

summary(mtx.trans)

inspect(mtx.trans)

inspect(Groceries[1:10])


list <- list(tr1=c("a","b","c"),
             
             tr2=c("a","d"),
             
             tr3=c("b","e"),
             
             tr4=c("a","d","e"),
             
             tr5=c("b","c","d"))


list.trans<-as(list,"transactions")
summary(list.trans)

inspect(list.trans)




#Groceries데이터는 어떤 데이터로 이루어졌는가?


Groceries@data
Groceries@itemInfo

rm(list=ls())
x<-c(10,11,12,10,11,12,20,21,22,20,21,22)
y<-c(4000,3900,4000,1000,800,1000,4000,3900,4000,1000,800,1000)

simpleSquare<-data.frame(x,y)
simpleSquare

ss_scaled<-scale(simpleSquare)
ss_scaled
summary(ss_scaled)

str(ss_scaled)

class(ss_scaled)
is(ss_scaled)


sd(ss_scaled[,'x'])
sd(ss_scaled[,'y'])


plot(ss_scaled,type='n')
text(ss_scaled)
ss_scaled

ss_scaled


ss_scaled[1,]

sqrt((ss_scaled[1,][1] - ss_scaled[2,][1])**2 +(ss_scaled[1,][2] - ss_scaled[2,][2])**2 )


ss_scaled_dist<-dist(ss_scaled)

ss_scaled_dist



result_hclust<-hclust(ss_scaled_dist)
result_hclust


plot(result_hclust)

cutree(result_hclust, k=2)
cutree(result_hclust, k=10)

group2<-cutree(result_hclust, k=2)
group3<-cutree(result_hclust, k=3)
group4<-cutree(result_hclust, k=4)
group5<-cutree(result_hclust, k=5)
par(mfrow=c(2,2))
plot(ss_scaled,pch=16,cex=2,col=group2,main="2개 그룹")
plot(ss_scaled,pch=16,cex=2,col=group3,main="3개 그룹")
plot(ss_scaled,pch=16,cex=2,col=group4,main="4개 그룹")
plot(ss_scaled,pch=16,cex=2,col=group5,main="5개 그룹")


install.packages("cluster")
library(cluster)
?pam
pam_result<-pam(simpleSquare,k=4,stand = T)

pam_result$medoids

plot(simpleSquare, pch=16,cex=2,col=pam_result$clustering,main='4개그룹')

opar <- par(no.readonly = TRUE)
?par
opar

points(pam_result$medoids,pch=3,cex=3)



install.packages("rlang")
library(rlang)
rlang

install.packages("factoextra")
library(factoextra)
factoextra::fb
fviz_nbclust(scale(simpleSquare),pam,method = "wss",k.max = 8)

fviz_nbclust(scale(simpleSquare),pam,method = "silhouette",k.max = 8)

apple_df<-read.csv("C:/ex/r/apple.csv")

summary(apple_df)

str(apple_df)

apple_df_without_model<-apple_df[ , c(2:5)]
summary(apple_df_without_model)


install.packages("clustMixType")
library(clustMixType)


?kproto

kproto_result<-kproto(apple_df_without_model,2)
kproto_result

str(kproto_result)

wss<-0



for (i in 1:10){
  
  kproto_result<-kproto(apple_df_without_model,i)
  wss[i]<-kproto_result$tot.withinss
}

plot(wss,type = 'b')



