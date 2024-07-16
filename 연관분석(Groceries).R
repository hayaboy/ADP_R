install.packages("arulesViz")

data("Groceries")

str(Groceries)
is(Groceries)

data(package="arules")


#Sparse Format 

# 희소(희박) 행렬: 행렬의 값이 대부분 0인 경우 

# <-> 밀집 행렬(dense matrix)  or 조밀 행렬


Groceries

inspect(Groceries)


summary(Groceries)
inspect(Groceries[1:10])


sort(itemFrequency(Groceries, type="absolute"), decreasing = T)

sort(itemFrequency(Groceries, type="relative"), decreasing = T)


itemFrequencyPlot(Groceries,topN=10,type="absolute")

itemFrequencyPlot(Groceries,topN=10,type="relative")


?apriori





apriori(Groceries)


result_rules<-apriori(Groceries, parameter = list(support=0.005, confidence=0.5, minlen=2 ))




summary(result_rules)



inspect(result_rules)

rules_lift<-sort(result_rules, by="lift", decreasing = T)


inspect(rules_lift[1:5])



rules_conf<-sort(result_rules, by="confidence", decreasing = T)



inspect(rules_conf[1:5])


milk_rule<-subset(rules_lift, items %in% "whole milk")


milk_rule



inspect(milk_rule)



rhs.milk_rule<-subset(rules_lift, rhs %in% "whole milk")

rhs.milk_rule


inspect(rhs.milk_rule)




wholemilk_rules<-apriori(Groceries, parameter = list(support=0.005, confidence=0.5, minlen=2),appearance = list(default="lhs",rhs="whole milk"))





wholemilk_rules<-sort(wholemilk_rules,by="lift",decreasing = T)


inspect(wholemilk_rules[1:5])




plot(wholemilk_rules,method="graph", measure = "lift", shading = "confidence")




