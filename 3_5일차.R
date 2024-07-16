#d   norm()
#p   t
#q   f
#r   chisq



?pnorm()


pnorm(800, mean = 600, sd = 100)

?dt

?df

?dchisq

#확률
install.packages("prob")
library(prob)
prob::tosscoin()
prob::rolldie()

?tosscoin()


tosscoin(1, makespace=T)


tosscoin(2)

#동전을 두 번 던진 경우, 앞면이 나오는 횟수



#확률변수 (앞면이 나오는 횟수)


#   x=  0,  1,   2

#P(x)  1/4  2/4 1/4




rolldie(2)

#도개걸윷모 확률 구하기

df<-read.csv(file.choose())
str(df)

boxplot(df$mpg, df$cylinders)




datasets::Titanic

data("Titanic")


str(Titanic)


class(Titanic)


head(Titanic)



library(prob)
?rolldie()



die<-rolldie(2)

class(die)

#R은 인덱스가 1부터이다.


die[ , 1]
die[ , 2]


die[ , 1] + die[ , 2]

table(die[ , 1] + die[ , 2])

plot(table(die[ , 1] + die[ , 2]))

barplot(table(die[ , 1] + die[ , 2]))






















