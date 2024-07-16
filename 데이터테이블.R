# 데이터 테이블

install.packages("data.table")
library(data.table)

data(iris)
iris_table<-as.data.table(iris)
iris
iris_table

# 데이터 테이블은 데이터 프레임과 동일하게 취급된다.

x<-data.table(x=c(1,2,3), y=c("a", "b", "c"))
x

tables() # 만들어진 데이터 테이블 목록을 확인 할 때 사용한다.

DT<-as.data.table(iris)

# 데이터 테이블 접근 [행, 표현식, 옵션]
DT[1,]
DT[DT$Species == "setosa", ]
DT[1, Sepal.Length]
DT[1, list(Sepal.Length, Species)]

DT[, mean(Sepal.Length)]
DT[, mean(Sepal.Length - Sepal.Width)]



head(iris)

iris[1,1]
DT[1,1]

DT[, mean(Sepal.Length), by="Species"]

DT2<-data.table(x=c("b", "b","b","a", "a"), v=rnorm(5))
DT2

tables()

setkey(DT2, x) #setkey(데이터테이블, 정렬할 컬럼)
DT2

tables()

DT2["a"]
DT2["b"]


DT2['b', mult="first"]
DT2['b', mult="last"]

