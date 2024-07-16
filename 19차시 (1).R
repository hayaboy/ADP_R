"
#정규분포
종모양의 형태를 가집니다. 
양 끝이 아주 느린 속도로 감소하지만, 축에 닿지 않고 -∞와 ∞까지 계속됩니다.
평균을 중심으로 좌우대칭입니다
평균 주변에 많이 몰려 있으며 양 끝으로 갈수록 줄어듭니다.
평균과 표준편차로 분포의 모양을 결정합니다. 
정규분포의 모수는 평균 𝜇와 표준편차 𝜎(분산 𝜎^2)로, 𝑁(𝜇, 𝜎^2)으로 나타냅니다



#이항분포에서 정규분포로

이항분포의 시행횟수를 늘리면 그 분포는 정규분포에 가까워짐

"


# 확률변수X 평균이 170이고 표준편차가 6인 정규분포 (N (170,6^2 ))


?options

options(digits = 3)


mu<-170
sigma<-6



ll<-mu-3*sigma
ul<-mu+3*sigma

x<-seq(ll,ul, by=0.01)

x

nd<-dnorm(x,mean = mu,sd=sigma)
nd

plot(x,nd,type="l",xlab="x",ylab="P(X=x)", lwd=2,col="red")





pnorm(mu,mean=mu,sd=sigma)



pnorm(158, mean=mu,sd=sigma)

pnorm(180, mean=mu,sd=sigma)




pnorm(180, mean=mu,sd=sigma) - pnorm(160, mean=mu,sd=sigma)



qnorm(0.25, mean = mu, sd=sigma)


qnorm(0.5, mean = mu, sd=sigma)

qnorm(0.75, mean = mu, sd=sigma)


options(digits = 5)

set.seed(5)

smp<-rnorm(400,mean = mu,sd=sigma)
smp

c(mean(smp),sd(smp))

hist(smp, probability = T, main="N(170, 6^2)으로부터 추출한 표본의 분포(n=400)", xlab="", ylab="", col="white", border="black")

?lines

lines(x, nd, lty=2, lwd=2, col="red")


