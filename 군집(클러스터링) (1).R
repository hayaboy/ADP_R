
rm(list=ls())
apple_df<-read.csv("C:/ex/r/apple.csv")

summary(apple_df)

str(apple_df)

apple_df_without_model<-apple_df[ , c(2:5)]
summary(apple_df_without_model)


install.packages("clustMixType")
library(clustMixType)


?kproto

kproto_result<-kproto(apple_df_without_model,2)

kproto_result$cluster
kproto_result$tot.withinss

str(kproto_result)

wss<-0



for (i in 1:10){
  
  kproto_result<-kproto(apple_df_without_model,i)
  wss[i]<-kproto_result$tot.withinss
}

plot(wss,type = 'b')







cluster_result<-kproto(apple_df_without_model,4)
cluster_result$cluster


table(cluster_result$cluster)


apple_df[,"model"]
table(cluster_result$cluster, apple_df[,'model'])



clprofiles(cluster_result,apple_df_without_model)














