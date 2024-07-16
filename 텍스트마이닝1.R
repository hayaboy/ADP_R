
?readLines

text1<-readLines(file.choose())
text1
class(text1)
?tm::VectorSource()
text1<-VectorSource(text1)
?tm::Corpus()
corpus<-Corpus(text1)

class(corpus)
?tm_map
corpus2<-tm_map(corpus, removePunctuation)

inspect(corpus2)
corpus2_1<-corpus2
?tm_map
#corpus3<-tm_map(corpus2, removeWords, c('0','1','2','3','4','5','6','7','8','9'))

inspect(corpus3)
corpus3_1<-tm_map(corpus2_1,removeNumbers)
inspect(corpus3_1)


corpus4<-tm_map(corpus3_1, tolower)
inspect(corpus4)

?strwrap()
strwrap(corpus4[[1]])
class(strwrap(corpus4[[1]]))
