rm(list=ls())

set.seed(9)
n <- 10
x <- 1:100
y <- seq(-3, 3, by=0.01)

smps <- matrix(rnorm(n * length(x)), ncol=n)

xbar <- apply(smps, 1, mean)
se <- 1 / sqrt(10)
alpha <- 0.05
z <- qnorm(1 - alpha/2)
ll <- xbar - z * se
ul <- xbar + z * se

plot(y, type="n", xlab="표본추출", ylab="z", xlim=c(1, 100), ylim=c(-1.5, 1.5), cex.lab=1.8)
abline(h=0, col="red", lwd=2, lty=2)
l.c <- rep(NA, length(x))
l.c <- ifelse(ll * ul > 0, "red", "black")
arrows(1:length(x), ll, 1:length(x), ul, code=3, angle=90, length=0.02, col=l.c, lwd=1.5)

ex_logical_2 <- c(T, F, T, F)
mode(ex_logical_2)

paste("50 = ", "30 + ", "20", sep=",")



v_character <- c("사과", "복숭아", "사과", "오렌지", "사과", "오렌지", "복숭아")
v_character
v_factor <- factor(v_character)
mode(v_factor)
is(v_factor)

v_factor<-factor(v_character, ordered = TRUE)
v_factor


?norm()
?Uniform


pnorm(800, mean=600, sd=100)


1 - pnorm(800, mean=600, sd=100)
#lower.tail 관측값 이하일 확률 TRUE, 초과는 FALSE
pnorm(800, mean=600, sd=100, lower.tail=F)

pnorm(65, mean=50, sd=5)
pnorm(65, mean=50, sd=5, lower.tail=F)

pnorm(203.18, mean=300, sd=50, lower.tail=F)

pnorm(302.9, mean=300, sd=50, lower.tail=F)

pnorm(203.18, mean=300, sd=50, lower.tail=F) - pnorm(302.9, mean=300, sd=50, lower.tail=F)


0.9735906 - 0.4768743




qnorm(0.1, 300, sd=50, lower.tail = F)

qnorm(0.01, 600, sd=100, lower.tail = F)

