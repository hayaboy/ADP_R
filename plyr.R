# apply 함수
# 벡터, 행렬, 데이터프레임에 임의의 함수를 적용하여 결과를 얻기 위한 함수

# apply(x, margin, fun)

sum(1:10)

d<-matrix(1:9, ncol=3)
d

apply(d, 1, sum)

apply(d, 2, sum)

data(iris)
head(iris)

apply(iris[, 1:4], 2, sum)

#plyr 패키지 사용

install.packages("plyr")
library(plyr)

#adply() : 배열(a)을 입력받아 데이터 프레임(d)을 출력하는 함수

# adply(data, margins, fun)

apply(iris[, 1:4], 1, function(row){print(row)})


apply(iris, 1, function(row){print(row)})


adply(iris, 1, function(row){ row$Sepal.Length >=5.0 & row$Species == "setosa"})

# ddply : df를 입력받아서 df을 출력하는 함수

ddply(iris, .(Species), function(sub){data.frame(sepal.width.mean=mean(sub$Sepal.Width))})













