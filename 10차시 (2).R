
ranicafe<-read.csv(file.choose(), header = T, na.strings = "na", stringsAsFactors = FALSE )

str(ranicafe)

any(is.na.data.frame(ranicafe))


str(ranicafe)  #48

ranicafe<-na.omit(ranicafe)

str(ranicafe)  #47

any(is.na.data.frame(ranicafe))

install.packages("ggplot2")

library("ggplot2")


?ggplot2::ggplot()

str(ranicafe)


?plot

plot(ranicafe$Coffees, type = "h")



ggplot(ranicafe, aes(Coffees)) + geom_bar(fill="gray") + ggtitle("라니의 카페 커피 판매량")  + theme(plot.title = element_text(size = 20, face = "bold")) + xlim(0,50)+xlab("판매량") + ylab("횟수") + scale_y_continuous(breaks = 0:10)


#최소값과 최대값 
ranicafe$Coffees



sort(ranicafe$Coffees)


sort(ranicafe$Coffees)[1]

sort(ranicafe$Coffees, decreasing = T)

sort(ranicafe$Coffees, decreasing = T)[1]


min(ranicafe$Coffees)
max(ranicafe$Coffees)


#평균


rc<-ranicafe$Coffees

weight<-(1/length(rc))
sum(rc*weight)

mean(rc)


mean(ranicafe$Coffees)


#자료 중에 결측값(NA)이 있을 경우



rc<-c(rc,NA)
rc


mean(rc)


mean(rc,na.rm = T)

length(rc)

rc<-ranicafe$Coffees
length(rc)

which(rc==21 | rc==22)


rc[16]
rc[17]
rc[33]



rc[rc==max(rc)]<-480
mean(rc)


#중앙값

rc<-ranicafe$Coffees


(median.idx<-(length(rc)+1)/2)

(rc.srt<-sort((rc)))

rc.srt[median.idx]


median(rc)

rc<-ranicafe$Coffees
rc[rc==max(rc)]<-480
(m2<-median(rc))

#산점도 : 두 변수 간의 관계를 나타내는 산점도


datasets::cars


plot(cars$speed, cars$dist, main="속도와 제동거리",xlab="속도(mph)", ylab="제동거리(ft)", pch=1,col="red")


datasets::Nile

is(Nile)


plot(Nile, main="Nile강의 연도별 유량 변화", xlab="연도",ylab="유량")

plot(Nile, type="p", main="Nile강의 연도별 유량 변화", xlab="연도",ylab="유량")



# 막대 그래프는 이산형 혹은 질적 자료의 개수
# 히스토그램은 연속형 자료의 개수 혹은 비율을 나타내는 데 사용



load("C:/itgo/탐색_분석/8차시/data.rda")

data$V5<-as.numeric(data$V5)



table(data$V5)

str(data$V5)

tableV5<-table(data$V5)


barplot(tableV5, main="출생아(남자)별 빈도", xlab="출생아수", ylab="빈도")
          

data$V2<-as.numeric(data$V2)

hist(data$V2, main = "연령별 분포", xlab="연령", ylab="빈도")

hist(data$V2, breaks = c(seq(0,90,10)), right = F, main = "연령별 분포", xlab="연령", ylab="빈도")
#breaks로 만든 구간을 [0, 10), [10, 20), … [80, 90)와 같이 되도록 합니다.

hist(data$V2, probability=T, right = F, main = "연령별 분포", xlab="연령", ylab="빈도")

table.V4<-table(data$V4)
pie(table.V4, main="학력 수준별 비중", cex=0.8)
