install.packages("arules")


rm(list=ls())


m<-read.csv(file.choose())

class(m)
head(m)


?split
m.list<-split(m$Item, m$ID)

m.list

?as

m.trans<-as(m.list, "transactions")



class(m.trans)





m.trans

inspect(m.trans)


m_rule<-apriori(m.trans,parameter = list(support=0.2,confidence=0.20,minlen=3))

#지지도 20%, 신뢰도 20% 이상인 규칙을 m_rule에 저장

#연관 분석 절차
#최소 지지도보다 큰 집합만을 대상으로 높은 지지도를 갖는 품목 집합을 찾는 것이다.
#Apriori  분석 절차
#1)최소 지지도를 설정
#2)개별 품목 중에서 최소 지지도를 넘는 모든 품목을 찾는다.
#3) 2에서 찾은 개별 품목만을 이용하여 최소 지지도를 넘는 2가지 품목 집합을 찾는다.
#4) 위의 두 절차에서 찾은 품목 집합을 결합하여 최소 지지도를 넘는 3가지 품목집합을 찾는다.
#5)반복적으로 수행해 최소 지지도가 넘는 빈발 품목 집할을 찾는다. 


?apriori

inspect(m_rule)

m2_rule<-apriori(m.trans,parameter = list(support=0.2,confidence=0.20,minlen=2))

inspect(m2_rule)

itemFrequencyPlot(m.trans,support=0.2,col="red")
#지지도 20%이상을 대상으로 상대빈도를 표시한다.

install.packages("arulesViz")
library(arulesViz)
plot(m2_rule,method = "graph",engine='interactive')



#순차적 패턴 분석

install.packages("arulesSequences")
data("zaki")
?arulesSequences::zaki

str(zaki)
#아이템별 sequenceID(순서 정보)


as(zaki, "data.frame")

#순차 패턴 분석을 위해서 "cspade"함수를 사용해야 한다.

?arulesSequences::cspade()

seqr<-cspade(zaki, parameter=list(support=0.3,maxsize=5,maxlen=4))

seqr

as(seqr, "data.frame")
#A가 일어나고 F가 일어날 지지도는 75%이다. 
