


study<-c(2,4,6,8)
score<-c(81,93,91,97)   #100점 만점이 아님
#문제 모델 만들고 10시간 공부했을 경우 성적을 예측하시오.


?lm

plot(study,score)

lm(score ~ study)

#y=ax +b  a는 기울기, b는 y절편

#y=2.3*x + 79

2.3*10 + 79


datasets::iris

View(iris)

str(iris)
#R은 인덱스가 1부터 시작
iris[1:4]
iris[5]

height<-c(170,155,150,175,165)

weight<-c(65,50,45,70,55)


plot(height, weight)

#y=ax+b


x1<-c(2,4,6,8)
x2<-c(0,4,2,3)
y<-c(81,93,91,97)




# 독립변수 : x1 공부시간 , x2 과외 수업 횟수
# 종속 변수 : y 성적

plot(x1,y)

plot(x2,y)

cor(x1,y)

cor(x2,y)

?lm

lm(y ~ x1 + x2)



summary(lm(y ~ x1 + x2))







boston<-read.csv(file.choose())

boston$MEDV


str(boston)

boston$RM


cor(boston$RM, boston$MEDV)

plot(boston$RM, boston$MEDV)

plot(lm(boston$MEDV ~ boston$RM))


summary(lm(boston$MEDV ~ boston$RM))


test1<-read.csv(file.choose())


cor(test1$value, test1$room)

plot(test1$room, test1$value)

lm(test1$value ~ test1$room)

summary(lm(test1$value ~ test1$room))

View(test1)


l_model<-lm(test1$value ~ test1$room)
















rm(list = ls())

boston<-read.csv(file.choose())

str(boston)



boston_lm<-lm(boston$MEDV ~ CRIM+ZN+CHAS+NOX+RM++DIS+RAD+TAX+PTRATIO+B+LSTAT , data = boston )


colnames(boston)

summary(boston_lm)

step(boston_lm, scope = list(lower=~1, upper=~.), direction = "both")




student<-read.csv(file.choose())


cor(student$height, student$weight )


0.6641816 *  0.6641816

lm(weight  ~ height, data = student)


plot(lm(weight  ~ height, data = student))



summary(lm(weight  ~ height, data = student))



student$gender

student$gender<- ifelse(student$gender=="M", 1,0)

student$gender




lm(weight  ~ height + gender , data = student)


plot(lm(weight  ~ height + gender , data = student))


summary(lm(weight  ~ height + gender , data = student))




#교호작용 포함
lm(weight  ~ height + gender + height:gender, data = student)

summary(lm(weight  ~ height + gender + height:gender, data = student))






datasets::cars


str(cars)

?datasets::mtcars

mtcars


head(mtcars)



cor(mtcars)

attach(mtcars)

plot(wt, mpg)



lm(mpg ~ wt)

summary(lm(mpg ~ wt))



#다항회귀
attach(cars)

plot(speed ,dist )


speed2<-speed^2

cars




lm(dist ~ speed + speed2, data = cars )

#x는 스피드, y는 제동거리

#단순 선형 회귀 0.7528
#다항 회귀 

#y=   0.09996*x^2 + 0.91329* x + 2.47014


summary(lm(dist ~ speed + speed2, data = cars ))



#Ridge Regression


colnames(mtcars)
y<-mtcars$hp

x<- data.matrix(mtcars[ , c("mpg", "wt", "drat", "qsec")])
x


?glmnet

install.packages("glmnet")















