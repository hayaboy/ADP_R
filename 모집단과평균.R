R.version
#4.4

install.packages("pkgbuild")

pkgbuild::has_build_tools(debug = TRUE)


#install.packages('prob')
#library(prob)


install.packages('combinat')

install.packages(c("timeDate", "timeSeries", "fBasics", "fOptions"))

install.packages("fAsianOptions", repos = "http://R-Forge.R-project.org")

#install.packages('fAsianOptions')

install.packages("D:/down/prob_1.0-1.tar.gz", repos = NULL, type = "source")

library('prob')


rolldie(1)

#prob::tosscoin()
tosscoin(1)

?tosscoin
tosscoin(2, makespace=T)



#예제 4-1 주사위를 두번 던져서
#결과의 합이 10이상이 될 확률



rolldie(2)


rd_df<-rolldie(2)


(rd_df$X1 + rd_df$X2) >= 10

vec_rd10<-(rd_df$X1 + rd_df$X2) >= 10

sum(vec_rd10)


result <- 6 / 36

result

#예제 4-2 주머니 속 공 선택의 확률 계산

blue<- 5
yellow<- 7

# 두번 꺼냄
#복원
# 1번째 확률
5 / 12
# 2번째 확률
5 /12


(5 / 12) * (5 / 12)


# 복원시 확률 0.174

#비복원
# 1번째
5 / 12
# 2번째
4/11


(5 / 12) * (4 / 11)

# 비복원시 확률 0.152






#예제 4-2 윷놀이의 확률변수 

# 도개걸윷모  확률
do <- 0.25

gae <- 0.375

geol <-0.25

yut <- 0.0625

mo <- 0.0625

#말 4개
(1/2)^4

#가장 빨리 이기는 경우

# 1)  모 걸 윷 (모 걸이면 다음 판을 못함함)
# 2)  모 걸 모


(0.0625 * 0.25 * 0.0625)
+ 
(0.0625 * 0.25 * 0.0625)



(0.0625 * 0.25 * 0.0625) + (0.0625 * 0.25 * 0.0625)

1 / 65536


# 다시 생각함

#가장 빨리 이기는 경우
#윷놀이에서 가장 빨리 돌아서 나오는 경우 : 모, 걸, 걸

#말이 4개 : 가장 빨리 이기는 경우  ‘모’가 4번 나온 후에 ‘걸’이 2번


#모가 연속 4회 
1/16

2^3

mo *  mo* mo* mo

mo ^4

1/ 65536


#걸이 연속 4회

0.25 ^2
