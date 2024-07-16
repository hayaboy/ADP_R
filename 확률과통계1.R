
#확률(probability)

install.packages("prob")

library(prob)

#조합(combination):

prob::tosscoin()

?tosscoin()

#H : head(앞면), T : tail(뒷면)
tosscoin(1)
tosscoin(2)

#시행(trial) : 주사위, 동전던지기와 같이 동일한 조건에서 여러번 
#반복될 수 있으며 그 결과가 우연에 의해 결정되는 관찰 또는 실험

rolldie(2)

#표본공간(sample space) : 어떤 시행에서 발생할 수 있는 모든 경우의 집합

#사건(Event) : 표본 공간의 부분 집합

{1,2,3,4,5,6}

{H,T}

?c


vector1<-c(180,178,175,182,183,179,181,180)

is(vector1)

length(vector1)

vec_mean<-mean(vector1)

var(vector1)
sd(vector1)

sum((vector1-vec_mean)^2) / 7


모분산 표본본산
(8개)   (7개)    n-1(자유도)

h_m<-c(168,	160,	170,	162,	168,	163,	164,	167,	161,	166)

var(h_m)





boxplot(vector1)


#vector :  수 또는 기호를 1차원 배열로 표현한 것

h<-c(166,168,170,172,174)

is(h)

boxplot(h)

w<-c(56,58,60,62,64)
#기술 통계 summary
summary(w)

boxplot(w)


boxplot(h,w)


#height표준화

?sd

h_m<-mean(h)

h2<-(h_m - h) / sd(h)

#weight표준화

w_m<-mean(w)
w2<-(w_m - w) / sd(w)
w2

boxplot(h2,w2)






