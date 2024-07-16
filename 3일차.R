x<-50


ifelse(x>=100 , "참", "거짓")

getwd()

setwd('C:/ex/day3/')

getwd()

df_test<-read.csv('test.csv', encoding = 'UTF-8')

str(df_test)

df_test2<-read.csv('test2.csv')

View(df_test2)

install.packages("readxl")

library(readxl)

getwd()

df_xl<-read_excel('test2.xlsx')
str(df_xl)

df_xl$name


datasets::Titanic

str(Titanic)
View(Titanic)

head(Titanic)

mosaicplot(Titanic)

tita<-as.data.frame(Titanic)
str(tita)


table(tita$Sex)

pie(table(tita$Sex))

datasets::iris

str(iris)

cor(iris[1:4])

pairs(iris)


ggplot2::diamonds

summary(diamonds$cut)

barplot(table(diamonds$cut))


sort(table(diamonds$cut), decreasing = TRUE)

prop.table(table(diamonds$cut)

round(prop.table(table(diamonds$cut), 2)

      

      
prt<-prop.table(table(diamonds$cut))

round(prt,2)
round(prt,2)*100      


install.packages("prettyR")

library(prettyR)

prettyR::freq()

?freq()

fr<-freq(diamonds$cut, display.na = FALSE)

View(fr)

is(fr)

barplot(table(diamonds$cut),col="blue", ylim=c(0,26000))

colnames(diamonds)

ggplot(diamonds, aes(x=cut)) + geom_bar()



