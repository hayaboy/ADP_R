library(KoNLP)
library(wordcloud)

?readLines



txt<-readLines(file.choose(), encoding = 'UTF-8')


head(txt,3)


txt2<-paste(txt, collapse = ' ')


txt2


extractNoun()

Map()


tran<-Map(extractNoun, txt2)


tran


tran<-unique(tran)


tran



#2글자에서 4글자 사이의 한글 단어만 선택


tran<-sapply(tran, function(x){
  
  Filter(function(y){
    
    nchar(y) <=4 && nchar(y) > 1 && is.hangul(y)
    
  },x)
  
  
})



tran






#워드 클라우드를 그리기 위한 코드


table(tran)



tran.table<-as.data.frame(table(tran))



tran.table




wordcloud(words = tran.table$tran, freq = tran.table$Freq, min.freq = 3, random.order = F, colors = brewer.pal(5,'Dark2'))










