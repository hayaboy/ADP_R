install.packages("twitteR")
library("twitteR")


#####################################################################
# (1) 트위터에 접속해서 자료 가져오기

api_key<-"S9aNEUcVNMmulY6k17a7ERmlD"
api_secret<-"g8AQmEfoSvpacNTK6xDnr7YUQfObWgk3yxdu6deTGar1SmBNMl"
access_token<-"1031353058377093120-KBKWQtQf71MCMMqF8xeBaDGpKsgZXk"
access_token_secret<-"yPntNW6vtU0LiZUUA6oo8XPH5SJjwrLm9w11Bi21ecJMB"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)  # 1 yes를 선택함.
keyword<- 'bigdata'
bigdata.tw<- searchTwitter(keyword, since='2014-01-01', n=1000, lang = 'en')
bigdata.tw[1:100]
tweet<-bigdata.tw[[1]]


#####################################################################
# (연습)사용할 수 있는 속성 확인해보기

str(tweet)
names(tweet)
tweet$retweeted  # T/F
tweet$created  # 트윗등록시각(UTC)
tweet$getScreenName()  #getScreenName 정보를 가져온다. 해당 메시지를 작성한 사람의 이름을 볼 수 있다.
tweet$getText() #list list 형태로 되어 있는 bigdata.tw를 data.frame 형태로 변환하여 저장텍스트만 추출해서 저장



#Reference class 'status' [package "twitteR"] with 17 fields
# $ text         : chr "RT @IainLJBrown: Leveraging big data to drive development\n\nRead more here: https://t.co/Tf6bS2eNeV\n\n#BigDat"| __truncated__
# $ favorited    : logi FALSE
# $ favoriteCount: num 0
# $ replyToSN    : chr(0) 
# $ created      : POSIXct[1:1], format: "2018-08-20 03:20:20"
# $ truncated    : logi FALSE
# $ replyToSID   : chr(0) 
# $ id           : chr "1031380386163642369"
# $ replyToUID   : chr(0) 
# $ statusSource : chr "<a href=\"https://twitter.com/NVSData\" rel=\"nofollow\">Data NVS</a>"
# $ screenName   : chr "NVSData"
# $ retweetCount : num 6
# $ isRetweet    : logi TRUE
# $ retweeted    : logi FALSE
# $ longitude    : chr(0) 
# $ latitude     : chr(0) 
# $ urls         :'data.frame':	1 obs. of  5 variables:
#   ..$ url         : chr "https://t.co/Tf6bS2eNeV"
# ..$ expanded_url: chr "https://ift.tt/2L8B6cV"
# ..$ display_url : chr "ift.tt/2L8B6cV"
# ..$ start_index : num 75
# ..$ stop_index  : num 98
# and 53 methods, of which 39 are  possibly relevant:
#   getCreated, getFavoriteCount, getFavorited, getId, getIsRetweet, getLatitude, getLongitude, getReplyToSID, getReplyToSN, getReplyToUID,
# getRetweetCount, getRetweeted, getRetweeters, getRetweets, getScreenName, getStatusSource, getText, getTruncated, getUrls, initialize,
# setCreated, setFavoriteCount, setFavorited, setId, setIsRetweet, setLatitude, setLongitude, setReplyToSID, setReplyToSN, setReplyToUID,
# setRetweetCount, setRetweeted, setScreenName, setStatusSource, setText, setTruncated, setUrls, toDataFrame, toDataFrame#twitterObj




class(bigdata.tw)
bigdata.df<-twListToDF(bigdata.tw)
class(bigdata.df)

#####################################################################
# (2) 필요 없는 내용들을 제거하기 위한 전처리용 자료를 추출

bigdata.text<-bigdata.df$text
bigdata.text


#####################################################################
# (3) 데이터 전처리  및 가공

#1) Corpus(텍스트 문서의 집합) 생성
# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태



