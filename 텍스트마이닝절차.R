getwd()
setwd("C:/Ex/R")
install.packages("tm")
inputText<-readLines("./input.txt")
inputText
class(inputText)
str(inputText)
print(inputText)
is(inputText)
?VectorSource()
testText<-VectorSource(inputText)
class(testText)
# 말뭉치(코퍼스)란, 언어를 연구하는 각 분야에서 필요로 하는 연구 재료로서 언어의 본질적인 모습을 총체적으로 드러내 보여줄 수 있는 자료의 집합을 뜻한다.
#corpora
#“tm” 패키지에서 문서의 집합은 corpus로 표현된다. 
corpus<-Corpus(testText)
corpus
class(corpus)
?tm_map
corpus<-tm_map(corpus, removePunctuation)
corpus<-tm_map(corpus, removeNumbers)

corpus
corpus<-tm_map(corpus, tolower)
?strwrap
class(strwrap(corpus))
is(strwrap(corpus))
strwrap(corpus[[1]])
length(strwrap(corpus))

strwrap(corpus)




