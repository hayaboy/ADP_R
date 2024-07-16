# 시계열 분석
rm(list=ls())
Nile
plot(Nile)
str(Nile)

Nile$x
#diff 함수 : 차분을 한다.

Nile.diff2<-diff(Nile, differences = 1)

class(Nile.diff2)
plot(Nile.diff2)



ldeaths # 폐질환 사망자에 관한 자료(1974~1979년)
plot(ldeaths)

# decompose() 함수: 시계열 자료를 4가지 요인으로 분해 하는 함수    
ldeaths.decomp<-decompose(ldeaths)
ldeaths.decomp$seasonal

plot(ldeaths.decomp)

ldeaths.decomp.adj<-ldeaths - ldeaths.decomp$seasonal
plot(ldeaths.decomp.adj)
