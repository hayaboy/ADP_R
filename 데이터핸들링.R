# 데이터 핸들링

bb<-c("a", "b", "c")

bb[2]

bb[c(1,2)]

# for문

x<-c()
for(i in 1:9)
{
  x[i]=i*i
}

x

i = 1
while(i<10)
{
  i = i+1
  print(i)
}

# 조건문 if~else, if

# 조건을 판단하는 연산자
# == 같다, != 같지않다, >= 크거나 같다, > 크다, < 작다, <= 작거나 같다


x<-c(1,2,3,4,5)
x
y<-x+5
y

if(sum(x) < sum(y)) {print(y); print(mean(x))}

if(sum(x) > sum(y)) 
{
  print(x)
}else{
  print("조건에 맞지 않습니다!!")
}

# ifelse문
# ifelse(조건문, TRUE일때 실행구문, FALSE일때 실행 구문)

ifelse(mean(x)>mean(y), "x의 평균이 y의 평균보다 큽니다.","x의 평균이 y의 평균보다 크지 않습니다.")


# 사용자 정의 함수
# Function 키워드 이용해서 함수를 정의할 수 있다.
# 인수를 이용한 함수, 인수없는 함수를 만들 수 있다.

func1<-function(param)
{
  isum<-0
  for(i in 1:param){
    isum=isum+i
  }
  print(isum)
}

# 함수 호출

func1(4)










