#감성분석
# 데이터를 바꿔서, 트위터상 텔타항공에 대한 이미지가 어떻게 되는지 확인해보기
library(plyr)
library(stringr)
# 1) tweet 검색어를 넣어 list로 가져오고, 트윗내용을 array로 저장
delta.tweets <- searchTwitter('@delta',n=1500)
delta.text <- laply(delta.tweets, function(t){t$getText()})

head(delta.text,5)

getwd()


setwd("D:/ex/dict")



hu.liu.pos <- scan("./positive-words.txt",what='character',comment.char=';')
hu.liu.neg <- scan("./negative-words.txt",what='character',comment.char=';')

#Opinion Lexicon에 호텔의 만족도와 관련된 단어를 더 추가함.

pos.words <- c(hu.liu.pos, 'upgrade')

neg.words <- c(hu.liu.neg, 'wtf','wait','waiting','epicfail','mechanical')


score.sentiment<- function(sentences, pos.words, neg.words, .progress='none'){
  require(plyr)
  require(stringr)
  scores <- laply(sentences, function(sentence, pos.words, neg.words){
    sentence<-gsub('[[:punct:]]', '', sentence)
    sentence<-gsub('[[:cntrl:]]', '', sentence)
    sentence<-gsub('\\d+', '', sentence)
    sentence<-tolower(sentence)
    word.list<-str_split(sentence, '\\s+')
    words<-unlist(word.list)
    pos.matches<-match(words,pos.words)
    neg.matches<-match(words,neg.words)
    pos.matches<-!is.na(pos.matches)
    neg.matches<-!is.na(neg.matches)
    score<-sum(pos.matches) - sum(neg.matches)
    return (score)
  }, pos.words, neg.words, .progress = .progress)
  
  scores.df<- data.frame(score=scores, text=sentences)
  return (scores.df)
}



delta.scores <- score.sentiment(delta.text,pos.words,neg.words,.progress='text')

View(head(delta.scores,10))
