getwd()
setwd("C:/Ex/R")
testText<-readLines("input2.txt")
testText
is(testText)
print(testText)
testText <- VectorSource(testText)
is(testText)
corpus<-VCorpus(testText) #volatile
corpus
is(corpus)
corpus<-tm_map(corpus, removePunctuation)
corpus
inspect(corpus)
corpus<-tm_map(corpus,removeNumbers)
corpus
inspect(corpus)
corpus<-tm_map(corpus,tolower)
inspect(corpus)
corpus<-tm_map(corpus, removeWords,stopwords("english"))
inspect(corpus)



corpus<-tm_map(corpus,PlainTextDocument)

is(corpus)

inspect(corpus)

dtm<-DocumentTermMatrix(corpus)

#dtm<-TermDocumentMatrix(corpus, control = list(dictionary=myDict))


dtm2<-as.matrix(dtm)
frquency <- colSums(dtm2) 

frquency

is(frquency)

table(frquency)

frquency[1:5]

sort(frquency)
frquency[1:5] 
