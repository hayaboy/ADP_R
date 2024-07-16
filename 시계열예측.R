#시계열 예측

Nile

class(Nile)

install.packages("graphics")
?ts
# 데이터 자체가 시계열 자료 형식인 "ts" 클래스를 갖기 때문에 따로 설정할 필요는 없다.
# 다만 일반 데이터 셋을 시계열 자료 형식으로 변환하려면 ts 함수를 사용하면 된다.


plot(Nile)
#비계절성을 띄는 데이터, 평균이 변화하는 추세를 보이므로 정상성을 만족하지 못하는 것으로 보인다. 
ldeaths
# 1974년부터 1979년까지의 영국 내의 월별 폐질환 사망자 
# 영국내 폐질환 사망자 데이터는 계절성을 띄는 시계열 자료인 것으로 보인다.
# 계절성을 띠는 시계열 자료는 추세요인, 계절 요인, 불규칙 요인으로 구성된다.



mdeaths
fdeaths
class(ldeaths)
plot(ldeaths)

ldeaths.decompose<-decompose(ldeaths)

ldeaths.decompose

plot(ldeaths.decompose)

#계절성을 띄는 시계열 자료는 계절 요인을 추정해 그 값을 원 시계열 자료에서 빼면 적절하게 조정할 수 있다.

ldeaths.decompose.adj <- ldeaths - ldeaths.decompose$seasonal


plot(ldeaths.decompose.adj)


#ARIMA (Auto-regressive Integrated Moving Average)  모형


# 나일강 연강 유입량 데이터는 시간에 따라 평균이 일정하지 않은 비정상 시계열 자료였다.
# 따라서 diff 함수를 사용하여 차분(차분이란 현 시점의 자료값에서 전 시점의 자료값을 빼는 것을 말한다.)

Nile.diff1<-diff(Nile, differences=1)
Nile
plot(Nile)
plot(Nile.diff1)


Nile.diff2<-diff(Nile, differences=2)

plot(Nile.diff2)
#2번 차분한 결과로 평균과 분산이 시간이 지남에 따라 어느 정도 일정한 정상성을 만족하는 것으로 보인다. 
install.packages("forecast")
#forecast 패키지에 있는 auto.arima 함수를 사용하여 적절한 ARIMA 모형을 결정

auto.arima(Nile)

# 적절한 ARIMA 모형은 ARIMA(1,1,1) 


# ARIMA 모형을 이용한 예측


Nile.arima<-arima(Nile,order = c(1,1,1) )

Nile.arima


Nile.forecast <-forecast(Nile.arima,h=10)
Nile.forecast
plot(Nile.forecast)
