
df<-read.csv(file.choose())


str(df)


df[ 1:70, ]

df1<-df[ 1:70, ]


is.na(df1)

sum(is.na(df1))


sum(is.na(df1$f1))

summary(df1$f1)

#전 표준편차 

?sd

sd(df1$f1, na.rm = T)
#17.98728


is.na(df1$f1)


df1$f1[is.na(df1$f1)]


df1$f1[is.na(df1$f1)] <- 68.00 

#후 표준편차 

sd(df1$f1)

#14.69077


17.98728 - 14.69077

#3.29651



#문제 3

#엑셀과 R에서 사분위수 다르게 나오는 이유
#http://visualdb.net/2018/09/06/quantile-or-summary-vs-fivenum/
#type 6번을 하면 엑셀과 일치

quantile(sample, type = 6)

IQR(sample,  type = 6)

#사분위수
sample<-c(1,2,2,4,4,6,7,8,9,10,12,12)
summary(sample)
#fivenum(sample)

?boxplot

boxplot(sample)


#백분위수 
quantile(sample, type = 6)




#이상치(outlier)


m<-mean(df$age)


std=sd(df$age)*1.5


std

min_out<- m-std

min_out

max_out<- m+std

max_out

df$age [df$age > max_out | df$age < min_out]

data1<-df$age [df$age > max_out | df$age < min_out]


sum(data1)


library(dplyr)

df %>% filter(age < mean(age)-1.5*sd(age) | mean(age)+1.5*sd(age) < age) %>% summarise(value=sum(age))



