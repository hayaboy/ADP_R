print("hi")


1>0

a<-1

#NA 결측 상태
#NULL 값이 정해지지 않은 상태

b<-NA

c<-NULL

c

# R의 자료 구조

#벡터 : 동일한 자료형의 단일 값들이  한군데 모여있는 자료구조


1:5
5:1

1:1000

#벡터 생성 함수
?c

c(1:6)
c(1,2,3,c(1,2,3))

x<-c(1,2,3)
class(x)
is(x)


?seq()


seq(1,5, by=2)

seq(1,5, by=0.001)


seq(0,1,length.out=1000)


rep(7,5)
rep('a',5)

rep(c(1,2,3), times=2)
rep(c(1,2,3), each=2)


x

x[1]
x[2]




for(i in 1:length(x)){
  
  print(x[i])
}




ex<-c(1,3,7,NA,12)
ex


ex<10

ex[ex<10]


is.na(ex)


ex[is.na(ex)]



ex[ex%%2==0 & !is.na(ex)]






















