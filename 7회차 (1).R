
rm(list = ls())

housing.df<-read.csv(file.choose(),header = TRUE)
str(housing.df)
sum(is.na(housing.df))



cor(housing.df)


plot(housing.df$MEDV ~ housing.df$LSTAT,xlab="MEDV",ylab = "LSTAT")


library(ggplot2)

ggplot(housing.df) + geom_point(aes(x=LSTAT,y=MEDV),colours="navy",alpha=0.7)


Amtrack.df<-read.csv(file.choose())

str(Amtrack.df)

?ts


ridership.ts<-ts(Amtrack.df$Ridership,start = c(1999,1),end=c(2004,3),frequency = 12)


summary(Amtrack.df)

class(ridership.ts)


ridership.ts



plot(ridership.ts, xlab="Year",ylab="Ridership",ylim=c(1300,2300))



