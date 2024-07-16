

adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100	,85,	95,	105,	105,	110,	105,	104,	105,	121)

plot(adv, sales)


adv_mean<-mean(adv)

sales_mean<-mean(sales)

sales_mean


cov(adv, sales)

sum((adv_mean-adv)*(sales_mean-sales)) / (length(sales)-1)

cor(adv, sales)


#적합도 검정

#귀무가설 : 바다에 대한 선호도=산에 대한 선호도  50
#k는 2이므로 자유도 2-1=1



 ((68-50)^2  + (32-50)^2)  / 50


?qchisq



qchisq(0.95, 1)






#독립성 검정

#99% 수준으로 카이제곱 검정



(154-102)^2/102 + (52-104)^2/104  + (7-59)^2/59 + (112-60)^2/60

qchisq(0.99, 1)

