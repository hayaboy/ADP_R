install.packages("ROAuth")
getwd()
setwd("C:/Ex/R")
load("apple.RData")
length(apple.tweets)
apple.tweets
str(apple.tweets)
apple.tweets[1:2]

function(t){t$getText()}


apple.text<-lapply(apple.tweets,function(t){t$getText()} )
str(apple.text)
is(apple.text)
head(apple.text,2)
?scan
pos.word<-scan("C:/Ex/R/positive-words.txt", what="character", comment.char = ";")
neg.word<-scan("C:/Ex/R/negative-words.txt", what="character", comment.char = ";")
is(pos.word)
pos.words<- c(pos.word, "upgrade") 
neg.words<- c(neg.word, "wait", "waiting") 
tail(pos.words,10)
?laply
?lapply
apple.text

?match
score.sentiment<-function(sentences,pos.words,neg.words, .progress="none"){
  require(plyr)
  require(stringr)
  scores<-laply(sentences, function(sentence,pos.words,neg.words){
    
    sentence <- gsub('[[:punct:]]', "", sentence)
    sentence <- gsub('[[:cntrl:]]', "", sentence)
    sentence <- gsub('\\d+', "", sentence)
    sentence <- tolower(sentence)
    word.list <- str_split(sentence, '\\s+')
    words <- unlist(word.list)
    pos.matches <- match(words, pos.words)
    neg.matches <- match(words, neg.words)
    pos.matches <- !is.na(pos.matches)
    neg.matches <- !is.na(neg.matches)
    score <- sum(pos.matches) - sum(neg.matches)
    return(score)
  },pos.words,neg.words,.progress = .progress)
  
  scores.df <- data.frame(score=scores, text=sentences)
  
  return(scores.df)
  
}
apple.scores=score.sentiment(apple.text,pos.words,neg.words,.progress='text')
apple.scores
view()

hist(apple.scores$score)



load("C:/Ex/R/samsung.RData")
samsung.text<-laply(samsung.tweets,function(t){t$getText()})

samsung.text<-samsung.text[!Encoding(samsung.text)=="UTF-8"]

samsung.scores=score.sentiment(samsung.text,pos.words,neg.words,.progress='text')

hist(samsung.scores$score)






