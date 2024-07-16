rm(list=ls())

toyota<-read.csv(file.choose())
str(toyota)

sum(is.na(toyota))

600/1436

#훈련용 : 검증용 6:4

training<-sample(toyota$Id,600)


?setdiff


validation<-sample(setdiff(toyota$Id,training),400)
validation

intersect(training,validation)



str(toyota)


colnames(toyota[,c(1,2,8,11)])

toyota2<-toyota[ , -c(1,2,8,11)]

step(lm(Price ~ ., data=toyota, method = "both"))
"
 Age_08_04 + Mfg_Month + KM +  
  Quarterly_Tax + Weight + Mfr_Guarantee + BOVAG_Guarantee + 
  Guarantee_Period + Airbag_2 + Airco + Automatic_airco + Boardcomputer + 
  CD_Player + Powered_Windows + Power_Steering + Radio + Sport_Model + 
  Radio_cassette + Parking_Assistant + Tow_Bar
"


length(colnames(toyota2))



reg<-lm(Price ~ ., data=toyota2, subset = training,na.action = na.exclude)
reg

summary(reg)



pred_t<-predict(reg, na.action = na.pass)
pred_t

pred_v<-predict(reg, newdata = toyota[validation, -c(1,2,8,11)], na.action = na.pass)

par(mfrow=c(2,2))

hist(pred_t)
hist(pred_v)
boxplot(pred_t)
boxplot(pred_v)


library(forecast)

accuracy(pred_t, toyota2[training,]$Price)


accuracy(pred_v, toyota2[validation,]$Price)


