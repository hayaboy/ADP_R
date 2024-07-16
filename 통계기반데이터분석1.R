
rm(list=ls())

install.packages("ISLR")

ISLR::Carseats
  

View(Carseats)


# str : 데이터의 구조(structure)를 보는 명령어

?str

str(Carseats)



# 범(명,서) 연(등,비)

class(Carseats)


?t


Carseats_t<-t(Carseats)

View(Carseats_t)


Carseats$Sales # 각 지역의 천 달러 단위 매출
Carseats$CompPrice # 각 위치에서 경쟁업체가 부과하는 가격
Carseats$Income # 지역 소득 수준
Carseats$Advertising  # 각 지역의 광고 예산
Carseats$Population # 지연의 인구(단위 : 1000)
Carseats$Price # 자동차 좌석의 가격
Carseats$ShelveLoc # 보관 장소의 품질
Carseats$Age # 인구의 연령대
Carseats$Education #지역의 교육 수준
Carseats$Urban #도시인지 아닌지 
Carseats$US #미국인지 아닌지 


#람브스프


lamvsf

#여러분의 데이터로 방금 했던 작업을 해보세요..
df1<-read.csv(file.choose())


str(df1)

?plot


plot(as.factor(df1$일자), df1$종가)


df2<-read.csv(file.choose())

df2$분실물종류

table(df2$분실물종류)



pie(table(df2$분실물종류))



df3<-read.csv(file.choose())

df3

table(df3$요일)




barplot(table(df3$요일))


#상관분석과 회귀


adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)


class(adv)
is(adv)


sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104,	105,	121)


plot(adv,sales)

adv_m<-mean(adv)
sales_m<-mean(sales)

adv - adv_m
sales - sales_m


(adv - adv_m) * (sales - sales_m)

sum((adv - adv_m) * (sales - sales_m)) / (length(adv)-1)



cov(adv,sales)


cov(adv,sales) / (sd(adv)*sd(sales))


cor(adv,sales)

#상관을 수치로 표현해야 함. 상관계수 0에서 1사이
# 1에 가까울 수로 상관이 높다. 적어도 0.7이상은 되야 회귀(인과) 분석을 할 수 있다.


?lm

종속변수 ~ 독립변수

plot(lm(sales  ~ adv))

summary(lm(sales  ~ adv))



y<- 2.186 * 30 +  62.929

y  



sales

adv

cbind(sales,adv)

rbind(sales,adv)


m<-mean(c(2,4,6))


diff_1<-m-c(2,4,6)

sum(diff_1)

