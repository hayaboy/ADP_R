rm(list=ls())
getwd()
setwd("C:/ex/r")
getwd()


#1.통계 분석(데이터 전처리 및 분산 분석)

fifa<-read.csv("FIFA.csv")

#FIFA 데이터는 가상의 온라인 축구 게임(FIFA)에 등장하는 축구 선수의 주요 특징과
#신체 정보에 대한 데이터

str(fifa)

범주형(명목형,순서형)
수치형(등간형,비율형)
colnames(fifa)

#[1] "ID"  수치형           "Name"                 "Age"                 
#[4] "Nationality" 범주형         "Overall"    선수의 능력치          "Club" 범주형, 현재 소속된 클럽              
#[7] "Preferred_Foot"   선수가 주로 사용하는 발(Left, Right)    "Work_Rate" 공격운동량/방어운동량           "Position"          선수의 포지션   
#[10] "Jersey_Number"    선수의 등번호     "Contract_Valid_Until" 계약 만료 년도 "Height"   문자형 피트와 인치단위로 표현된 선수의 키            
#[13] "Weight_lb"     파운드 단위로 표현된 선수 몸무게        "Release_Clause"  해체 조항(특정 조건이 만족되었을 때 소속 클럽에게 미리 정해진 금액의 오퍼를 받아 들일 것을 자동적으로 요구하는 것)  금액 : 1000 유로   
#Value"   선수의 현재 시장 가치     
#[16] "Wage"   주급 (단위 : 1000 유로 )


#분석 전에 무조건 결측치 확인



sum(is.na(fifa))



#미션1

#각 선수의 키는 Height 변수에 피트와 인치로 입력되어 있습니다.
#이를 cm로 변환하여 새로운 변수 Height_cm을 생성하시오
#예)  5'7     '앞의 숫자는 피트이며 5피트,  '뒤의 숫자는 인치
#1피트=30cm, 1인치=2.5cm

#numeric, integer, character
as.numeric("57")
as.numeric("5'7")

#첫 번째 방법 
#R에서 문자열 라이브러리  string + r : stringr
install.packages("stringr")
library(stringr)

str_split("5'7","'")

#lamvsf

class(str_split("5'7","'"))

str_split("5'7","'")[[1]][1]
str_split("5'7","'")[[1]][2]

as.numeric(str_split("5'7","'")[[1]][1]) * 30

as.numeric(str_split("5'7","'")[[1]][2])*2.5


as.numeric(str_split("5'7","'")[[1]][1]) * 30 + as.numeric(str_split("5'7","'")[[1]][2])*2.5


fifa$Height

?str_split_fixed()


class(str_split_fixed(fifa$Height,"'",2))



(as.numeric(str_split_fixed(fifa$Height,"'",2)[,1])*30) + (as.numeric(str_split_fixed(fifa$Height,"'",2)[,2])*2.5)



fifa$Height_cm<-(as.numeric(str_split_fixed(fifa$Height,"'",2)[,1])*30) + (as.numeric(str_split_fixed(fifa$Height,"'",2)[,2])*2.5)


str(fifa)

head(fifa, 10)


#두 번째 방법 


?substr

?regexpr

regexpr("'", fifa$Height)

regexpr("'", fifa$Height)-1 

timeData<-c("201507251040", "201507251041", "201507251042", "201507251043", "201507251044")



substr(timeData,1,4)

substr(timeData,5,6)


fifa$Height

as.numeric(substr(fifa$Height, 1, regexpr("'", fifa$Height)-1 ))*30

as.numeric(substr(fifa$Height, regexpr("'", fifa$Height)+1, nchar(fifa$Height)))*2.5



length(table(fifa$Position))


table(fifa$Position)
#Forward : LS,ST, RS, LW, LF, CF, RF, RW  8
#Midfielder : LAM, CAM, RAM, LM, LCM, CM, RCM, RM   8
#Defender : LWB, LDM, CDM, RDM, RWB, LB, LCB, CB, RCB, RB  10 
#GoalKeeper : GK  1


#미션2

#포지션을 의미하는 Position변수를 위의 표를 참조해서
#"Forward", "Midfielder", "Defender", "GoalKeeper"로 재범주화하고
#factor형으로 변환하여 Position_Class라는 변수를 생성




#forcats

install.packages("forcats")
library(forcats)


table(fifa$Position)


head(fifa$Position,10)
?within()

fifa$Position=="LS"

Position_Class=character(0)

Position_Class


df1<-data.frame(col1=c(1,2), col2=c(3,4))

df1

df1>2

df1[df1>2]


df1[df1==2]





fifa$Position[0]

"LS" %in% c( "LS","ST", "RS", "LW", "LF", "CF", "RF", "RW")

str(fifa)


