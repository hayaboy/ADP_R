#Reshape 활용

install.packages("reshape2")
library(reshape2)
data(airquality) #데이터 불러오기
head(airquality) #어떤 변수들이 있는지 확인할 때 주로 사용
head(airquality, 3)


names(airquality) #변수명을 알고 싶을 때 사용하는 명령어
names(airquality)<-tolower(names(airquality))
names(airquality)

T<-melt(airquality, id=c("month", "day"), na.rm=T)
T

#cast(데이터, 행레이블~열레이블~값)
cast(T, day~month~variable)

install.packages("reshape")
library(reshape)

acast(T, day~month~variable)
aqm<-acast(T, month~variable, mean)
aqm

f<-cast(T, month~variable, range)
f

#sqldf 분석 : SQL문을 활용한 분석 방법

install.packages("sqldf")
library(sqldf)
data(iris)
sqldf("select*from iris")

sqldf("select*from iris limit 10")
sqldf("select count(*) from iris where Species like 'vi%'")







