

par(mfrow=c(1,1))


plot(housing.df$MEDV ~ housing.df$CRIM, xlab="CRIM",ylab="MEDV")
plot(housing.df$MEDV ~ housing.df$CRIM, xlab="CRIM",ylab="MEDV",log='xy' )


boxplot(housing.df$MEDV, housing.df$CRIM)
boxplot(housing.df$CRIM ~ housing.df$CAT..MEDV,xlab="CRIM",ylab="MEDV",log='y')

Amtrack.df

plot(ridership.ts)


?tslm

Amtrack.df<-read.csv(file.choose())

ridership.ts<-ts(Amtrack.df$Ridership,start = c(1991,1), end = c(2004,3),freq=12)

#종속 변수가 독립 변수의 2차 이상에 비례하는 경우 I()
#I : 객체의 해석(interpretation)과 변환(conversion)을 방지한다.
#data.frame( ) 또는 포뮬러에 객체를 지정할 때 변환을 방지한다.
ridership.lm<-tslm(ridership.ts ~ trend + I(trend^2))



par(mfrow=c(2,2))

plot(ridership.ts,xlab="Year",ylab="Ridership",ylim=c(1300,2300))
lines(ridership.lm$fitted.values,lwd=2)


ridership.2yrs<-window(ridership.ts,start = c(1991,1), end = c(2004,3))
plot(ridership.2yrs, xlab="Year",ylab="Ridership",ylim=c(1300,2300))

?cycle
cycle(ridership.ts)
monthly.ridership.ts<-tapply(ridership.ts, cycle(ridership.ts), mean)

plot(monthly.ridership.ts, xlab="Month",ylab="Average Ridership", ylim=c(1300,2300), type="l",xaxt='n')

axis(1, at=c(1:12), labels=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))

annual.ridership.ts<-aggregate(ridership.ts,FUN=mean)

plot(annual.ridership.ts,xlab="Month",ylab="Average Ridership",ylim=c(1300,2300))


par(mfrow=c(1,1))

#필터링
utilities.df<-read.csv(file.choose())
plot(utilities.df$Fuel_Cost ~ utilities.df$Sales, xlab="Sales",ylab="Fuel Cost", xlim=c(2000,20000))

text(x=utilities.df$Sales,y=utilities.df$Fuel_Cost, labels = utilities.df$Company, pos=4, cex=0.8, srt=20,offset = 0.2)



universal.df<-read.csv(file.choose())
library(scales)


?jitter()

plot(jitter(universal.df$CCAvg,1) ~ jitter(universal.df$Income,1), 
     col=alpha(ifelse(universal.df$Securities.Account==0,"gray","black"),0.4), pch=20,log='xy',ylim=c(0.1,10),
     xlab="Income",ylab ="CCAvg")

par(mfcol=c(2,1))

library(MASS)
parcoord(housing.df[housing.df$CAT..MEDV==0, -14], main="CAT.MEDV=0")
parcoord(housing.df[housing.df$CAT..MEDV==1, -14], main="CAT.MEDV=1")







