
df<-read.csv(file.choose(), fileEncoding = 'cp949')
df
barplot(table(df$성별))

pie(table(df$성별))
