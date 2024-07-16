# Q1) FIFA데이터에서 각 선수의 키는 Heghit변수에 피트와 인치로 입력되어 있습니다. 
#      이를 cm로 변환하여 새로운 변수 Height_cm을 생성하시오. 
#      ( “ ' ” 앞의 숫자는 피트이며, “ ' ” 뒤의 숫자는 인치, 1피트 = 30cm, 1인치 = 2.5cm)
#---------------------------------------------------------------------------------------

#fifa.csv 데이터를 R에서 읽어온 뒤, 데이터의 구조와 요약을 확인한다.
#작업 디렉토리 설정
setwd("C:/ADP/data")

#데이터 불러오기
fifa<-read.csv("FIFA.csv")
str(fifa)
head(fifa)

#na값이 존재하는지 확인
sum(is.na(fifa))

#Height 변수의 피트, 인치 단위로 저장된 키 값을 cm 단위의 값으로 변환하기
#원활한 연산을 위해 Height 변수를 문자형으로 변환
fifa$Height<-as.character(fifa$Height)

# "'" 앞의 숫자는 피트이며, "'" 뒤의 숫자는 인치를 의미함
#따라서, "'" 앞 숫자를 추출하여 30을 곱하고, "'" 뒤 숫자를 추출하여 2.5를 곱한 뒤 두 숫자를 더하여 cm단위 값으로 변환
as.numeric(substr(fifa$Height,1,regexpr("'", fifa$Height)-1)) * 30 + 
  + as.numeric(substr(fifa$Height,regexpr("'", fifa$Height)+1, nchar(fifa$Height))) * 2.5

#단위를 변환한 값을 Height_cm 변수에 저장
fifa$Height_cm <- as.numeric(substr(fifa$Height,1,regexpr("'", fifa$Height)-1)) * 30 + 
  +                   as.numeric(substr(fifa$Height,regexpr("'", fifa$Height)+1, nchar(fifa$Height))) * 2.5


#---------------------------------------------------------------------------------------
# Q2) 포지션을 의미하는 Position변수를 아래 표를 참고하여 “Forward”, “Midfielder”, 
#      “Defender”, “GoalKeeper”로 재범주화하고, factor형으로 변환하여 Position_Class 
#       라는 변수를 생성하고 저장하시오.
#---------------------------------------------------------------------------------------

#선수의 포지션을 의미하는 Position변수를 문제에 주어진 조건에 맞게 재범주화하여 Position_Class 라는 변수에 저장
fifa<-within(fifa,
             {
               Position_Class=character(0)
               Position_Class[ Position %in% c("LS", "ST", "RS", "LW", "LF", "CF", "RF", "RW") ]="Forward"
               Position_Class[ Position %in% c("LAM", "CAM", "RAM", "LM", "LCM", "CM", "RCM", "RM") ]="Midfielder"
               Position_Class[ Position %in% c("LWB", "LDM", "CDM", "RDM", "RWB", "LB", "LCB", "CB", "RCB", "RB") ]="Defender"
               Position_Class[ Position == "GK" ]="GoalKeeper"
             })


# Position_Class변수를 팩터형(factor)으로 변환
fifa$Position_Class<-factor(fifa$Position_Class, levels=c("Forward", "Midfielder", "Defender", "GoalKeeper"),
                            labels=c("Forward", "Midfielder", "Defender", "GoalKeeper"))
str(fifa)

#---------------------------------------------------------------------------------------
# Q3) 새로 생성한 Position_Class 변수의 각 범주에 따른 Value(선수의 시장가치)의 
#      평균값의 차이를 비교하는 일원배치 분산분석을 수행하고 결과를 해석하시오. 
#      그리고 평균값의 차이가 통계적으로 유의하다면 사후검정을 수행하고 설명하시오.
#---------------------------------------------------------------------------------------