# Corpus는 저장장소를 표시하는  DirSource, VectorSource, DataframeSource처럼 디렉토리, 각 벡터값, 
# csv  파일 같은 데이터 프레임을 통해 읽어들여 생성된다.


library(tm)

my.corpus<-Corpus(VectorSource(bigdata.text))
#현재 만들어진 object인 bigdata.text는 트위터 메시지에서 text 부분만 추출한 벡터 형식
#VectorSource를 사용

my.corpus[[1]]
inspect(my.corpus[1:2]) # 문서내용보기, array를 지정해서 읽어들일 수 있음.


# tm패키지 내에서는 Corpus의 형식을 가지는 데이터들의 변형을 위한 tm_map() 함수가 존재
# 이 함수를 통해, Corpus() 형식의 데이터에 일반적인 함수를 적용해서 가공할 수 있음.
my.corpus<-tm_map(my.corpus, stripWhitespace)  # 대부분의 경우 빈 공간이 있으면 "\n"으로 변경되어 있음. 분석할 때 걸림돌이 되므로, 반드시 처리하고 진행해야함.

inspect(my.corpus)

my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='@\\S*',replacement='')
# @\\S* @뒤에 띄어쓰기 없이 붙어 있는 단어를 제거한다. (s는 공백임. 대문자S는 반대)

my.corpus<-tm_map(my.corpus, contenttransformer(gsub), pattern='http\\S*', replacement='')
# http로 시작해서 공백이 생길때까지 내용을 선택하고 빈값으로 대체

my.corpus<-tm_map(my.corpus, removePunctuation)
my.corpus<-tm_map(my.corpus, content_transformer(tolower))
my.corpus<-tm_map(my.corpus, removeWords, stopwords('en'))
mystopword <- c(stopwords('en'),'rt','via','even')  # 불용어 리스트에서 사용자가 별도로 더 추가하여 변수를 생성한다음 그걸 제거할 수 도 있음.
my.corpus<-tm_map(my.corpus, removeWords, mystopword)


inspect(my.corpus)


#####################################################################
# (3) 자연어처리 (형태소분석stemming)
  # stemDocument와 stemCompletion 과정이 있음. 
    # stemDocument: 앞 어간을 제외한 나머지 부분을 잘라버림. (이 과정을 stemming이라 함.)  ex) updated, update, updating -> updat
      test <- stemDocument(c('updated','update','updating'))  #결과 : [1] "updat" "updat" "updat"

    # stemCompletion: stemming된 단어와 완성을 위한 dictionary를 여기에 넣으면 가장 기본적인 어휘로 완성시켜줌, 즉 그냥 처리했으면 각각 1개씩 집계되었을 updated, update, updating이 3건의 update로 모이게 됨.
      test <- stemCompletion(test, dictionary=c('updated','update','updating')) # 결과 "update" "update" "update" 


install.packages("SnowballC")
library(SnowballC)
dict.corpus <- my.corpus # stemCompletion에서 사용될 dictionary를 위해 현재의 Corpus파일을 dict.corpus에 지정함.

my.corpus<-tm_map(my.corpus, stemDocument)  # 어간만 남김
inspect(my.corpus[1])

# stemCompletion을 할 때 잘못하면 모든 값이 NA가 되버리는 경우가 있어 이를 방지하기 위해, 몇 단계가 추가된 함수를 새롭게 정의함.
stemCompletion_mod <- function(x,dict){
  PlainTextDocument(stripWhitespace(paste(stemCompletion(unlist(strsplit(as.character(x)," ")),dictionary=dict,type='first'),sep="",collapse=" ")))
} # 1. as.character: 입력된 데이터를 character형으로 바꾸고,
  # 2. strsplit: character정보를 " " 한칸 띄어쓰기에 맞춰 분리시켜 리스트로 만듬.
  # 3. unlist: 그걸 unlist시켜서 벡터로 만듬
  # 4. 이내용을 stemCompletion을 이용해서, 매개변수로 들어오는 dictionary와 first타입을 적용해서(먼저 발견되는 양식을 기준으로 함) 단어를 완성시킴.
        # type: prevalent: Default. Takes the most frequent match as completion. // first: Takes the first found completion. // longest: Takes the longest completion in terms of characters.// none: Is the identity.// random:Takes some completion. // shortest: Takes the shortest completion in terms of characters.
  # 5. 나온 결과들을 paste함수로 모으고, 공백없이 처리함 붙이되, 공백(" ")이 나올경우 collapse(분리)함.
  # 6. stripWhitespace를 통해 여백(연속된 공백)을 제거해버림
  # 7. PlainTextDocument: 이렇게 나온 결과를 PlainTextDocument 데이터로 만듬.

