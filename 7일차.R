

sample_data<-read.csv(file.choose(), header = T)


str(sample_data)

head(sample_data)

m.list<-split(sample_data$Item, sample_data$ID)


?split

class(m.list)


#트랜잭션 데이터로 변환

meth
?as

#m.trans<-methods::as(list(m.list),"transactions")
install.packages("arules")
library(arules)
m.trans<-as(m.list,"transactions")

class(m.trans)

summary(m.trans)

inspect(m.trans)

#Apriori 알고리즘을 사용, 지지도 20%, 신뢰도 20% 이상인 규칙

?apriori

m_rule <- apriori(m.trans, parameter = list(support=0.2, confidence=0.2,minlen=3))




m_rule

inspect(m_rule)



m_rule2 <- apriori(m.trans, parameter = list(support=0.2, confidence=0.2,minlen=2))

m_rule2


inspect(m_rule2)


arules::itemFrequencyPlot()


arules::itemFrequencyPlot(m.trans, support=0.2, col="red")



#연관규칙 시각화

library(arulesViz)

plot(m_rule, method = "graph", interactive = T)

plot(m_rule2, method = "graph", interactive = T)

#연관규칙 분석과 순차적 패턴 분석

 #고객         연관규칙 분석                             순차적 패턴분석
 #분석관점      동시 발생 사건                         시간 및 순서에 따른 사건
 #데이터        거래집합셋(transaction data set)       식별 정보, timestamp
 #평가방법      지지도, 신뢰도, 향상도                  지지도(Sequence를 포함하는 고객 비율)



# 순차 패터 분석 알고리즘
#1 정렬 : 거래 데이터를 시쿼스 데이터로 변환
#2 빈발항목 집합 : 지지도를 사용해서 빈발항목 집합 도출
#3 변환 : 고객 시쿼스를 빈발항목 집합을 사용해서 시퀀스로 변환
#4 시퀀스 단계 : 빈발 시퀀스를 도출
#5 최대화 단계 : 빈발 시퀀스에서 최대 시퀀스를 탐색

install.packages("arulesSequences")
library(arulesSequences)

data("zaki")

zaki

summary(zaki)

inspect(zaki)

str(zaki)

as(zaki, "data.frame")

#순차 패턴 분석

#순차 패턴 분석을 위해서 cspade 함수 사용
?cspade

seqr<-cspade(zaki, parameter = list(support=0.3,maxsize=5,maxlen=4))



seqr


as(seqr, "data.frame")

# A가 일어나고, F가 일어날 지지도는 75%이다. 