fifa<-within(fifa, {
  Position_Class=character(0)
  Position_Class[Position %in% c( "LS","ST", "RS", "LW", "LF", "CF", "RF", "RW")] ="Forward"
  Position_Class[Position %in% c( "LAM", "CAM", "RAM", "LM", "LCM", "CM", "RCM", "RM")] ="Midfielder"
  Position_Class[Position %in% c( "LWB", "LDM", "CDM", "RDM", "RWB", "LB", "LCB", "CB", "RCB", "RB")] ="Defender"
  Position_Class[Position %in% c( "GK")] ="GoalKeeper"
})

table(fifa$Position_Class)


forcats::fct_collapse()


?fct_collapse


fifa$Position_Class2<-fct_collapse(fifa$Position,
             
             "Forward"=c("LS","ST", "RS", "LW", "LF", "CF", "RF", "RW"),
             "Midfielder"=c( "LAM", "CAM", "RAM", "LM", "LCM", "CM", "RCM", "RM"),
             "Defender"=c( "LWB", "LDM", "CDM", "RDM", "RWB", "LB", "LCB", "CB", "RCB", "RB"),
             "GK"=c("GK")
             
             )

str(fifa)
fifa[ , c(18,19)]


fifa[ , c(19)]



fifa<-fifa[ , -c(19)]

str(fifa)



fifa$Position_Class<-factor(fifa$Position_Class, levels = c("Forward", "Midfielder", "Defender", "GoalKeeper"), labels = c("Forward", "Midfielder", "Defender", "GoalKeeper"))



str(fifa)


barplot(table(fifa$Position_Class))





#미션 3 
#새로 생성한 Position_Class 변수의  각 범주에 따른 Value(선수의 시장가치)의 평균값의
#차이를 비교하는 일원 분산분석을 수행하고 결과를 해석

#그리고 평균값의 차이가 통계적으로 유의하다면 사후 검정을 수행하고 설명

#formula        종속변수(결과,y)        ~     독립변수(원인) (x)

?aov

fifa$Value

fifa_result<-aov(Value  ~ Position_Class, data =fifa)


fifa_result

summary(fifa_result)

#사후 검정
TukeyHSD(aov(Value  ~ Position_Class, data =fifa))





?data()

data("iris")

str(iris)


#R에 내장되어 있는 iris 데이터를 이용하여 종(Species)별로 꽃받침의 폭(Sepal Width)의 평균이 같은지 혹은 차이가 있는지를
#확인하기 위해 일원배치 분산분석을 수행하시오.


#시간은 10분

?aov


#검정을 수행하기에 앞서 설정할 수 있는 가설
# 귀무가설(H0) : 세 가지 종에 대행 Sepal Width의 평균은 모두 같다.
# 대립가설(H1) : 세 가지 종에 대행 적어도 하나의 종에 대한 Sepal Width의 평균은 차이가 있다.


str(iris)
colnames(iris)

?summary


boxplot(iris$Species, iris$Sepal.Width )

result<-aov(Sepal.Width ~ Species , data=iris)
summary(result)

#전체 집단 수 : 3
#자유도 : 집단 전체, 집단간, 집단내
#                Df(degree of freedom)
#Species       2 (전체 집단의 수 -1)
#Residuals     147(관측값의 수(150) -집단의수(3))


#분석 결과, p-value(2e-16) 값이 매우 작게 나와 유의 수준 0.05하에서
#귀무 가설을 기각, 따라서 세가지 종에 따른 꽃받침 폭의 평균이 모두 
#동일하지 않다고 결론 내릴 수 있다. 즉, 적어도 어느 하나의 종의 꽃받침 폭 평균값은 나머지 종들과 통계적으로 
#유의한 차이가 있다고 말할 수 있다. 

#사후 검정이란 분산 분석의 결과 귀무가설이 기각되어 적어도 한 집단에서 평균의 차이가 있음이
#통계적으로 증명되었을 경우, 어떤 집단들에 대해서 평균의 차이가 존재하는지를 알아보기 위해 실시하는 분석
#사후 분석의 종류에는 던칸의 MRT, 피셔의 최소유의차 방법, 튜키의 HDS 방법, Sheffe의 방법 등이 있다.

#그렇다면, 세 가지 종들 중 특히 어떠한 종들 간에 꽃받침의 폭에 차이가 있는지를 파악하기 위해
#사후 검정을 수행


stats::TukeyHSD()

?TukeyHSD()

TukeyHSD(result)

#사후 분석에서는 귀무가설: 집단들  사이의 평균은 값다.
#                  대립가설 : 집단들 사이의 평균은 같지 않다.

#세 가지 비료에 대해 모두 수정된 p adj(수정된 p값)이 0.05보다 작으므로
#각각의 비교에 대한 귀무가설 모두 기간
#즉 모든 종들에 대해서 꽃받침 폭의 평균값은 통계적으로 유의한 차이가 있다.
#diff은 
versicolor-setosa    -0.658
#음수이므로 setosa일 때 꽃받침의 폭이 통계적으로 유의하게 큰 값을 가짐



iris[iris$Species=='setosa', ]


mean(iris[iris$Species=='setosa', 2])
mean(iris[iris$Species=='versicolor', 2])
3.428 - 2.77
