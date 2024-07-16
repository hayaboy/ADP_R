# 시계열 분석

Nile
plot(Nile)

#diff 함수 : 차분을 한다.

Nile.diff<-diff(Nile, differences = 1)

plot(Nile.diff)

Nile.diff<-diff(Nile, differences = 2)
plot(Nile.diff)

ldeaths # 폐질환 사망자에 관한 자료(1974~1979년)
plot(ldeaths)

# decompose() 함수: 시계열 자료를 4가지 요인으로 분해 하는 함수    
ldeaths.decomp<-decompose(ldeaths)
ldeaths.decomp$seasonal

plot(ldeaths.decomp)

ldeaths.decomp.adj<-ldeaths - ldeaths.decomp$seasonal
plot(ldeaths.decomp.adj)
