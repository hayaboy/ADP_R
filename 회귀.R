?c
vec <- c(166,168,170,172,174)
#R은 인덱싱이 1부터 시작함
mean(vec)



?var()

var(vec)



vec2 <- c(60.0, 50.0 , 66.0 , 52.7 , 68.8 )


sd(vec2)


adv<-c(13,8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104,	105,	121)


cov(adv,sales)

cor(adv,sales)

install.packages("UsingR")

library(UsingR)

data(galton)

View(galton)

# structure
str(galton)


plot(galton$parent, galton$child)

time<-c(2,4,6,8)
score<-c(81,93,91,97)

plot(time,score)

cor(time,score)


한글가
?lm

#formula 식  종속변수  ~ 독립변수 

lm(score ~ time)

#회귀식
y=2.3*x+79

#예측

2.3*10+79
#10시간 공부했을 경우 102점으로 예측


datasets::iris3

iris3

datasets::iris



#로지스틱 회귀

?glm()

datasets::iris

#내장 데이터(datasets) 불러오는 함수
?data
data(iris)

remove(list = ls())

#R의 자료구조
#l
#a
#m
#v
#s   f


#y값을 두가지로 하기 위해
# 종을 setosa냐 versicolor

#일부분 추출하는 함수
?subset()

iris$Species

y<-subset(iris, Species=='setosa' | Species=='versicolor')

y$Species

#범주형 데이터로 만드는 함수
?factor()

?glm()

#formula 식  종속변수  ~ 독립변수 

colnames(iris)


#데이터 구조 확인하는 함수
str

str(iris)

#데이터 타입 확인하는 함수

?class

?is

class(iris$Species)

is(iris$Species)

# 로지스틱 회귀 모델 만들기기            

loglm <- glm(Species ~ Sepal.Length  , data = iris, family = 'binomial')


loglm

#
?summary()


summary(loglm)


exp(5.176)



#plot(y$Sepal.Length, y$Species, xlab = "Sepal.Length")

#x<-seq(min(y$Sepal.Length), max(y$Sepal.Length), 0.1)

#lines(x, 1 + (1/(1+(1/exp(-27.829  + 5.176 *x)))), type = 'l', col='red')

plot(y$Sepal.Length, y$Species, xlab = "Sepal.Length")

x<-seq(min(y$Sepal.Length), max(y$Sepal.Length), 0.1)


x

lines(x, 1 + (1/(1+(1/exp(-27.829  + 5.176 *x)))), type = 'l', col='green')


lines(x, 1 + (1/(1+exp(27.829  - 5.176 *x))), type = 'l', col='blue')
