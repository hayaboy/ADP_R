#setwd()함수는 작업 디렉토리 설정

setwd("h:\\Adsp_R")

x<-read.csv("aa.csv")
x

y<-read.csv("bb.csv")
y

write.csv(y, "cc.csv", row.names=FALSE)
y<-read.csv("cc.csv")
y

txt<-read.table("houses.txt", header=T)
txt


