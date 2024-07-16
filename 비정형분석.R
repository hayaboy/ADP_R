
#비정형 데이터 분석1

?read.table

txt<-readLines(file.choose())

table(txt)


sort(table(txt),10)





