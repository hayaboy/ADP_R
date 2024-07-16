
datasets::iris



150*0.7



t
norm



chisq
f


?rnorm


#           평균           분산
#p          norm           chisq
#d            t            f
#q
#r




#확률

install.packages("prob")

library(prob)
prob::rolldie()




?rolldie



tbl<-rolldie(2)

class(tbl)


tbl['X1'] + tbl['X2']

table(tbl['X1'] + tbl['X2'])

tosscoin(1)
tosscoin(2)




#확률변수
#:시행해봐야 비로소 결과를 알 수 있는 변수

#확률적 변하는 경우의 변수

#동전을 두 번 던질 때 앞면이 안나올 경우

#          확률

#0번       1/4 

#1번       2/4

#2번       1/4






#윷놀이 확률 구하기






?prob::urnsamples()


urnsamples(c(c(1),c(2,2,2),c(3,3,3)),1)

urnsamples(c("B","B","B", "W","W","W"),1)
urnsamples(c("B","B","B", "W","W","W"),2, replace = T)








1-0.025


qnorm(1-0.025, mean = 0, sd = 1)
qnorm(0.025, mean = 0, sd = 1)


#단순회귀분석

adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104	,105,	121)

lm(sales ~ adv)
summary(lm(sales ~ adv))


cor(adv,sales)

cor(adv,sales)^2




#오차 제곱합 

