
getwd()
#setwd()

?getwd

class::
library(cluster)  

install.packages("ggplot2")


height<-c(166,168,170,172,178)
weight<-c(50,54,58,62,66)
name<-c("김","이","홍","강","양양")
sung<-c("남","남","여","여","남")

data.frame(name,sung,height,weight)

df1<-data.frame(name,sung,height,weight)

table(df1$sung)

barplot(table(df1$sung))

mean(height)
var(height)
sd(height)

plot(df1$height,df1$weight,xlab="키",ylab="몸무게",main="키와몸무게")


cor(df1$height,df1$weight)

lm(df1$weight ~ df1$height)


str(df1)

str()

library(ggplot2)

summary(height)

plot() 

ggplot()



flo<-c(3.5,4.7)

is(flo)

flo2<-as.integer(flo)
is(flo2)




df_list<-as.list(df1)
View(df_list)
length(df_list)

df_list["name"]




#벡터( :   seq  rep  )


3:6

seq(1,10,2)

rep(c('a','b'),2)

rep(c('a','b'),2)


x1<-c(1,2,3,4)
x2<-c(5,6,7,8)


cbind(x1,x2)
rbind(x1,x2)




df1

str(df1)

x<-90






?ifelse



for( i in 1:5){
  print(i)
}


duhagi<-function(a,b){
  
  return (a+b)
}


is(duhagi)

duhagi(3,4)


search()

cars

datasets::