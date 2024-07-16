# 유용한 기능들

# paste 함수

number <-1:5
str<-c("aa", "bb", "cc")


paste(number, str)

paste(number, str, sep="/")

x<-data.frame(x1=c("A","B","C","D","E"), x2=c("F","G","H","I","J"))
x

y<-paste(x$x1, x$x2)
y

y<-paste(x$x1, x$x2, sep="")
y


x$x1

z<-paste(x$x1, collapse="")
z

# substr함수: substr(x, start, stop) :문자형 벡터 x의 start에서 stop까지 잘라오기
substr("2018-08-08", 6, 7)
substr("2018-08-08", 5, 9)

aa<-c("Good", "Morning")
substr(aa, 1,2)

substr("2018-08-08", 6,7)
x<-c("Seoul", "New York", "London", "1254")

x
nchar(x)


#strsplit함수 : strsplit(x, split=",") : 문자형 벡터 x를 split 기준으로 나누기

name<-c("Kim, Gildong", "Lee, MinSu", "Park, NamGil")
name_split<-strsplit(name, split=",")
name_split

lastName<-c(name_split[[1]][1], name_split[[2]][1], name_split[[3]][1])
lastName

firstName<-c(name_split[[1]][2], name_split[[2]][2], name_split[[3]][2])
firstName

nameDf<-data.frame(lastName, firstName, name)
nameDf

# sub함수 : sub(old, new, x) 문자형 벡터 x에서 처음 나오는 old문자를 new문자로 한번만 바꿈

z<-c("My name is GilDong. What's your name?")
sub("name", "first name", z)


# gsub(old, new, x) :문자형 벡터 x에서 모든 old문자를 new 문자로 바꿈
gsub("name", "first name", z)

sub("My name is GilDong.", "", z)




