# Matrix(행렬)
# maxtrix()함수 사용

m<-matrix(c(1,2,3,4))
m

m2<-matrix(c(1,2,3,4),nrow=2)
m2

m3<-matrix(c(1,2,3,4,5,6), ncol=2)
m3

# 행우선으로 입력하고자 할경우에는 byrow=T 설정한다.
m4<-matrix(c(1,2,3,4,5,6), nrow=2, byrow=T)
m4

# 컬럼의 이름을 지정 colnames()함수

m5<-matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=T)
m5

colnames(m5)<-c('A', 'B', 'C')
m5

# 행추가 함수 rbind()함수
m5<-rbind(m5, c(10,11,12))
m5

m5<-rbind(m5, c(11,2,22,33))

# 열 추가 함수 cbind()함수

m5<-cbind(m5, c(11,11,11,11))

m5<-cbind(m5, c(22,22,22,22,22))
m5


