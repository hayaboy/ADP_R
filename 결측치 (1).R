# 결측치 처리

y<-c(1,2,3,NA)
y

is.na(y) # 결측값 여부를 확인하는 함수

x<-c(1,2,NA, 4,5)
mean(x)

mean(x, na.rm=T)

data(iris)

iris_na<-iris
iris_na[c(10, 20, 30, 40), 3]<-NA
iris_na[c(22, 100, 120), 1]<-NA
iris_na

# complete.cases() : 결측치 존재를 확인하는 함수
# 데이터 프레임의 모든 행에 적용되며 각행에 저장되어 있는
# 모든 값이 NA가 아닐 때만 TRUE를 반환한다.
# 해당 행의 값이 하나라도 NA를 포함하고 있으면 FALSE를 반환한다.

iris_na[!complete.cases(iris_na),]

iris_na[is.na(iris_na$Petal.Length),]

# 이상값 검색

x<-rnorm(100)
boxplot(x)


x<-c(x, 15, 20, 25)
boxplot(x)


data(freetrade)
head(freetrade)

y=c(1,2,3,NA)

3*y

set.seed(1234)
y=rnorm(100)
outlier(y)
outlier(y,opposite = T)
dim(y)
dim(y)=c(20,5)
y
outlier(y)
outlier(y,opposite = T)
boxplot(y)
