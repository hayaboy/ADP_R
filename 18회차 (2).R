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


