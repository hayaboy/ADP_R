
df<-read.csv(file.choose(), fileEncoding = 'cp949')
df
barplot(table(df$성별))

pie(table(df$성별))


df$키

#표본 분산, 표분 표준편차
var(df$키)
sd(df$키)
