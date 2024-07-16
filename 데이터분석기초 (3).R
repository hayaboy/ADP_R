4*6
print("hi")
install.packages("ggplot2")
library(ggplot2)
ggplot2::geom_line()
?print
??print
?c

vec<-c(1,2,3,4)

is(vec)

?matrix
matrix(vec, nrow=2)


m<-matrix(vec, nrow=2)

str(m)

?array

length(c(1,2,3))

#2차원
matrix(c(1,2,3,4), nrow = 2)

matrix(c(1,2,3,4), ncol = 2)


#벡터
c(1:4)

1:4

rep(1:4,3)

 
1:12


#2차원 이상
array(1:12, dim = c(3,4))

rep(c(1,2,3,4))


?rep
    
rep(c(1,2,3,4),1)
    
array(rep(c(1,2,3,4),3), dim=c(2,2,3))

?factor

factor(c('a','a','b'))


1:12

c(1:12)

array(rep(1:4,3), dim = c(3,4))


array(rep(1:4,3), dim = c(3,2,2))


array(c(1:10), dim = c(3,2,2))


install.packages("readxl")

library(readxl)

?readxl

df<-read_excel("C:/Ex/r/담당자별_판매량_Andy사원.xlsx")



str(df)

stat

install.packages("prob")


prob::urnsamples()

prob::rolldie()


library(prob)

rolldie(1)
rolldie(2)

tosscoin(1)
tosscoin(2)

?runif()

?sample

sample(1:10,3)

sample(1:10,5)

sample(1:100,5)

sample(1:45,6)
?read_excel

read_excel("C:/Ex/r/담당자별_판매량_Andy사원2.xlsx",sheet='대구')



str(df)

df$제품명

df[1,]

summary(df)
is(df$'1분기')


df_mean<-mean(df$'1분기')

2**3

length(df$'1분기')

sum(1,2,3)

sum((df$'1분기'-df_mean)**2)/(length(df$'1분기')-1)


var(df$'1분기')


c(1, 2, 3, c(4, 5, 6))

?seq

seq(from=1,to=10,by=1)

seq(from=10,to=1,by=-1)



?c



x <- 1:4

letters[1:4]


names(x)<-letters[1:4]

x

list(A = 1, c = "C")

ll<-list(A = 1, c = "C")
ll$A
ll$c
c(ll, d = 1:3)

c(B = 1)


list(A = c(B = 1))

c(list(A = c(B = 1)), recursive = TRUE)


c(list(A = c(B = 1)), recursive = TRUE, use.names=FALSE)

seq(0, 1, length.out=1000)


rep(c(1, 2, 3), times=2)
rep(c(1, 2, 3), each=2)


x <- c(5, 4, 3, 2, 1)
x
x[1:3]


x[c(1,2,5)]

x[-c(1,2,5)]


x[3:length(x)]

NA
?NA
?NULL
ex <- c(1, 3, 7, NA, 12)
ex

ex<10

ex[ex<10]


ex[ex%%2==0]



ex[ex%%2==0 & !is.na(ex)]


library(readxl)

ls()

?rm

rm(list = ls())
getwd()





df<-read_excel('C:/Ex/py/데이터수집/sanga10.xlsx')

head(df)
str(df)

head(df$지번코드)
df$상호명
summary(df)

install.packages("dplyr")

library(dplyr)

df$상권업종대분류코드

df$지점명

df2<-df %>% filter(시군구명=='강남구' & 상권업종대분류코드=='Q') %>% select(지점명)

na.exclude(df2)

