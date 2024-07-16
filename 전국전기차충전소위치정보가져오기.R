#data.go.kr 전국전기차충전소표준데이터

rm(list=ls())
library(xlsx)
library(readr)
setwd("D:/EX/R")
guess_encoding("elec.xls")

#

df<-read.xlsx("elec.xls",1,header=T,stringAsFactor=F, encoding = 'UTF-8')
View(df)
str(df)

df_add<-as.data.frame(df[,14])
names(df_add)<-c("address")

df_add
df_add<-subset(df_add,subset = (address!=""))

str(df_add)

df_add$address<-as.character(df_add$address)

library(ggmap)
mut_df_add<-mutate_geocode(df_add,address,source='google')

