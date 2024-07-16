# 1. 여러가지 평균
# 평균은 데이터의 중심적인 값을 나타내는 것

# 산술/기하/조화
#산술
#X_bar=(X1+X2+...Xn)/n

#기하(Geometric)평균 : 변화량을 계산할 때 많이 사용됨
#조화(Harmonic) 평균 : 일정한 거리를 이동할 때, 평균 속도를 구하는데 이용
# 2ab/(a+b)
# 갈 때는 고속도로로 갈 경우 시속 100km/h,  올 때는 국도를 이용 70km/h
# 왕복 평균 속도

(2*100*70)/(100+70)


#도수분포표(frequency table)

install.packages("readxl")

library(readxl)


readxl::read_xlsx()

?read_xlsx
read_xlsx("C:/itgo/탐색_분석/6차시/test.xlsx")

sample1<-read_xlsx("C:/itgo/탐색_분석/6차시/test.xlsx")


is(sample1)


sample1_df<-data.frame(sample1)

is(sample1_df)


sample1_df$복용전


table(sample1_df$복용전)

hist(sample1_df$복용전)



