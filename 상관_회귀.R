#13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25



?c

adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)

class(adv)

is(adv)


sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104,	105,	121)


plot(adv, sales)

?lm

#formula   종속변수  ~ 독립변수

#상관




#평균

mean(adv)

#표본분산

mean(adv)
var(adv)
sd(adv)


mean(sales)
var(sales)
sd(sales)


#공분산

cov(adv,sales)


#상관도(-1 0 1)
cor(adv, sales)




#회귀  
#formula  종속 변수(매출액) ~ 독립변수(광고비)

lm(sales ~ adv)


#y =  ax+ b
#y = 2.186* x+  62.929


#광고비 17  매출은 얼마일지 예측 가능

2.186*17+62.929

#예측한 매출액 100.091

m<-lm(sales ~ adv)


abline(m, col='red')