?stripWhitespace
?paste

?stemCompletion

my.corpus<- lapply(my.corpus,stemCompletion_mod,dict=dict.corpus)  # list인 자료에 stemCompletion_mod 로 정의한 함수를 각각 적용함.
my.corpus <- Corpus(VectorSource(my.corpus))  # PlainTextDocument였던 내용을 다시 원래대로 돌림.

inspect(my.corpus[1:2])

#####################################################################
    # (4) TDM(Term-Document Matrix) 생성하기

# TDM(Term-Document Matrix): whitespace제거, 소문자변환, 문장부호제거, stopword처리, stemming의 과정을 한 후, 
# 이를 각 문서와 단어간의 사용여부를 이용해 만들어진 matrix

my.TDM2 <- TermDocumentMatrix(my.corpus) # TDM을 만듬.
dim(my.TDM) # dimension 확인  # 결과: 2793, 1000 // 1000개(열)의 트위터 메세지에서, 2793개의 단어(행)가 추출됨. (사실 데이터는 terms와 docs라는 이름의 list로 구성되어 있음)

inspect(my.TDM[55:60,1:10])  # 처음 10개 메세지에서 55~60번째 단어의 분포 확인


    # 분석에 의미가 있는 단어만을 TDM으로 정리하기
myDict <- c('bigdata','data','analyst','cloud','company','privacy','analytics','business','hadoop','datascience','warehouse')
my.TDM <- TermDocumentMatrix(my.corpus, control=list(dictionary=myDict))  # 새로 생성한 Dictionary를 적용하여 TDM을 만듬.

inspect(my.TDM[,60:70])  # 결과 확인
    # <<TermDocumentMatrix (terms: 10, documents: 11)>>
    #   Non-/sparse entries: 14/96
    # Sparsity           : 87%
    # Maximal term length: 11
    # Weighting          : term frequency (tf)
    # Sample             :
    #   Docs
    # Terms         60 61 62 63 64 65 66 67 69 70
    # analyst      0  0  0  0  0  0  0  0  0  0
    # analytics    1  0  0  0  0  1  1  0  0  0
    # bigdata      3  1  0  1  0  2  0  0  0  1
    # business     1  0  0  0  0  0  0  0  0  0
    # cloud        0  0  0  0  0  0  0  0  0  0
    # company      0  0  0  0  0  0  0  0  0  0
    # data         0  0  0  0  0  0  0  0  0  0
    # datascience  1  1  0  0  1  0  0  0  1  1
    # hadoop       0  0  0  0  0  0  0  0  0  0
    # privacy      0  0  0  0  0  0  0  0  0  0



#####################################################################
    # (5) 분석 및 시각화

# 1) Association : 연관성 분석
# 연관분석: 어떤 사건이 동시에 일어나는지를 알아보는 것

    # findAssocs 함수를 이용한 방법
findAssocs(my.TDM,'datascience',0.01)  # datascience라는 단어와 연관성이 0.01이상인 단어들을 표시
# 결과
# bigdata  cloud analytics    hadoop 
# 0.16      0.05      0.04      0.02 

?findAssocs



    # apriori 함수를 이용한 방법  (책의 설명이 완벽하지 않아 이해하지 못함, 인터넷에서 더 공부해야함)
