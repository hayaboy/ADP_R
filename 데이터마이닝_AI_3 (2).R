rm(list=ls())

study_time<-c(2,4,6,8)

score<-c(81,93,91,97)

st_m<-mean(study_time)
sc_m<-mean(score)


st_pyuncha<- st_m - study_time


va_st<-sum(st_pyuncha^2)/(length(study_time)-1)
va_st
var(study_time)

sc_pyuncha<- sc_m - score

?sd


sd(study_time)
sd(score)

cov(study_time,score) / (sd(study_time) * sd(score))


cor(study_time, score)


plot(study_time,score)

?lm
lm(score ~ study_time)

install.packages("ggplot2")


ggplot2::Cars

?file.choose

?read.table

auto_mpg<-read.table(file.choose(),header = FALSE, na.strings = "?")
View(auto_mpg)

str(auto_mpg)
?colnames
colnames(auto_mpg)<-c('mpg','cylinders','displacement','horsepower','weight','acceleration','model year','origin','name')
str(auto_mpg)

library(dplyr)

auto_mpg4<-auto_mpg %>% select(mpg,weight,horsepower) %>% filter(horsepower!="?")

# %>%  ctrl + shift + M

#auto_mpg %>% select(mpg,weight,horsepower) %>% filter(horsepower!="?")

attach(auto_mpg4) # auto_mpg4를 메모리에 로딩

colnames(auto_mpg4)

plot(mpg ~ weight)

lm(mpg ~ weight)

summary(lm(mpg ~ weight))
#통계학 기반의 데이터 회귀 분석
#1.회귀모델의 가정
# 1)선형성(독립변수의 변화에 따라 종속 변수도 일정크기로 변화)
# 2)독립성(잔차와 독립변수의 값이 관련돼 있지 않음)
# 3)등분산성(독립변수의 모든 값에 오차들이 분산이 일정)
# 4)비상관성(관측치들의 잔차들끼리 상관이 없어야 함 )
# 5)정상성(잔차항이 정규분포를 이루어야 함)
#residuals(예측값과 실제값의 차이)
#2.R제곱값이 0.7이상이면 충분히 잘 만들어진 모델이라고 판단.
#3. Adjusted R-squared(조절된 결정계수) : 모델에 반영되는 독립변수의 숫자가 증가함에 따라 결정계수가 커지는 성향, 이를 조절하기 위함 . 
#4. F-statistic : MSR(평균회귀제곱)/평균오차제곱(MSE) -> 표준오차보다 회귀식으로 설명되는 부분이 어느정도 더 많은지 
plot(lm(mpg ~ weight))




colnames(auto_mpg)

auto_mpg5<-auto_mpg %>% select(mpg,displacement,horsepower,weight,acceleration) %>% filter(horsepower!="?")

auto_mpg5


lm(mpg ~ displacement + horsepower + weight + acceleration , data = auto_mpg5)



colnames(auto_mpg)<-c('mpg','cyl','disp','hp','wt','acc','model year','origin','name')

colnames(auto_mpg)
attach(auto_mpg)


car_lm<-lm(mpg ~ disp + hp + wt + acc, data =auto_mpg )

hp


summary(car_lm)




str(auto_mpg)

x_test<-c('mpg','disp','hp','wt','acc')

pairs(auto_mpg[x_test], cex=1,col=as.integer(auto_mpg$cyl))

str(auto_mpg)

?step

#AIC?뒗 ?젙蹂? ?씠濡좎쓣 湲곕컲?쑝濡? ?빀?땲?떎. ?뜲?씠?꽣瑜? ?깮?꽦 ?븳 ?봽濡쒖꽭?뒪瑜? ?굹??�?궡?뒗 ?뜲 ?넻怨? 紐⑤뜽?씠 ?궗?슜?릺硫? 洹? ?몴?쁽??� 嫄곗쓽 ?젙?솗?븯吏� ?븡?뒿?땲?떎. 
#?뵲?씪?꽌 ?봽濡쒖꽭?뒪瑜? ?굹??�?궡?뒗 紐⑤뜽?쓣 ?궗?슜?븯硫? ?씪遺� ?젙蹂닿?� ?넀?떎?맗?땲?떎. 
#AIC?뒗 二쇱뼱吏? 紐⑤뜽?뿉 ?쓽?빐 ?넀?떎?릺?뒗 ?젙蹂댁쓽 ?긽??�?쟻?씤 ?뼇?쓣 異붿젙?빀?땲?떎.
#紐⑤뜽?씠 ?넀?떎?븯?뒗 ?젙蹂닿?� ?쟻?쓣?닔濡? ?빐?떦 紐⑤뜽?쓽 ?뭹吏덉씠 ?넂?븘吏묐땲?떎.
#紐⑤뜽?뿉 ?쓽?빐 ?넀?떎?릺?뒗 ?젙蹂댁쓽 ?뼇?쓣 異붿젙 ?븷 ?븣 AIC?뒗 紐⑤뜽?쓽 ?쟻?빀?룄 ??� 紐⑤뜽?쓽 ?떒?닚?꽦 媛꾩쓽 洹좏삎?쓣 ?떎猷밸땲?떎 . 
#利?, AIC?뒗 怨쇱쟻 ?빀 ?쐞?뿕怨? 怨쇱냼 ?쟻?빀 ?쐞?뿕?쓣 紐⑤몢 泥섎━?빀?땲?떎.
step(car_lm, direction = "both")

