
str(WestRoxBury)

dplyr::filter()

WestRoxBury[ , c(-2)]

boxplot(WestRoxBury[ , c(-2)])

boxplot(WestRoxBury$FLOORS)
summary(WestRoxBury$FLOORS)
boxplot(WestRoxBury$ROOMS)

str(WestRoxBury)

WestRoxBury2<-WestRoxBury[ , c(-2,-14)]

str(WestRoxBury2)

West_Prin<-princomp(WestRoxBury2, cor = T)

summary(West_Prin)
plot(cor(WestRoxBury2))
plot(WestRoxBury2)


str(WestRoxBury2)

attach(WestRoxBury2)

cor(TOTAL.VALUE,GROSS.AREA)
cor(TOTAL.VALUE,LIVING.AREA)
cor(TOTAL.VALUE,ROOMS)
cor(TOTAL.VALUE,BEDROOMS)


plot(GROSS.AREA,TOTAL.VALUE)
plot(LIVING.AREA, TOTAL.VALUE)
plot(ROOMS,TOTAL.VALUE)
plot(BEDROOMS,TOTAL.VALUE)


WestRoxBury3<-WestRoxBury[ , c(-2)]

?lm

reg<-lm(TOTAL.VALUE ~ . , data=WestRoxBury3, subset = train.rows)


plot(reg)
summary(reg)

reg$fitted.values


tr.res<-data.frame(train.data$TOTAL.VALUE, reg$fitted.values, reg$residuals)

head(tr.res)

pred<-predict(reg, newdata = valid.data)


vl.res<-data.frame(valid.data$TOTAL.VALUE,pred, residuals=valid.data$TOTAL.VALUE-pred)

head(vl.res)

install.packages("forecast")

library(forecast)


forecast::accuracy()


accuracy(reg$fitted.values, train.data$TOTAL.VALUE)


accuracy(pred, valid.data$TOTAL.VALUE)



