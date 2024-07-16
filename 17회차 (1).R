rm(list=ls())

toyota.corolla.df<-read.csv(file.choose())

training<-sample(toyota.corolla.df$Id, 600)


validation<-sample(setdiff(toyota.corolla.df$Id, training), 400)




toyota.corolla.df<-toyota.corolla.df[!is.na(toyota.corolla.df[validation, ]$Price), ] 


training<-sample(toyota.corolla.df$Id, 600)

validation<-sample(toyota.corolla.df$Id, 400)


reg<-lm(Price ~ .   , data = toyota.corolla.df[ , -c(1,2,8,11)], subset=training)



pred_v<-predict(reg, newdata = toyota.corolla.df[validation , -c(1,2,8,11)])

pred_v

install.packages("gains")
library(gains)

?gains


gain<-gains(toyota.corolla.df[validation, ]$Price[!is.na(pred_v)], pred_v[!is.na(pred_v)])


gain


options(scipen = 999)



price<-toyota.corolla.df[validation, ]$Price[!is.na(toyota.corolla.df[validation,]$Price)]


plot(c(0,gain$cume.pct.of.total*sum(price)) -c(0,gain$cume.obs), xlab = "# cases", ylab = "Cumulative Price", main="Lift Chart", type="l")


lines(c(0,sum(price)) - c(0, dim(toyota.corolla.df[validation,])[1]), col="gray", lty=2)



barplot(gain$mean.resp/mean(price), names.arg=gain$depth, xlab="Percentile", ylab="Mean Response", main="Decile-wise list chart" )
