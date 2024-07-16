

# 표본정규분포로부터  표본 크기가 10과 40인 표본을 각각 1,000번씩 추출

m10<-rep(NA,1000)
m40<-rep(NA,1000)

for(i in 1:1000){
  m10[i]<-mean(rnorm(10))
  m40[i]<-mean(rnorm(40))  
}

options(digits = 4)

c(mean(m10), sd(m10))

c(mean(m40), sd(m40))

#표본 크기에 따른 표본평균 분포의 변화



hist(m10, xlim=c(-1.5, 1.5), main="n=10", xlab="x", ylab="", col="cyan", border="blue")


hist(m40, xlim=c(-1.5, 1.5), main="n=40", xlab="x", ylab="", col="cyan", border="blue")

#표본 크기가 클수록 기댓값(모집단 평균) 주변에 많이 몰려 있으며 자료가 분포하는 전체 폭이 줄어듦을 알 수 있습니다.





#중심극한 정리


#서로 다른 두 정규분포에서 4개의 표본으로부터 평규을 구하는 것을, 1000번 실시하여 표본 평균의 분포가 
#어떤 형태를 따르는지 확인


set.seed(9)
n<-1000

r.1.mean<-rep(NA,n)
r.2.mean<-rep(NA,n)

for(i in 1:n){
  r.1.mean[i]<-mean(rnorm(4,mean = 3, sd=1))
  r.2.mean[i]<-mean(rnorm(4,mean = 170, sd=6))  
}

options(digits = 4)

c(mean(r.1.mean), sd(r.1.mean))
c(mean(r.2.mean), sd(r.2.mean))

1/sqrt(4)

6/sqrt(4)


hist(r.1.mean,probability = T, xlab="표본평균", ylab="밀도", main="", col="orange", border="red")

x1<-seq(min(r.1.mean), max(r.1.mean), length=1000)
y1<-dnorm(x=x1,mean =3, sd=(1/sqrt(4)) )
lines(x1,y1,lty=2,lwd=2,col="blue")


hist(r.2.mean,probability = T, xlab="표본평균", ylab="밀도", main="", col="orange", border="red")

x2<-seq(min(r.2.mean), max(r.2.mean), length=1000)
y2<-dnorm(x=x2,mean =170, sd=(6/sqrt(4)) )
lines(x2,y2,lty=2,lwd=2,col="blue")
