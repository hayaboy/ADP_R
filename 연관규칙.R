


sample_data<-read.csv(file.choose())

str(sample_data)


?split()

m.list<-split(sample_data$Item, sample_data$ID)


class(m.list)

?ts


install.packages("arules")
library(arules)
?arules

?transactions



#트랜잭션 데이터로 변환


?as


m.trans <- as(m.list, "transactions" )


m.trans

View(m.trans)


?inspect


inspect(m.trans)


?apriori
#Apriori 알고리즘을 사용, 지지도 20%, 신뢰도 20% 이상인 규칙

m_rule<-apriori(m.trans, parameter=list(supp = 0.2, conf = 0.2, minlen=3))



m_rule



inspect(m_rule)



arules::itemFrequencyPlot()




?itemFrequencyPlot



arules::itemFrequencyPlot(m.trans, support=0.2, col="red")


m_rule2<-apriori(m.trans, parameter=list(supp = 0.2, conf = 0.2, minlen=2))


inspect(m_rule2)



arules::Adult

datasets::Adult


data("Adult")

Adult

inspect(Adult)

class(Adult)

?apriori()

#보기힘드 데이터를 보기 쉽게 만드는 방법



apriori(Adult)

#~로   as



?as


data_frame_Adult<-as(Adult, "data.frame")


View(data_frame_Adult)

data_frame_Adult[1, ]




adult_rules<-apriori(Adult)

adult_rules

inspect(adult_rules)

?sort

inspect(head(sort(adult_rules, by = "lift")))

adult.rules<-apriori(Adult, parameter=list(support = 0.1, confidence = 0.6), appearance = list(rhs=c('income=small', 'income=large'), default='lhs'), control=list(verbose=F))

?apriori

adult.rules.sort<-sort(adult.rules, by='lift')



inspect(head(adult.rules.sort))


install.packages("arulesViz")
library(arulesViz)

?plot
plot(adult.rules.sort, method="scatterplot")



plot(adult.rules.sort, method="graph", control=list(type='items', alpha=0.5))





#Groceries


data(Groceries)



Groceries




inspect(Groceries)


inspect(Groceries[1:10])

summary(Groceries)


round(sort(itemFrequency(Groceries, type="relative"), decreasing=T), 3)





itemFrequencyPlot(Groceries, topN=10, type="absolute")



result_rules<-apriori(Groceries, parameter=list(support=0.005,confidence=0.5, minlen=2 ))


summary(result_rules)


inspect(result_rules[1:5])

rules_lift<-sort(result_rules, by="lift", decreasing=T)




inspect(rules_lift[1:5])



9835   * 0.005287239



rules_conf<-sort(result_rules, by="confidence", decreasing=T)

inspect(rules_conf[1:5])





inspect(rules_lift)

?subset

milk_rule<-subset(rules_lift, items %in% "whole milk")


milk_rule
inspect(milk_rule[1:5])





milk_rule2<-subset(rules_lift, rhs %in% "whole milk")


inspect(milk_rule2[1:5])




wholemilk_rule<-apriori(Groceries, parameter=list(support=0.005, confidence=0.5,minlen=2), appearance=list(default="lhs", rhs="whole milk"))

wholemilk_rule<-sort(wholemilk_rule, by="lift", decreasing=T)
inspect(wholemilk_rule[1:5])




plot(wholemilk_rule[1:10], method="graph" , measure="lift", shading="confidence")






#순차 패턴


install.packages("arulesSequences")

library(arulesSequences)


data(zaki)



str(zaki)




inspect(zaki)




package_version(R.version) 



?install.packages()



?cspade


seqr<-cspade(zaki, parameter = list(support=0.3,maxsize=5,maxlen=4))
             

seqr

inspect(seqr)

as(seqr, "data.frame")

