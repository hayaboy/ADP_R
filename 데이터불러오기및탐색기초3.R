


read.csv('C:/Ex/data/auto-mpg.csv',header = TRUE)
df<-read.csv('C:/Ex/data/auto-mpg.csv',header = TRUE)

str(df)
summary(df)
colnames(df)
?read_xlsx
read_excel(file.choose())


length(df$mpg)

cor(df$mpg,df$weight)

plot(df$mpg,df$weight)




?date


?ts


?table

table(df$car.name)






hist(table(df$car.name))





getwd()


read.table("test.txt",header = TRUE,sep="\t", encoding = "UTF-8")

df<-read.table("test.txt",header = TRUE,sep="\t", encoding = "UTF-8")

df_csv<-read.csv("test_utf.csv",header = TRUE, sep=',', encoding = "UTF-8")

View(df)
View(df_csv)

library(readxl)


df_xl<-readxl::read_excel('iris_xl.xlsx')

colnames(df_xl)



h<-c(166,168,170,172,174)

boxplot(h)


sung<-c('남','남','남','여','여')

table(sung)

?pie


is(table(sung))

sung


library(dplyr)


dplyr::count()


?count()



pie(c(3,2))


pie(table(sung))




?data

library(ggplot2)


ggplot2::diamonds


diamonds$cut



barplot(table(sung))


barplot(table(diamonds$cut))


round(prop.table(table(diamonds$cut))*100,2)



install.packages("prettyR")
library(prettyR)

prettyR::freq()
?freq()

table(diamonds$cut)

freq(diamonds$cut,display.na = FALSE)



barplot(table(diamonds$cut),ylim=c(1,26000))


?ggplot()



ggplot(diamonds,aes(x=cut)) + geom_bar()



pie(table(diamonds$cut),radius = 1)


hist(diamonds$price)

hist(diamonds$price,breaks = seq(0,20000,5000))


hist(diamonds$price,breaks =10)

?boxplot()

boxplot(diamonds$price)

boxplot(diamonds$price, range = 1)
boxplot(diamonds$price, range = 2)
boxplot(diamonds$price, range = 3)

IQR(diamonds$price)


(boxstats <- boxplot(iris$Sepal.Width))





par(mfrow=c(1,1))
par(mfrow=c(2,2))

load(datasets::iris)
library(datasets)

data(datasets::iris)
iris
colnames(iris)

boxplot(Sepal.Length ~ Species, data=iris)
boxplot(Sepal.Width ~ Species, data=iris)
boxplot(Petal.Length ~ Species, data=iris)
boxplot(Petal.Width ~ Species, data=iris)





par(mfrow=c(1,1))


boxplot(Sepal.Length ~ Species, data=iris)




x1<-c(10,1,5,2,4,6,1,3,8)
x2<-c(82,94,88,90,87,84,91,87,83)


cor(x1,x2)


plot(x1,x2)
lm(x2 ~ x1)

plot(lm(x2 ~ x1))

rm(list =ls())



x1<-c(10,1,5,2,4,6,1,3,8)
x2<-c(82,94,88,90,87,84,91,87,83)

abline(lm(x2 ~ x1),col='red',lwd=2,lty=1)




?par

par(mfrow=c(1,1))

month<-1:12
late<-c(4,5,7,10,12,13,6,5,4,2,8,9)
plot(month,late,type = 'l')


Sys.Date()
?as.Date()


?format()



format(Sys.Date(),'%m')


?pairs()


pairs(iris[1:4],pch=21,bg=c('red','green','blue'))



plot(iris$Sepal.Length,iris$Petal.Length)

datasets::Titanic

str(Titanic)

?mosaicplot
mosaicplot(Titanic)


pairs(iris)


str(ggplot2::diamonds)

library(ggplot2)



table(diamonds$cut)
?plot
barplot(table(diamonds$cut))


round(prop.table(table(diamonds$cut)),2)*100

?pie

pie(table(diamonds$cut))


#빈도와 백분율을 같이 사용하고자 할 경우 prettyR

library(prettyR)

prettyR::freq()

?freq
freq(diamonds$cut, display.na=FALSE)

?barplot
barplot(table(diamonds$cut),col='red', main='다이아', xlab='상태 ',ylab='수치'
        )



ggplot(diamonds, aes(x=cut)) + geom_bar()

?ggplot

ggplot(diamonds, aes(x=cut)) + geom_boxplot()

ggplot(diamonds, aes(x=cut)) + geom_bar() +  theme_dark()



hist(diamonds$price, breaks = 7)


hist(diamonds$price, breaks = seq(0,20000,5000))

?boxplot
boxplot(diamonds$price, range =3 )


str(diamonds)

?boxplot

boxplot(diamonds$price  ~ diamonds$cut)

colnames(iris)

boxplot( Sepal.Length ~ Species, iris, main="Sepal.Length")

boxplot( Sepal.Width ~ Species, iris, main="Sepal.Width")

boxplot( Petal.Length ~ Species, iris, main="Petal.Length")

boxplot( Petal.Width ~ Species, iris, main="Petal.Width")


par(mfrow=c(2,2))

boxplot( Sepal.Length ~ Species, iris, main="Sepal.Length")

boxplot( Sepal.Width ~ Species, iris, main="Sepal.Width")

boxplot( Petal.Length ~ Species, iris, main="Petal.Length")

boxplot( Petal.Width ~ Species, iris, main="Petal.Width")

par(mfrow=c(1,1))
boxplot( Petal.Width ~ Species, iris, main="Petal.Width")



late<-c(10,5,3,1,0)
score<-c(50,60,70,80,90)

cor(late,score)

?plot
?plot
plot(late,  lwd= 5, type = "line")

seq(1,10)

seq(1,10, 2)

rep(4,5)

data.frame(sung=c("M","F",NA,"M","F"),score=c(4,5,3,4,NA))

sung_score<-data.frame(sung=c("M","F",NA,"M","F"),score=c(4,5,3,4,NA))

str(sung_score)

sum(sung_score$score,na.rm = TRUE)

is.na(sung_score$score)


library(dplyr)

sung_score %>% filter(!is.na(sung))


colnames(sung_score)

sung_score %>% filter(!is.na(score))

na.omit(sung_score)

mean_sung_score<-mean(sung_score$score, na.rm = T)

sung_score$score<-ifelse(is.na(sung_score$score),mean_sung_score , sung_score$score)

sung_score


month<-1:12
price<-c(3,4,5,6,5,3,9,2,3,5,6,3)


?plot
plot(month,price,type="l")





outlier_ex<-c(1,500,550,400,590,600)


mean(outlier_ex)

median(outlier_ex)


boxplot(outlier_ex)


outlier_ex2<-ifelse(outlier_ex>=500 & outlier_ex<=600, outlier_ex, NA)


boxplot(outlier_ex2,na.rm=TRUE)





