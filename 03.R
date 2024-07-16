# p.59
# 벡터 만들기
x <- c(80, 85, 70)
x

c(80, 85, 70) -> x
x

# p.60
# 벡터 원소가 하나일 때
x <- c(80)
x

x <- 80
x

# p.62
# 산술연산
x <- 5+2
x

x <- 5/3
x

x <- 5^2
x

x <- 5%%3
x

x <- 5%/%3
x

# p.63
# 벡터의 사칙연산 
x <- c(1, 2, 3, 4) # 4개 원소
y <- c(2, 3, 4, 5) # 4개 원소
z <- c(1, 2)       # 2개 원소

w <- x+y
w

w <- x+5
w

w <- y/2
w

w <- x+z
w

w <- x/z
w

# p.64
w <- z/x
w

# 서로 다른 데이터 유형과 연산
x <- c(1, 2, 3)
x

y <- c("A", "B", "c")
y

y <- c("A", 1, 2)
y

z <- y + 1

# p.65
# 비교 연산자
x <- 5 < 3
x 

y <- c(10, 20, 30)
z <- y <= 10
z

# p.66
# 논리 연산자
x <- TRUE
y <- FALSE
x | y

x & y

# p.67
x <- 3
!x

isTRUE(y)

z <- c(TRUE, FALSE, FALSE)
z | y

# 연속적인 값들의 벡터 만들기
x <- seq(1, 10)
x

x <- 1:10
x

# p.68
x <- seq(10, 1)
x

y <- 10:1
y

x <- seq(1, 10, by=3)
x

y <- seq(1, 10, length.out=5)
y

# p.69
# 반복적인 값들의 벡터 만들기
x <- c(1, 2, 3)
rep(x, times=2)

rep(x, each=2)

# p.70
# 벡터 위치에 따른 출력
x <- c(1, 2, 3, 4, 5)
x[2]

x[c(1, 3, 5)]

# p.71
x[-c(2, 4)]

# 원소 값의 조건에 따른 출력  
x[x > 2]

x[x >=2 & x <=4]

# 원소 값의 수정 
x[2] <- 20
x

x[c(3, 4)] <- 15
x

# p.72
x[x <= 15] <- 10
x

# 벡터에 대한 함수의 사용
x <- seq(1:10)
sum(x)

mean(x)

var(x)

sd(x)

# p.73
sqrt(x)

length(x)

x <- c(1, 2, -3)
abs(x)

# NULL, NA(not available), NaN(not a number)
x <- NULL
is.null(x)

y <- c(1, 2, 3, NA, 5)
y

# p.74
z <- 10/0
z

w <- 0/0
w

# p75
# 1차원 배열
x <- array(1:3, dim=c(3))
x

# p.76
# 2차원 배열 만들기
x <- array(1:6, dim=c(2, 3))
x

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3))
x

# 2차원 배열의 요소 값 보기와 수정
x[1, 3]

x[, 3]

x[,-3]

# p.77
x[1, 2] <- 20
x

# 2차원 배열의 행과 열 이름 추가
names <- list(c("1행", "2행"), c("1열", "2열", "3열"))

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3), dimnames=names)
x

x["1행", ]

# p.78
# 3차원 배열
x <- array(1:24, dim=c(2, 3, 4))
x

## p.79
# 행렬 만들기
x <- matrix(1:6, nrow=2)
x

x <- matrix(1:6, nrow=2, byrow=TRUE)
x

x[1, 3]

# 행과 열 이름 주기
names <- list(c("1행", "2행"), c("1열", "2열", "3열"))

matrix(1:6, nrow=2, byrow=TRUE, dimnames=names)

# p.80
# 벡터 결합에 의한 행렬 만들기
v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)
x <- cbind(v1, v2, v3)
x

# p.81
# 행과 열 이름 주기
rownames(x) <- c("1행", "2행", "3행", "4행")
x

colnames(x) <- c("1열", "2열", "3열")
x

rbind(v1, v2, v3)

# p.82
# 리스트 만들기
x <- list("홍길동", "2016001", 20, c("IT융합", "데이터 관리"))
x

# p.83
y <- list("성명"="홍길동", "학번"="2016001", "나이"=20, "수강과목"=c("IT융합",
"데이터 관리"))
y

# 리스트의 원소 출력
y["성명"]

y[["성명"]]

y$성명

# p.85
# 두 명의 고객 정보에 대한 데이터 프레임 만들기
x <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20, 30), 주소=c("서울", "부산"))
x

# 동일한 결과
x <- data.frame("성명"=c("홍길동", "손오공"), "나이"=c(20, 30), "주소"=c("서울", "부산"))

# p.86
# 열과 행 단위 추가
x <- cbind(x, 학과=c("전산학", "경영학"))
x

x <- rbind(x, data.frame(성명="장발장", 나이=25, 주소="파리", 학과="전산학"))
x

# 요소 값 보기
x[3, 2]

x[3,]

x[, 2]

# p.87
x[-2,]

x["학과"]

x$학과

x[["학과"]]

x[[4]]

x[[4]][2]

x[1, 2] <- 21
x

# p.88
# 요소 값 수정
x[1, "나이"] <- 22
x


# 데이터 프레임의 factor 데이터 수정
str(x)
x[3] <- lapply(x[3], as.character)
str(x)

# '홍3'을 '홍5'로 수정
x[3, 3] <- "제주"
x

# p.90
# 데이터 세트 목록 보기
library(help=datasets)

# p.94
quakes

head(quakes, n=10)

# p.95
tail(quakes, n=6)

# 데이터 세트 구조 보기
names(quakes)

str(quakes)

dim(quakes)

# p.96
# 데이터 세트 요약 보기
summary(quakes)

summary(quakes$mag)

# p.97
# 데이터 세트 저장하고 읽기
write.table(quakes, "c:/temp/quakes.txt", sep=",")

x <- read.csv("c:/temp/quakes.txt", header=T)
x

x <- read.csv(file.choose(), header=T)
x

# p.100
# 웹사이트의 데이터 파일 읽기
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/
Titanic.csv"
x <- read.csv(url)
x

# p.101
# 원의 면적을 구하는 함수의 정의와 호출
getCircleArea <- function(r) {
    area <- 3.14 * r^2
    return(area)
}

getCircleArea(3)

#####################