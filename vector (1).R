# 벡터
c(1,2,3,4)

c('a', 'b','c')

vector1<-c(11,22,33)
vector1

vector2=c(21,22,11)
vector2

vector2[2]

vector2[1]

aa<-c(33,44,55,66,77)
aa
aa[-3]

aa[-1:-2]
aa[2:4]

aa[3]<-100
aa

#새로운 내용을 추가
aa <-c(aa, 200)
aa

aa[9]<-99
aa

append(aa, 1111)
aa

append(aa, 5454, after=4)

append(aa, 1111, after=0)

z<-c(TRUE, FALSE)
z

# 벡터 연산

c(1,2,3)+c(4,5,6)
c(1,2,3)+1

x<-c(1,2,3)
y<-c(2,3,4)
x+y

c(1,2,'a')

# 벡터의 길이를 얻는 함수 length()

x
length(x)



