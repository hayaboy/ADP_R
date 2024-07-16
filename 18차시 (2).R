
n<-6

p<-1/3

x<-0:n

#확률질량함수

?dbinom

x

(dbinom(2, size = n,prob = p))

(dbinom(4, size = n,prob = p))

( px <- dbinom(x, size=n, prob=p) )

plot(x, px, type="s", xlab="성공 횟수(x)", ylab="확률(P[X=x])", main="B(6, 1/3)")




pbinom()


(pbinom(2, size=n, prob=p))
(pbinom(4, size=n, prob=p))


#성공 횟수가 4 이하 2 초과(3 이상)일 확률(𝑃(2 <𝑋 ≤4))을 구합니다.
(pbinom(4, size=n, prob=p)) - (pbinom(2, size=n, prob=p))


0.087791495+ 0.263374486


sum(px)

qbinom(0.1, size = n, prob = p)


0.087791495 + 0.263374486  + 0.329218107 + 0.219478738 + 0.082304527 + 0.016460905

qbinom(0.5, size = n, prob = p)


rbinom(10,size = 6,prob = p)


(ex<-sum(x*px))


ex2<-sum(x^2*px)


(varx<- ex2 - ex)


