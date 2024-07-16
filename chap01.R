rm(list = ls())
#정형데이터마이닝(사용데이터:lotto)
#lotto 데이터는 1회부터 859회까지의 로또 당첨번호(보너스 번호를 제외한 6개의 추첨번호) 데이터

#time_id 로또회차(수치형)
#num_N 해당 회의 N번 째 당첨번호 6개(수치형)

#1) 연관규칙분석을 수행하기 위해 lotto 데이터셋을 transaction 데이터로 변환하시오.
#단, 본 분석에서 로또번호가 추첨된 순서는 고려하지 않고 분석을 수행하도록 한다.)
#그리고 변환된 데이터에서 가장 많이 등장한 상위 10개의 로또 번호를 막대그래프로 출력하고 이에 대해 설명하시오.


lotto<-read.csv(file.choose())
str(lotto)

##na값이 존재하는지 확인
sum(is.na(lotto))


##lotto 데이터를 트랜잭션 데이터로 변환하기 이전에, 데이터의 형태를 변형하기 위한 패키지 reshape2패키지로 데이터의 형태 변환
##이후 arlues 패키지에 포함된 as함수를 사용하여 데이터를 트랜잭션 데이터로 변환

install.packages("arules")

arules::apriori()
arules::inspect()

?apriori



num<-c(lotto$num1,lotto$num2,lotto$num3,lotto$num4,lotto$num5,lotto$num6)


top10<-head(sort(table(num), decreasing = T),10)


str(top10)
head(top10,10)

df1<-data.frame(top10)
df1

?hist()

?barplot()


#1)가장 많이 등장한 상위 10개의 로또 번호의 막대 그래프
barplot( Freq ~ num, df1 )


##데이터 형태 변형을 위한 패키지 설치 및 로드
install.packages("reshape2")
library(reshape2)


lotto_melt<-melt(lotto,id.vars = 1)

head(lotto_melt,10)

lotto_melt[lotto_melt$time_id==859,]

lotto_melt2<-lotto_melt[,-2]


head(lotto_melt2,10)


lot_sp<-split(lotto_melt2$value, lotto_melt2$time_id)

lot_ts<-as(lot_sp,"transactions")

inspect(lot_ts[1:5])


###




#2)

?apriori

rules_1<-apriori(lot_ts, parameter = list(supp = 0.002, conf = 0.8, minlen=2,maxlen=6))

inspect(rules_1[1:20])


#inspect(sort(rules_1, decreasing = 30))

#rules_1_df_pre<-inspect(sort(rules_1, decreasing = 30))


#inspect(sort(rules_1, decreasing = T))

?head

head(inspect(rules_1),5)

?apriori()

?sort

inspect(head(rules_1, n = 30, by = "lift"))


?DATAFRAME


#df_rules<-DATAFRAME(inspect(head(rules_1, n = 30, by = "lift")))

#df_rules<-as(inspect(head(rules_1, n = 30, by = "lift")), "data.frame")


inspect(rules_1[1:5])

rules_2<-sort(rules_1, by = "lift", decreasing = TRUE)

?inspect

is(rules_2)

rules_3<-inspect(rules_2[1:30])


rules_4<-as(rules_3, "data.frame")


str(rules_4)

#df_rules<-DATAFRAME(head(rules_1, n = 30, by = "lift"))

write.csv(rules_4,file = "C:/ex/r/df_rules.csv")


##summary 함수를 이용하여 생성된 규칙들에 대한 정보 해석

summary(rules_1)

## lotto데이터에서 가장 많이 등장한 추천번호 '34'가 우측항에 존재하는 규칙들만을 추출하여 저장한 뒤 해당 규칙들을 확인

rules_1
?subset

?arules::subset()

?subset

rules_most_freq<-subset(rules_1, rhs %in% "34")

inspect(rules_most_freq)




