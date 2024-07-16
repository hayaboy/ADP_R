# 단순선형회귀분석

x<-runif(10)
x
y<-runif(10)
y

runif(10)
set.seed(12)
runif(10)

# runif : random Uniform (distribution) 균등 분포 난수
# runif(n, min, max)

runif(10, 0, 3)

# rnorm : 정규분포에서 난수를 생성하는 함수
# rnorm(n, mean, sd)

rnorm(10, 0, 0.2)

y<-2+3*x+rnorm(10,0,0.2)
df<-data.frame(x,y)
df

# lm(linear model): lm(종속변수~독립변수, 적용할 데이터)

lm(y~x, data=df)




