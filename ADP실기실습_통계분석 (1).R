
#기술통게
data("iris")
summary(iris)


mean(iris$Sepal.Length)

quantile(iris$Sepal.Length, 1/4)

##회귀분석


set.seed(2)
x=runif(10,0,11)
y=2+3*x+rnorm(10,0,0.2)
dfrm=data.frame(x,y)
dfrm



lm(y ~ x, data = dfrm)





set.seed(2)

u=runif(10,0,11)
v=runif(10,11,20)
w=runif(10,1,30)

y=3+0.1*u + 2*v - 3*w +rnorm(10,0,0.1)


dfrm=data.frame(y,u,v,w)
dfrm



m<-lm(y ~ u+v+w)

m




summary(m)






##다항회귀분석

x<-c(1,2,3,4,5,6,7,8,9)
y<-c(5,3,2,3,4,6,10,12,18)


df1<-data.frame(x,y)
df1
plot(df1)


x2<-x^2

df2<-cbind(x2,df1)
df2



lm(y ~ x, data = df1)


summary(lm(y ~ x, data = df1))


plot(lm(y ~ x, data = df1))



lm(y ~ x + x2, data = df2)

summary(lm(y ~ x + x2, data = df2))



plot(lm(y ~ x + x2, data = df2))





##후진 제거법
X1<-c(7,1,11,11,7,11,3,1,2,21,1,11,10)
X2<-c(26,29,56,31,52,55,71,31,54,47,40,66,68)
X3<-c(6,15,8,8,6,9,17,22,18,4,23,9,8)
X4<-c(60,52,20,47,33,22,6,44,22,26,34,12,12)
Y<-c(78.5,74.3,104.3,87.6,95.9,109.2,102.7,72.5,93.1,115.9,83.8,113.3, 109.4)


print(length(X1))
print(length(X2))
print(length(X3))
print(length(X4))
print(length(Y))

df<-data.frame(X1,X2,X3,X4,Y)



a<-lm( Y ~ X1+X2+X3+X4, data = df )
a

summary(a)



b<-lm( Y ~ X1+X2+X4, data = df )

summary(b)



c<-lm( Y ~ X1+X2, data = df )


summary(c)


##전진 선택법


step(lm(Y ~ 1 , df), scope=list(lower=~1, upper=~X1+X2+X3+X4), direction="forward")


step(lm(Y ~ 1 , df), scope=list(lower=~1, upper=~X1+X2+X3+X4), direction="both")




##상관분석

install.packages("Hmisc")
library(Hmisc)
data("mtcars")
head(mtcars)



plot(mtcars$drat, mtcars$disp)
cor(mtcars$drat, mtcars$disp)


rcorr(as.matrix(mtcars), type = "pearson")



cov(mtcars)



#스피어만 상관계수

rcorr(as.matrix(mtcars), type = "spearman")


#다차원 척도법


data("eurodist")



loc<-cmdscale(eurodist)

loc

x<-loc[ ,1]

y<-loc[ ,2]


plot(x,y, type = "n")
text(x,y,rownames(loc),cex=0.8)
abline(v=0,h=0)

##주성분 분석

summary(USArrests)


fit<-princomp(USArrests,cor=T)

summary(fit)


loadings(fit)


fit$scores



biplot(fit)



##시계열 분석

Nile

plot(Nile)


plot(ldeaths)


ldeaths.decompose<-decompose(ldeaths)

ldeaths.decompose$seasonal


plot(ldeaths.decompose)


ldeaths.decompose.adj<- ldeaths - ldeaths.decompose$seasonal


plot(ldeaths.decompose.adj)


Nile.diff<-diff(Nile, differences = 1)
plot(Nile.diff)


Nile.diff2<-diff(Nile, differences = 2)
plot(Nile.diff2)




acf(Nile.diff2, lag.max = 20)


pacf(Nile.diff2, lag.max = 20)

#ARIMA(8,0) : 부분 자기 상관함수 그래프에서 lag=9에서 절단됨
#ARIMA(0,1) : 자기 상관함수 그래프에서 lag=2에서 절단됨
#ARIMA(p,q) : AR 모형과 MA모형을 혼합하여 모형을 식별하고 결정해야 함




