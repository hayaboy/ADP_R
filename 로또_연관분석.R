lot<-read.csv(file.choose())
str(lot)

sum(is.na(lot))

library(reshape2)

head(lot)
?melt()

lot_melt<-melt(lot, id.vars = 1)


#연습
french_fries

str(french_fries)

?french_fries


head(french_fries)


test1<-data.frame(num=c(1,2,3),name=c('홍','김','강'),height=c(170,166,150))


melt(test1, id.vars = 1)

melt(test1, id.vars = 2)

melt(test1, id.vars = 3)



head(lot_melt)



library(dplyr)

lot_melt %>% filter(time_id==1)


str(lot_melt)



library(arules)

?split()

1:10
1:2

split(1:10, 1:2)


str(lot_melt)

head(lot_melt)

lot_sp<-split(lot_melt$value, lot_melt$time_id)


range(lot_melt$time_id)

?as

lot_ts<-as(lot_sp, "transactions")

lot_ts

inspect(lot_ts[1])


?itemFrequencyPlot

is(lot_ts)


itemFrequencyPlot(lot_ts, topN=10,type="absolute")

itemFrequencyPlot(lot_ts, topN=10,type="relative")

?apriori
rules_1<-apriori(lot_ts,parameter=list(supp = 0.002, conf = 0.8, minlen=2,maxlen=6))

summary(rules_1)

inspect(rules_1)

nrow(inspect(rules_1))

?sort
rules_2<-sort(rules_1, by="lift", decreasing = TRUE)

rules_3<-inspect(rules_2[1:30])

rules_4<-as(rules_3, "data.frame")

str(rules_4)


summary(rules_1)


?subset
rules_most_freq<-subset(rules_1, rhs %in% "34")

inspect(rules_most_freq)

