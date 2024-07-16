WestRoxBury<-read.csv(file.choose(),header = T)

str(WestRoxBury)
#관측치는 행에, 변수는 열
sum(is.na(WestRoxBury))
head(WestRoxBury)
#본 데이터의 반응변수 TOTAL.VALUE


#웨스트 록스베리 지역 주택 가치 예측
#2014년 보스턴 남서부에 위치한 웨스트 록스베리 지역의 단독주택 정보보


colnames(WestRoxBury)
"
TOTAL.VALUE 주택 가격(단위: 1,000달러) : 반응 변수
TAX
LOT.SQFT  총 부지(단위:제곱 피트)
YR.BUILT  건축 연도
GROSS.AREA 총 바닥 면적
LIVING.AREA 주거 공간 총 면적(단위:제곱 피트)
FLOORS    층 수
ROOMS      총 방수
BEDROOMS   총 침실 수
FULL.BATH  총 욕실 개수
HALF.BATH  총 보조 욕실 개수
KITCHEN    총 주방 개수
FIREPLACE   총 벽난로 개수
REMODEL   언제 리모델리을 했는지(최근/오래전/안 함)
"

table(WestRoxBury$REMODEL)

dim(WestRoxBury)
View(WestRoxBury)

summary(WestRoxBury)



#데이터베이스로부터 샘플링
#많은 경우 모델 구축 시 모든 관측치를 사용하지 않는다. 적은 데이터로도
#모든 데이터를 사용했을 때와 비슷한 효과를 볼 수 있다면 최대한 적은 양의
#데이터를 사용하는 것이 계산 속도면에서 훨씬 효과적

sample(c(1,2,3),3)


is(row.names(WestRoxBury))


s<-sample(row.names(WestRoxBury),5)

WestRoxBury[s , ]

?sample()



summary(WestRoxBury$ROOMS)


hist(WestRoxBury$ROOMS)



#분류 문제에 있어 희소 사건에 대한 오버 샘플링
#이에 대한 문제를 해결하기 위해 샘플링 시 소수 클래스에 보다 큰 가중치를 주어 클래스 관측치 수에 균형을 맞출 수 있다. 
#샘플링을 통해 불균형을 해결할 수도 있지만 각 클래스의 오분류에 가중치를 주어 해결할 수도 있다.
#보통 소수 클래스 관측치의 오분류에 큰 가중치를 주어 불균형을 해소
#모델 구축시 클래스별 오분류의 중요도를 고려하여 가중치를 다르게 부여함으로써 보다 중요한 클래스의 오분류를
#줄이는 것이 중요하다.

#데이터 전처리와 데이터 정제

#변수의 종류
#명목형/순서형        등간형/비율형

#범주형 변수의 처리

#범주형 변수 값에 순위가 있는 경우(예, 연령구간, 신용등급)는 연속형 변수로 간주된다.
#범주에 순위가 없을 경우 범주를 가변수로 바꿔서 사용하기도 합니다.

#학생,무직,취직,은퇴

t(t(names(WestRoxBury)))
class(WestRoxBury$REMODEL)
WestRoxBury$REMODEL<-as.factor(WestRoxBury$REMODEL)
class(WestRoxBury$REMODEL)

levels(WestRoxBury[,14])


#변수 선택
#가장 간단한 방법은 변수당 10개의 관측치로 적정 관측치의 개수를 정하는 것
# 특히 분류문제에서 필요한 최고 관측치를 6 X m X p로 계산
#m은 클래스의 수이고, p는 변수의 개수


#적절한 변수를 포함시키는 작업은 모델 구축에 있어 매우 중요


#이상치

#분석가들은 통상 '평균으로보터 표준편차의 세 배가 넘는 범위의 데이터'
#이상치 탐지의 궁극적인 목적은 해당 데이터를 찾아 추가적인 검토를 하기 위함
#최종 이상치 판정은 실무자들이 하는 것이 바람직 하다.
#order,min,max,boxplot, 군집분석을 이용하여 거리상 떨어진 데이터


#결측치

#결측치 처리 
#평균, 중앙값 등으로 대체, 좀 더 정교한 처리법으로는 회귀 분석 이용



rows.to.missing<-sample(row.names(WestRoxBury),10)

WestRoxBury[rows.to.missing, ]$BEDROOMS<-NA

summary(WestRoxBury)

median(WestRoxBury$BEDROOMS, na.rm = T)

WestRoxBury[rows.to.missing, ]$BEDROOMS<-median(WestRoxBury$BEDROOMS, na.rm = T)

summary(WestRoxBury$BEDROOMS)

