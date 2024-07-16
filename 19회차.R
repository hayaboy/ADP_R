rm(list=ls())


mower.df<-read.csv(file.choose())
set.seed(111)
str(mower.df)

row.names(mower.df)

0.6*dim(mower.df)[1]

train.index<-sample(row.names(mower.df),0.6*dim(mower.df)[1] )
train.index

valid.index<-setdiff(row.names(mower.df),train.index)
valid.index

train.df<-mower.df[train.index,]
valid.df<-mower.df[valid.index,]

new.df<-data.frame(Income=60,Lot_Size=20)

colnames(mower.df)

table(train.df$Ownership)

plot(Lot_Size ~ Income, data=train.df, pch=ifelse(train.df$Ownership=='Owner',1,3))

text(train.df$Income,train.df$Lot_Size, rownames(train.df),pos=4)
text(60,20,"X")
legend("topright", c("owner","non-owner","newhousehold"),pch=c(1,3,4))


#정규화

train.norm.df<-train.df
valid.norm.df<-valid.df
mower.norm.df<-mower.df


library(caret)

caret::preProcess()

?preProcess

norm.values<-preProcess(train.df[ , 1:2], method = c("center", "scale"))

train.norm.df[ , 1:2]<-predict(norm.values, train.df[ , 1:2])


train.norm.df


valid.norm.df[ , 1:2]<-predict(norm.values, valid.df[ , 1:2])

mower.norm.df[ , 1:2]<-predict(norm.values, mower.df[ , 1:2])

norm.values

new.norm.df<-predict(norm.values, new.df)

new.norm.df


mower.norm.df


install.packages("FNN")
library(FNN)



FNN::knn()

?knn

nn<-knn(train=train.norm.df[ , 1:2], test = new.norm.df, cl=train.norm.df[,3],k=3)


nn

#데이터가 복잡하고 불규칙한 구조를 가질수록 k의 최적값은 더 작아지게 된다.
#일반적으로 k의 값은 1~20의 범위 내에서 결정된다.
#또한, 각 클래스별로 같은 수가 나오는 경우를 피하기 위해서 홀수 사용



#다양한 k에 대한 k-최근접 이웃의 검증 정확도(또는 정분류율)

rep(0,14)
accuracy.df<-data.frame(k=seq(1,14,1), accuracy=rep(0,14))

accuracy.df

caret::confusionMatrix()

library(caret)


knn.pred<-knn(train.norm.df[,1:2], valid.norm.df[,1:2],cl=train.norm.df[,3],k=1)

knn.pred

confusionMatrix(knn.pred, as.factor(valid.norm.df[,3]))

confusionMatrix(knn.pred, as.factor(valid.norm.df[,3]))$overall[1]

for(i in 1:14){
  knn.pred<-knn(train.norm.df[,1:2], valid.norm.df[,1:2],cl=train.norm.df[,3],k=i)
  accuracy.df[i,2]<-confusionMatrix(knn.pred, as.factor(valid.norm.df[,3]))$overall[1]
}

accuracy.df

new.norm.df

knn.pred.new<-knn(mower.norm.df[,1:2], new.norm.df,cl=mower.norm.df[,3],k=5)

knn.pred.new
