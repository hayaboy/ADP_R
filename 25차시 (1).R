#표준정규분포로부터 10개의 표본을 뽑아 95% 신뢰구간을 구하는 것을 100번 반복했을 때, 
#몇 개의 신뢰구간이 모평균을 포함할지 확인해봅니다.

set.seed(9)

n<-10
x<-1:100
y<-seq(-3,3,by=0.01)

smps<-matrix(rnorm(n*length(x)), ncol=n)

str(smps)
xbar<-apply(smps,1,mean)

xbar

se<- 1 / sqrt(n)
se

alpha<-0.05

(1-alpha/2)

z<-qnorm(1-alpha/2)

ll<-xbar-z*se
ul<-xbar+z*se
ll
ul


plot(y,type = "n", xlab="표본추출", ylab="z", xlim=c(1, 100), ylim=c(-1.5, 1.5), cex.lab=1.8 )

abline(h=0, col="red", lwd=2, lty=2)


l.c <- rep(NA, length(x))

l.c <- ifelse(ll * ul > 0, "red", "black")

arrows( 1:length(x), ll, 1:length(x), ul, code=3, angle=90, length=0.02, col=l.c, lwd=1.5 )





