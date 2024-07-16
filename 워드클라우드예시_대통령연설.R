?KoNLP
install.packages("KoNLP")
install.packages("RColorBrewer")
useSejongDic()
pal2 <- brewer.pal(8,"Dark2") 
text <- readLines(file.choose())
text
class(text)
noun <- sapply(text, extractNoun, USE.NAMES=F)
class(noun)
class(noun)
noun2 <- unlist(noun) 
is(noun2)
word_count <- table(noun2) 
head(sort(word_count, decreasing=TRUE), 10)
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)
?sapply
noun <- sapply(text, extractNoun, USE.NAMES=F)          
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("오늘", "", noun2)
noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

word_count <- table(noun2)

wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)