install.packages("arules")
library(arules)

    
transaction_m <- as(as.matrix(my.TDM), "transactions")
# TDM은 arules 패키지의 apriori 함수를 이용한 연관분석을 위해, 단일 처리형(transaction)으로 변환함
# 이유: transactions class : 1과 0으로 이루어져 있는 데이터에서 0이 훨씬 많을 때(spase format - 희소 형태의 데이터). 
#       즉, 의미 없는 정보가 많고 크기가 커서 데이터를 처리하기 힘들 때 transactions class로 처리.


rules.all <- apriori(transaction_m, parameter=list(supp=0.2, conf=0.1))  # apriori알고리즘: 빈도와 신뢰도를 계산하여, 연관성분석
  # 빈도를 나타내는 지지도(support)를 0.2 (1%)로 설정함.
  # 신뢰도를 나타내는 confidence를 0.5 (50%)로 설정함.
  # 출현빈도가 1%이상인 어떤 단어가, 출현했을 때, 다른 어떤 단어가 출현할 확률이 50%이상인 경우의 연관성을 분석함.

inspect(rules.all)




###########################################################
    #word cloud
library(wordcloud)

my.TDM.m <- as.matrix(my.TDM2)  # 위에서 TDM2는 따로 사전을 정의하여 추출한게 아님.
head(my.TDM.m)
term.freq <- sort(rowSums(my.TDM.m), decreasing=T)  # 행기준으로 합을 하고, 정렬을 함. 즉 행이 특정 단어를 의미하므로, 단어의 빈도가 됨.
head(term.freq,15)

wordcloud(words=names(term.freq),freq=term.freq,min.freq=15, random.order=F,colors=brewer.pal(8,'Dark2'))  # 단어 제가거 상당히 필요할 것으로 보임.


###########################################################
  # 감상분석
      # 데이터를 바꿔서, 트위터상 텔타항공에 대한 이미지가 어떻게 되는지 확인해보기
library(plyr)
library(stringr)

# 1) tweet 검색어를 넣어 list로 가져오고, 트윗내용을 array로 저장
delta.tweets <- searchTwitter('@delta',n=1500)
delta.text <- laply(delta.tweets, function(t){t$getText()})

head(delta.text,5)

getwd()

#Hu & Liu의 Opinion LExicon을 불러옴.
hu.liu.pos <- scan("./data/positive-words.txt",what='character',comment.char=';')
hu.liu.neg <- scan("./data/negative-words.txt",what='character',comment.char=';')

#Opinion Lexicon에 호텔의 만족도와 관련된 단어를 더 추가함.
pos.words <- c(hu.liu.pos, 'upgrade')
neg.words <- c(hu.liu.neg, 'wtf','wait','waiting','epicfail','mechanical')
    
    #-----------테스트로 진행해봄------------
    sample <- c("You're awesome and I love you","I hate and hate and hate. So angry. Die!",
                "Impressed and amazed: you are peerless in your achievement of unparalleled mediocrity.")
    result <- score.sentiment(sample, pos.words, neg.words)
    result$score
    #----------------------------------------
    
delta.scores <- score.sentiment(delta.text,pos.words,neg.words,.progress='text')

delta.scores$airline <- 'Delta'
delta.scores$code <- 'DL'

hist(delta.scores$score)

library(ggplot2)
qplot(delta.scores$score)

    

###########################################################
###########################################################
###########################################################

      #    2) 한글처리
library(KoNLP)
library(rJava)
extractNoun('연습을 해보고자 한다. 명사가 잘 추출되는지 보자. 빨간색으로 글씨를 쓰고 있다.') # 속도가느림
sapply('연습을 해보고자 한다. 명사가 잘 추출되는지 보자. 빨간색으로 글씨를 쓰고 있다.',extractNoun) # 속도가 향상


    # 자연어처리부분에서 KoNLP 패키지를 이용하여 단어를 추출, 이를 Corpus로 만들어 분석하는 순서로 진행
    
