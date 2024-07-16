
data<-matrix(c(140,50,120,55,78,80,95,85,95,90), nrow = 5,ncol = 2, byrow = T) 

class(data)


?dist
dist(data)

sqrt((140-120)^2+(50-55)^2)
sqrt((140-78)^2+(50-80)^2)


dist(data, method = "manhattan")


abs(140 - 120) + abs(50-55)


#군집분석을 위한 패키지
install.packages("DAAG")
library(DAAG)
DAAG::wages1833

str(wages1833)
#age:나이, mnum: 남성 근로자 수, mwage:남성 근로자 평균 임금, fnum:여성 근로자 수, fwage:여성 근로자 평균 임금 



sum(is.na(wages1833))

#있을 경우, na.omit() 사용



#유클리드 거리 값 계산

distData<-dist(wages1833)

distData
View(distData)

?hclust()

#단일 연결법
hc_a<-hclust(distData, method = 'single')


plot(hc_a)

rect.hclust(hc_a, k = 3)






