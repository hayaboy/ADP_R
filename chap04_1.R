rm(list = ls())

AUS<-read.csv(file.choose(), header = TRUE, stringsAsFactors = TRUE)

str(AUS)

?summary
summary(AUS)

colnames(AUS)

AUS_1<-AUS[ , c("Date",          "Location"   ,   "MinTemp"     ,  "MaxTemp"    ,   "Rainfall",
                "WindGustDir" ,  "WindGustSpeed" ,  "WindDir3pm"  ,  "WindSpeed9am" ,
                "WindSpeed3pm" , "Humidity9am"   ,"Humidity3pm" ,   
                    "Temp9am"   ,    "Temp3pm"    ,   "RainToday", "RainTomorrow" )]

summary(AUS_1)

AUS_1$Date<-as.Date(AUS_1$Date)

is(AUS_1$Date)

str(AUS_1) #142193 

AUS_2<-na.omit(AUS_1)

str(AUS_2) #128576 


install.packages("caret")
library(caret)


AUS_2

train_idx<-createDataPartition(AUS_2$RainTomorrow, p=0.7)

is(train_idx)


is(train_idx[[1]])

train_idx_final<-as.vector(train_idx[[1]])


train_data<-AUS_2[train_idx_final,]

test_data<-AUS_2[-train_idx_final,]

nrow(AUS_2)

nrow(train_data)+nrow(test_data)

#분류모델 
#앙상블(배깅,부스팅, 랜덤포레스트)
library(adabag)
?adabag::bagging()
adabag::boosting()

#1 배깅
bg.model<-bagging(RainTomorrow ~ . , data=train_data, mfinal = 15, control=rpart.control(maxdepth=5, minsplit=15))

bg.model

summary(bg.model)

str(test_data)

test_data[,-16]

pred<-predict(bg.model, test_data[,-16], type="prob")

pred

str(pred)

pred$class

pred_1<-data.frame(pred$prob,RainbowTommorow=pred$class)

write.csv(pred_1,"C:/ex/r/bagging_pre.csv")



#2 부스팅

?boosting

bs.model<-boosting(RainTomorrow ~ . , data=train_data,boos = FALSE, mfinal = 15, control=rpart.control(maxdepth=5, minsplit=15))

pred_1_bs<-predict(bs.model, test_data[,-16], type="prob")

data.frame(pred_1_bs$prob, pred_1_bs$class)



?randomForest

install.packages("randomForest")
library(randomForest)

?randomForest


rf.model<-randomForest(RainTomorrow ~ . , data=train_data)

rf.model





install.packages("ROCR")
library(ROCR)


str(pred$class)


table(pred$class)

install.packages("e1071")
library(e1071)
confusionMatrix(as.factor(pred$class), reference = test_data[,16],positive = "No")



?prediction()

pred.bg.roc<-prediction(as.numeric(as.factor(pred$class)), as.numeric(test_data[,16]))

?performance
performance(pred.bg.roc,"tpr","fpr")


plot(performance(pred.bg.roc,"tpr","fpr"))

abline(a=0,b=1,lty=2,col="black")



performance(pred.bg.roc,"auc")@y.values











