#기술통계
"
모집단으로부터 수집된 자료를 정리,요약하여 자료의 특징을 분석
표,그래프,객관적인 수치를 사용해서 요약

"
#factor
"
저장 값의 크기보다 의미가 중요한 질적 자료를 위해 사용됩니다. 
예를 들어 숫자 1, 2, 3은 산술연산을 통해 계산되는 본래의 숫자로서의 기능을 하지만, 
factor로 지정된 1, 2, 3은 단지 세 개의 그룹 혹은 상태를 구별 짓는 의미로 사용됩니다.
"

?factor()

"
x : factor로 만들 벡터

levels : 주어진 데이터 중 factor의 가 값(수준)으로 할 값을 벡터 형태로 지정(여기서 빠진 값은 NA로 처리)
labels : 실제 값 외에 사용할 각 수준의 이름, 예를 들어 1이 남자를 가리킬 경우 '남자 혹은 'M'등 으로 변경 
ordered : 순위형 자료 여부를(TRUE/FALSE)로, levels에 입력 한 순서를 가짐

"


x<-c(1,2,3,4,5)
factor(x,levels = c(1,2,3,4))

factor(x,levels = c(1,2,3,4), labels = c("a","b","c","d"))

factor(x,levels = c(1,2,3,4),ordered = TRUE)

#데이터프레임

"
자료 처리를 위해 가장 많이 사용된 자료구조 입니다.
서로 다른 벡터로 구성된 자료들을 열로 배치한 자료구조입니다.

"

?data.frame()

data.frame(혈액형=c('A','O','B'), 키=c(165,170,180))


data.frame(혈액형=c('A','O','B'), 키=c(165,170,180), row.names=c("홍길동","나길동","김길동"))

df<-data.frame(혈액형=c('A','O','B'), 키=c(165,170,180), row.names=c("홍길동","나길동","김길동"))

is(df$혈액형)




name<-c("철수","영희","길동")

age<-c(21,20,31)

is(name)
is(age)
gender<-factor(c("M","F","M"))

df1<-data.frame(name,age,gender)

?str




str(df1)


df1$gender

df1$name

df1[1,]


df1[,2]


















