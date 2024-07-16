
rm(list = ls())

#보스턴 집값

housing.df<-read.csv(file.choose(),header = TRUE)
str(housing.df)
sum(is.na(housing.df))



cor(housing.df)


plot(housing.df$MEDV ~ housing.df$LSTAT,xlab="MEDV",ylab = "LSTAT")


library(ggplot2)

ggplot(housing.df) + geom_point(aes(x=LSTAT,y=MEDV),colours="navy",alpha=0.7)





?aggregate

data.for.plot<-aggregate(housing.df$MEDV, by=list(housing.df$CHAS), FUN=mean)



data.for.plot


names(data.for.plot)<-c("CHAS","MeanMEDV")

data.for.plot



barplot(data.for.plot$MeanMEDV, names.arg = data.for.plot$CHAS, xlab = "CHAS",ylab = "Avg.MEDV")


ggplot(data.for.plot) + geom_bar(aes(x=CHAS,y=MeanMEDV),stat = "identity")



data.for.plot2<-aggregate(housing.df$CAT..MEDV, by=list(housing.df$CHAS), FUN=mean)


data.for.plot2

names(data.for.plot2)<-c("CHAS","MeanCATVMEDV")

barplot(data.for.plot2$MeanCATVMEDV*100, names.arg = data.for.plot2$CHAS, xlab = "CHAS",ylab = "% of CAT.MEDV")




#시계열 
Amtrack.df<-read.csv(file.choose())

str(Amtrack.df)

?ts


ridership.ts<-ts(Amtrack.df$Ridership,start = c(1999,1),end=c(2004,3),frequency = 12)


summary(Amtrack.df)

class(ridership.ts)


ridership.ts



plot(ridership.ts, xlab="Year",ylab="Ridership",ylim=c(1300,2300))

#분포도 : 박스플롯과 히스토그램



hist(housing.df$MEDV,xlab="MEDV")

ggplot(housing.df) + geom_histogram(aes(x=MEDV),binwidth = 5)




boxplot(housing.df$MEDV ~ housing.df$CHAS, xlab="CHAS",ylab="MEDV")

ggplot(housing.df) + geom_boxplot(aes(x=as.factor(CHAS),y=MEDV)) + xlab("CHAS")


par(mfcol=c(1,4))
boxplot(housing.df$NOX ~ housing.df$CAT..MEDV,xlab = "CAT.MEDV",ylab = "NOX")
boxplot(housing.df$LSTAT ~ housing.df$CAT..MEDV,xlab = "CAT.MEDV",ylab = "LSTAT")
boxplot(housing.df$PTRATIO ~ housing.df$CAT..MEDV,xlab = "CAT.MEDV",ylab = "PTRATIO")
boxplot(housing.df$INDUS ~ housing.df$CAT..MEDV,xlab = "CAT.MEDV",ylab = "INDUS")



