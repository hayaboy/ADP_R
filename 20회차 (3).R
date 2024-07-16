rm(list=ls())
delays.df<-read.csv(file.choose())

str(delays.df)

#변수 설명
#DAY_WEEK     1=월요일, 2=화요일, ... ,7=일요일

'
Data labels:
CRS_DEP_TIME scheduled departure time
CARRIER The airline
DEP_TIME Actual departure time
DEST Destination airport in NY: Kennedy (JFK), LaGuardia (LGA), Newark (EWR)
DISTANCE Flight distance in miles
FL_DATE Flight date
FL_NUM Flight number
ORIGIN Departure airport in Washingon DC: National (DCA), Baltimore-Washington (BWI),
Dulles (IAD)
Weather Whether the weather was inclement (1) or not (0)
DAY_WEEK Day of week. 1=Mon, 2=Tues...
DAY_OF_MONTH
TAIL_NUM This number is airplane specific
'




library(e1071)
delays.df$DAY_WEEK<-factor(delays.df$DAY_WEEK)
delays.df$DEP_TIME<-factor(delays.df$DEP_TIME)
delays.df$CRS_DEP_TIME<-factor(round(delays.df$CRS_DEP_TIME/100))



selected.var<-c(10,1,8,4,2,13)


train.index<-sample(c(1:dim(delays.df)[1]), dim(delays.df)[1]*0.6)
train.df<-delays.df[train.index, selected.var]
valid.df<-delays.df[-train.index, selected.var]

colnames(train.df)

delays.nb<-naiveBayes(Flight.Status ~ ., data=train.df)


delays.nb





str(delays.df)

prop.table(table(train.df$Flight.Status,train.df$DEST), margin = 1)


pred.prob<-predict(delays.nb, newdata = valid.df,type = "raw")

pred.prob


pred.class<-predict(delays.nb, newdata = valid.df)
pred.class


df<-data.frame(actual=valid.df$Flight.Status, predicted=pred.class,pred.prob)
df



df[valid.df$CARRIER=="DL" & valid.df$DAY_WEEK==7 & valid.df$CRS_DEP_TIME==10 & valid.df$DEST=="LGA" & valid.df$ORIGIN=="DCA", ]


library(caret)


pred.class
train.df$Flight.Status

#정오행렬

pred.class<-predict(delays.nb, newdata = train.df)


table(pred.class)
table(train.df$Flight.Status)

71+ 1249

248 +   1072 


class(pred.class)
class(train.df$Flight.Status)

train.df$Flight.Status<-as.factor(train.df$Flight.Status)


caret::confusionMatrix(pred.class, train.df$Flight.Status)


#향상차트


library(gains)



gain<-gains(ifelse(valid.df$Flight.Status=="delayed", 1,0), pred.prob[,1], groups = 100)

plot(c(0,gain$cume.pct.of.total*sum(valid.df$Flight.Status=="delayed")) ~ c(0, gain$cume.obs), xlab="# cases", ylab="Cumulative", main="", type="l")
lines(c(0, sum(valid.df$Flight.Status=="delayed")) ~ c(0, dim(valid.df)[1]), lty=2)




