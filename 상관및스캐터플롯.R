
library(ggplot2)

ggplot2::diamonds

w<-ggplot(diamonds, aes(clarity, fill=cut))

w + geom_bar()





w + geom_bar(aes(order=desc(cut)))




datasets::ChickWeight


attach(ChickWeight)

chickwts<-ChickWeight

str(chickwts)

summary(aov(weight ~ feed, chickwts))


library(data.table)

library(dplyr)
?dplyr
plyr::ddply()



y=c(3,4,5,NA)
3*y  







summary(lm(dist ~ speed, data=cars))





M<-matrix(c(1,2,3,4,5,6), nrow = 2)

as.vector(M)



















cor(iris['Petal.Length'], iris['Petal.Width'])

colnames(iris)

iris[ , 3]

iris[ , 4]


cor(iris[ , 3], iris[ , 4])
plot(iris[ , 3], iris[ , 4])


boxplot(iris[,1],iris[,2],iris[,3],iris[,4])

hist(iris[,1])

?par()

par(mfrow = )

par(mfrow = c(4,1))
hist(iris[,1])
hist(iris[,2])
hist(iris[,3])
hist(iris[,4])


par(mfrow = c(1,1))
hist(iris[,1])


?pie

sung<-c('남','여','남','여','남')


df1<-data.frame(sung)

table(df1$sung)


pie(table(df1$sung))


pie(table(iris$Species))


?par































