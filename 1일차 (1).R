print("hi")


getwd()

setwd("C:/ex")
getwd()

read.csv(file.choose())


sampleData<-read.csv(file.choose())


#가급적 엑셀로 데이터 확인 후  csv로 변환(ANSI) 후 불러오는 방법

read.csv(file.choose())
#row가 10만건 이상일 경우 결측치(missing value) 확인

#데이터 구조 확인

#매개변수, 관련 라이브러리 확인 Ctrl + Spacebar
str(sampleData)

base::summary()


#람브스프
lamvf

?summary

summary(sampleData)


table(sampleData$성별)

barplot(table(sampleData$성별))

pie(c(3,2))
pie(table(sampleData$성별))

summary(sampleData)

boxplot(sampleData$키)

x_bar<-mean(sampleData$키)

x_bar - sampleData$키

sum(x_bar - sampleData$키)




?c

x<-c(2,4,6,8)
y<-c(81,93,91,97)

stats::lm()

?lm


#formula


#  종속변수  ~ 독립변수


?summary

lm(y ~ x)
summary(lm(y ~ x))


height<-c(166,168,170,172,174)

x_bar<-mean(height)


sum((x_bar-height)^2)/length(height)

sqrt(sum((x_bar-height)^2)/length(height))

sqrt(sum((x_bar-height)^2)/(length(height)-1))
















?var()

stats::sd

sd(height)



















#y=2.3*x +79

y

pred_value<-2.3*x+79

real_value_label<-y


real_value_label-pred_value

diff_real_pred<-real_value_label-pred_value



















#모형       

#회귀모형
#잔차



#p          norm
#d          chisq
#q          t
#r          f


#예측한 y절편 79, 예측한 기울기 : 2.3


qt(p =   ,df=length(y)-1)

?pt
pt(2.3







