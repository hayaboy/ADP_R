# 벡터 유형
# numeric type : 실수까지 표현 가능한 타입
# integer type : 정수값을 표현하는 데이터 타입
# factor type : 범주형 데이터 타입
# character type : 문자열을 나타내느 데이터 타입

# 자료형 변환 : as.원하는 자료형

# as.character() : 문자열 데이터 타입으로 변환
# as.numeric() : 수치형
# as.complex() : 복소수
# as.logical : TRUE, FALSE

# 자료구조 변환

# as.data.frame() / as.list() / as.matrix() / as.vector
# as.factor


x<-0:5
x
# str(객체) : 데이터구조, 데이터 타입(자료형), 변수 명, 관찰값등을 미리보기하는 함수
str(x)

x<-as.character(x)
str(x)

x<-as.numeric(x)
x
str(x)

x<-as.complex(x)
x
str(x)

x<-as.double(x)
x
str(x)


# TRUE Or FALSE 
# 0 : FALSE, 0을 제외한 나머지는 TRUE

x<-as.character(x)
x
x<-as.integer(x)
x
str(x)

x<-as.logical(x)
x
str(x)

# logical--> integer :  TRUE는 1, FALSE는 0

x<-as.integer(x)
str(x)

x<-c("a", "b","c")
x<-as.integer(x)
x

x<-as.numeric(x)
x

x<-as.logical(x)
x


## 자료구조 변환

x<-0:5
str(x)
x<-as.data.frame(x)
x
str(x)

# 리스트 형태로 변환

x<-as.list(x)
x

str(x)


#matrix로 변환
x<-0:5
x<-as.matrix(x)
x

str(x)


BloodType<-c("A","AB","O","O","O","O","O","O","B","B")
BloodType

BloodType<-factor(BloodType)
BloodType


gender<-c("m", "f")
gender
gender<-factor(gender)
gender

nlevels(BloodType)
nlevels(gender)


x<-c("M", "M", "F", "M", "F")
x<-factor(x)
x
str(x)

x<-as.integer(x)
x
str(x)

x<-as.factor(x)
x
str(x)

