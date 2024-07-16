# 날짜 데이터
today<-Sys.Date()
today

now<-Sys.time()
now

date()

# 문자열 날짜를 Date Type으로 변환하기
# as.Date(), strptime()

x1<-"2018-10-10"
x1
as.Date(x1)

as.Date(x1, format="%Y-%m-%d")

as.Date("02/05/2018", "%m/%d/%Y")

as.Date("2018-05-05")

as.Date("2018년10월10일", "%Y년%m월%d일")

as.Date("20181010","%Y%m%d")


format(today , format="%Y년%m월%d일")

as.Date("081010","%y%m%d")


format(Sys.Date(),'%a')
format(Sys.Date(),'%b')
format(Sys.Date(),'%Y')



