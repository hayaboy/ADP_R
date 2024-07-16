




library(DAAG)

?DAAG::wages1833
data(wages1833)

str(wages1833)
View(wages1833)

attach(wages1833)
colnames(wages1833)
boxplot(age,mnum,mwage,fnum,fwage)
summary(wages1833)

install.packages("factoextra")


factoextra::fviz_nbclust()
?fviz_nbclust

fviz_nbclust(wages1833,kmeans, method = 'wss')

?kmeans()
#if centers is a number, how many random sets should be chosen?
#The kmeans() function has an nstart option that attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial configurations. This approach is often recommended
set.seed(200)

stats::kmeans()
kmeans(wages1833,3,nstart = 25)

km<-kmeans(wages1833,3,nstart = 25)

is(km)
factoextra::fviz_cluster()
?fviz_cluster
fviz_cluster(km, data = wages1833, ellipse.type = "convex",repel = TRUE)
#Character specifying frame type. Possible values are 'convex', 'confidence' or types supported by stat_ellipse including one of c("t", "norm", "euclid").
#프레임 유형을 지정하는 문자입니다. 가능한 값은 'convex', 'confidence'또는 c ( "t", "norm", "euclid") 중 하나를 포함하여 stat_ellipse에서 지원하는 유형입니다.
#a boolean, whether to use ggrepel to avoid overplotting text labels or not.
#boolean, ggrepel을 사용하여 텍스트 레이블을 오버 플로팅하지 않도록할지 여부입니다.


?pam
library(cluster)
pam_out<-pam(wages1833,3)

pam_out$medoids

pam_out$clustering


table(pam_out$clustering)

fviz_cluster(pam_out,data=wage_data,ellipse.type = "convex",repel = TRUE)


#SOM(Self Organizing Maps,  자기 조직화 지도)
#코호넨에 의해 제시, 코호넨 맵이라고도 알려져 있음
#SOM은 비지도 신경망으로 

setwd('C:/ex/day9')
m<-read.csv('연관규칙데이터.csv')

class(m)

?split()
m.list<-split(m$Item,m$ID)


m.list

?as
?transactions

m.trans<-as(m.list,"transactions")


class(m.trans)

inspect(m.trans)


?apriori

arules::apriori()
library(arules)

m_rule<-apriori(m.trans, parameter = list(support=0.2,confidence=0.20,minlen=3))

?arules::inspect

arules::inspect(m_rule)

m_rule2<-apriori(m.trans, parameter = list(support=0.2,confidence=0.20,minlen=2))

arules::inspect(m_rule2)


?arules::itemFrequencyPlot()

itemFrequencyPlot(m.trans,support=0.2,col="red")



plot(m_rule2,method = "graph",engine='interactive')

install.packages("arulesSequences")
library(arulesSequences)

data("zaki")
View(zaki)

inspect(zaki)
?zaki
summary(zaki)

?data.frame()
as(zaki, 'data.frame')


?cspade
#Mining frequent sequential patterns with the cSPADE algorithm. 
#This algorithm utilizes temporal joins along with efficient lattice search techniques and provides for timing constraints.

cspade(zaki, parameter = list(support=0.3,maxsize=5,maxlen=4))

seqr<-cspade(zaki, parameter = list(support=0.3,maxsize=5,maxlen=4))
as(seqr, 'data.frame')


install.packages("KoNLP")
install.packages("rJava")
install.packages("stringr")



install.packages("ROCR")
?ROCR
library(ROCR)

rm(list = ls())

data("iris")
attach(iris)

nrow(iris)

set.seed(1234)

#hold out
?sample
sample(c(1,2,3),2)

idx<-sample(2  ,nrow(iris), replace = TRUE, prob = c(0.7,0.3))


trainData<-iris[idx==1,]

testData<-iris[idx==2,]

nrow(trainData)
nrow(testData)

#cross-validation
set.seed(1234)
k=10
sample(nrow(iris))

iris2<-iris[sample(nrow(iris)), ]

cut(seq(1,nrow(iris2)),breaks = 10,labels = FALSE)

fold<-cut(seq(1,nrow(iris2)),breaks = 10,labels = FALSE)
fold
trainData=list(0)
testData=list(0)

?which
x<-c(2:10)
which(x==3)
#arr.ind = FALSE가 디폴트 이기 때문에 찾고자 하는 값의 위치(indexing)을 반환합니다.
for(i in 1:k){
  testIdx<-which(fold==i, arr.ind = TRUE)
  testData[[i]]=iris[testIdx, ]
  trainData[[i]]=iris[-testIdx, ]
}


trainData[[1]]


#ROC 그래프



datasets::infert
?infert
#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/infert.html
str(infert)
nrow(infert)


infert1<-infert[sample(nrow(infert)), ]
colnames(infert)
infert2<-infert1[ , c("age", "parity", "induced", "spontaneous", "case")]

trainData<-infert2[1:(nrow(infert2)*0.7), ]



testData<-infert2[(nrow(infert2)*0.7+1):nrow(infert2), ]
install.packages("neuralnet")
library(neuralnet)

colnames(trainData)
#ce : cross entropy)
net.infert<-neuralnet(case ~ age + parity + induced + spontaneous, data = trainData, hidden = 3,err.fct ="ce",linear.output = FALSE,likelihood = TRUE)

n_test<-subset(testData, select=-case)

nn_pred<-compute(net.infert, n_test)

testData$net_pred<-nn_pred$net.result

head(testData)

install.packages("Epi")
library(Epi)

testData$net_pred


ROC(form = case ~ net_pred , data=testData, plot = "ROC")



#의사결정나무 모형

install.packages("C50")
library(C50)
class(trainData$case)
trainData$case<-factor(trainData$case)
df.infert<-C5.0(case~age + parity + induced + spontaneous, data = trainData)
length(trainData$case)
predict(df.infert,testData, type="prob")
predict(df.infert,testData, type="prob")[,2]

testData$dt_pred<-predict(df.infert,testData, type="prob")[,2]


ROC(form = case ~ dt_pred , data=testData, plot = "ROC")




#이익도표와 향상도 곡선


library(ROCR)

?prediction
n_r<-ROCR::prediction(testData$net_pred, testData$case)
d_r<-ROCR::prediction(testData$dt_pred, testData$case)
d_r

?performance()

n_p<-performance(n_r,"tpr","fpr")
n_p
d_p<-performance(d_r,"tpr","fpr")
d_p
?par
plot(n_p, col='red')
par(new=TRUE)
plot(d_p, col='blue')
?abline
abline(a=0,b=1)


#신경망 모형의 향상도 곡선 
performance(n_r,"lift","rpp")
n_lift<-performance(n_r,"lift","rpp")
plot(n_lift,col="red")
abline(v=0.2,)

#신경망 모형의 경우 
#결과적으로  신경망 모형의 경우 상위 20%의 집단에 대하여 랜덤 모델과 비교할 때 약 2배의
#성과 향상을 보인다.






