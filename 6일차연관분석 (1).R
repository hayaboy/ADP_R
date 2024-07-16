
library(arules)

install.packages("arulesViz")
library(arulesViz)


data(Groceries)

str(Groceries)

class(Groceries)
#희박행렬 형태(Sparse Format)로 저장되어 있어서 
#데이터 세트의 내용을 확인하려면 inspect( )함수를 사용

?inspect
inspect(Groceries)
inspect(Groceries[1:10])
#Groceries 데이터 세트는 30일 기간 동안 총 169개의 아이템에 대하여 9,835건의 트랜잭션
#(구매 거래)이 기록된 데이터 세트

summary(Groceries)


#전체 Groceries 데이터 세트 내에 포함된 각 아이템의 빈도를 확인하기 위해서는 arules 패키지에서 제공
#하는 2개의 함수, 즉 itemFrequency 함수 및 이의 시각화를 위한 itemFrenquencyPlot 함수
#를 사용할 수 있다.
?itemFrequency
sort(itemFrequency(Groceries, type="absolute"), decreasing=T)
round(sort(itemFrequency(Groceries, type="relative"), decreasing=T), 3)

arules::itemFrequencyPlot(Groceries, topN=10, type="absolute" )


arules::itemFrequencyPlot(Groceries, topN=10, type="relative" )

apriori(Groceries)


?apriori
result_rules<-apriori(Groceries, parameter=list(support=0.005, confidence=0.5, minlen=2 ))

summary(result_rules)


#summary(result_rules) 결과, 규칙의 길이 분포(rule length distribution)를 확인 가능한데, 2
#개의 아이템을 가진 규칙이 1개, 3개의 아이템을 가진 규칙이 98개, 4개의 아이템을 가진 
#규칙이 21개가 만들어진 것을 알 수 있다. 최소값은 2이고, 중위수는 3개, 최대값은 4개임
#을 알 수 있다.


inspect(result_rules[1:5])




#{baking powder}를 구매하면, {whole milk}도 구매하는 비율이 
#0.00925이며, 해당 규칙의 신뢰도 {baking powder}⇒{whole milk}는 0.523이고, 향상도 (lift)
#는 2.05배임을 알 수 있다. 이러한 연관규칙을 신뢰도(confidence)나 향상도(lift)에 따라서 
#내림차순으로 정렬해서 살펴보면 연관성이 강한 규칙을 쉽게 파악할 수 있다


rules_lift<-sort(result_rules, by="lift", decreasing=T)

inspect(rules_lift[1:5])
