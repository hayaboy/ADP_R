# 로지스틱 회귀분석

require(survival)
str(colon)
colon1<-na.omit(colon)

View(colon)

result<-glm(status ~ rx+sex+age+perfor+adhere+nodes+differ+extent+surg, family=binomial, data=colon1)
summary(result)

reduced.model = step(result)
summary(reduced.model)
