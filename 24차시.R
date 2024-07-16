rm(list=ls())

#1번

firm<-read.csv(file.choose(), header = TRUE)

head(firm)

summary(firm)

var(firm$salary)
sd(firm$salary)

colnames(firm)

var(firm$tenure)
sd(firm$tenure)

var(firm$age)
sd(firm$age)

var(firm$sales)
sd(firm$sales)

var(firm$profits)
sd(firm$profits)

var(firm$assets)
sd(firm$assets)

#2번

plot(firm$profits, firm$salary)



cor(firm$profits, firm$salary)






#3번

lm(salary ~ profits , data=firm)

#추정된 회귀식  salary= 0.1675*profits    + 3024.1107



summary(lm(salary ~ profits , data=firm))

#유의수준 0.05하에서 p값 0.1957이다. 

# 이 p값은 0.05보다 크므로 추정된 회귀식이 통계적으로 유의하지 않다.



#4번

lm(salary ~ profits + age + sales , data=firm)

summary(lm(salary ~ profits + age + sales , data=firm))

#추정된 회귀식  salary= 2.340e-01 * profits  + 1.274e+02*age      -5.650e-03 *sales  -4.569e+03    


#유의수준 0.05하에서 p값 0.4861이다. 

# 이 p값은 0.05보다 크므로 추정된 회귀식이 통계적으로 유의하지 않다.





#5번

lm(salary ~ profits + age + sales + tenure + assets , data=firm)

summary(lm(salary ~ profits + age + sales + tenure + assets , data=firm))



#추정된 회귀식 


#유의수준 0.05하에서 p값 0.7954이다. 

# 이 p값은 0.05보다 크므로 추정된 회귀식이 통계적으로 유의하지 않다.


#6번


step(lm(salary ~ . , data=firm), direction = "backward")


summary(lm(salary ~ profits + age + sales + tenure + assets , data=firm))

summary(lm(salary ~ profits + age + sales + tenure  , data=firm))

summary(lm(salary ~ profits + age + sales   , data=firm))
   
summary(lm(salary ~ profits + age   , data=firm))

summary(lm(salary ~ profits    , data=firm))


summary(lm(salary ~ 1    , data=firm))

#7번
step(lm(salary ~ 1 , data=firm),  scope = list(lower=~1,upper=~tenure+age+sales+profits+assets)   ,direction = "forward")


#8번
step(lm(salary ~ 1 , data=firm),  scope = list(lower=~1,upper=~tenure+age+sales+profits+assets)   ,direction = "both")
