rm(list=ls())
# 텍스트 마이닝 4가지 기능
#1. 문서 요약
#2. 문서 분류
#2. 문서 군집
#3. 문서 추출


# 텍스트 마이닝 기본 프로세스
# 데이터 수집 -> 데이터 전처리 및 가공 -> 자연어 처리  -> TDM 구축 -> 분석 및 시각화


install.packages("twitteR")
library("twitteR")

#####################################################################
# (1) 트위터에 접속해서 자료 가져오기

api_key<-""
api_secret<-""
access_token<-""
access_token_secret<-""

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)  # 1 yes를 선택함.

keyword<- 'bigdata'

bigdata.tw <- searchTwitter(keyword, since='2014-01-01', n=1000, lang = 'en')

class(bigdata.tw)

bigdata.tw[1]

#####################################################################
# (연습)사용할 수 있는 속성 확인해보기


str(bigdata.tw)

tweet<-bigdata.tw[[1]]

names(tweet)


tweet$retweeted # T/F

tweet$created # 트윗등록시각(UTC)


tweet$screenName #해당 메시지를 작성한 사람의 이름을 볼 수 있다.



class(tweet$getText())

is(tweet$getText())


class(bigdata.tw)

bigdata.df<-twListToDF(bigdata.tw)



class(bigdata.df)


head(bigdata.df)


colnames(bigdata.df)


#####################################################################
# (2) 필요 없는 내용들을 제거하기 위한 전처리용 자료를 추출


bigdata.text<-bigdata.df$text

bigdata.text


class(bigdata.text)

is(bigdata.text)

#####################################################################
# (3) 데이터 전처리  및 가공

#1) Corpus(텍스트 문서의 집합) 생성

# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태

library(tm)


# Corpus는 저장장소를 표시하는  DirSource, VectorSource, DataframeSource처럼 디렉토리, 각 벡터값, 
# csv  파일 같은 데이터 프레임을 통해 읽어들여 생성된다.



my.corpus<-Corpus(VectorSource(bigdata.text))

my.corpus


my.corpus[[1]]


inspect(my.corpus[[1]])


# tm패키지 내에서는 Corpus의 형식을 가지는 데이터들의 변형을 위한 tm_map() 함수가 존재

# 이 함수를 통해, Corpus() 형식의 데이터에 일반적인 함수를 적용해서 가공할 수 있음.



my.corpus<-tm_map(my.corpus, stripWhitespace)


inspect(my.corpus[[1]])


# 대부분의 경우 빈 공간이 있으면 "\n"으로 변경되어 있음. 분석할 때 걸림돌이 되므로, 반드시 처리하고 진행해야함.


?gsub()


# @\\S* @뒤에 띄어쓰기 없이 붙어 있는 단어를 제거한다. (s는 공백임. 대문자S는 반대)


my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='@\\S*',replacement='')

inspect(my.corpus)

# http로 시작해서 공백이 생길때까지 내용을 선택하고 빈값으로 대체

my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='http\\S*', replacement='')


inspect(my.corpus)

my.corpus<-tm_map(my.corpus, removePunctuation)

inspect(my.corpus)

my.corpus<-tm_map(my.corpus, content_transformer(tolower))

inspect(my.corpus)

stopwords('en')

my.corpus<-tm_map(my.corpus, removeWords, stopwords('en'))

tm::removeNumbers()


my.corpus<-tm_map(my.corpus, removeNumbers)


inspect(my.corpus)



mystopword <- c(stopwords('en'),'rt','via','even')  # 불용어 리스트에서 사용자가 별도로 더 추가하여 변수를 생성한다음 그걸 제거할 수 도 있음.



my.corpus<-tm_map(my.corpus, removeWords, mystopword)



inspect(my.corpus)


#####################################################################
# (3) 자연어처리 (형태소분석stemming)


# stemDocument와 stemCompletion 과정이 있음. 

# stemDocument: 앞 어간을 제외한 나머지 부분을 잘라버림. (이 과정을 stemming이라 함.) 

#ex) updated, update, updating -> updat


test <- stemDocument(c('updated','update','updating')) 

test


# stemCompletion: stemming된 단어와 완성을 위한 dictionary를 여기에 넣으면 가장 기본적인 어휘로 완성시켜줌, 즉 그냥 처리했으면 각각 1개씩 집계되었을 updated, update, updating이 3건의 update로 모이게 됨.
test2 <- stemCompletion(test, dictionary=c('updated','update','updating')) 

test2



library(SnowballC)


# stemCompletion에서 사용될 dictionary를 위해 현재의 Corpus파일을 dict.corpus에 지정함.

dict.corpus <- my.corpus


my.corpus<-tm_map(my.corpus, stemDocument)  # 어간만 남김


inspect(my.corpus)


# stemCompletion을 할 때 잘못하면 모든 값이 NA가 되버리는 경우가 있어 이를 방지하기 위해, 몇 단계가 추가된 함수를 새롭게 정의함.
stemCompletion_mod <- function(x,dict){
  PlainTextDocument(stripWhitespace(paste(stemCompletion(unlist(strsplit(as.character(x)," ")),dictionary=dict,type='first'),sep="",collapse=" ")))
}
  
  
  # 1. as.character: 입력된 데이터를 character형으로 바꾸고,
  # 2. strsplit: character정보를 " " 한칸 띄어쓰기에 맞춰 분리시켜 리스트로 만듬.
  # 3. unlist: 그걸 unlist시켜서 벡터로 만듬
  # 4. 이내용을 stemCompletion을 이용해서, 매개변수로 들어오는 dictionary와 first타입을 적용해서(먼저 발견되는 양식을 기준으로 함) 단어를 완성시킴
  
  # type: prevalent: Default. Takes the most frequent match as completion. // first: Takes the first found completion. // longest: Takes the longest completion in terms of characters.// none: Is the identity.// random:Takes some completion. // shortest: Takes the shortest completion in terms of characters.
  
  # 5. 나온 결과들을 paste함수로 모으고, 공백없이 처리함 붙이되, 공백(" ")이 나올경우 collapse(분리)함.
  # 6. stripWhitespace를 통해 여백(연속된 공백)을 제거해버림
  # 7. PlainTextDocument: 이렇게 나온 결과를 PlainTextDocument 데이터로 만듬.
  
  
my.corpus<- lapply(my.corpus,stemCompletion_mod,dict=dict.corpus)  # list인 자료에 stemCompletion_mod 로 정의한 함수를 각각 적용함.

inspect(dict.corpus)






my.corpus2 <- Corpus(VectorSource(my.corpus))  # PlainTextDocument였던 내용을 다시 원래대로 돌림.


inspect(my.corpus2)


#####################################################################
# (4) TDM(Term-Document Matrix) 생성하기


my.TDM <- TermDocumentMatrix(my.corpus2) # TDM을 만듬.

my.TDM


inspect(my.TDM[55:60,1:10])  # 처음 10개 메세지에서 55~60번째 단어의 분포 확인


# 분석에 의미가 있는 단어만을 TDM으로 정리하기


myDict <- c('bigdata','data','analyst','cloud','company','privacy','analytics','business','hadoop','datascience','warehouse')



my.TDM2 <- TermDocumentMatrix(my.corpus2, control=list(dictionary=myDict))  # 새로 생성한 Dictionary를 적용하여 TDM을 만듬.



inspect(my.TDM2)  # 결과 확인


dim(my.TDM2)

# 결과: 11, 1000 // 1000개(열)의 트위터 메세지에서, 11개의 단어(행)가 추출됨. (사실 데이터는 terms와 docs라는 이름의 list로 구성되어 있음)

inspect(my.corpus2[100])




#####################################################################
# (5) 분석 및 시각화

# 1) Association : 연관성 분석
# 연관분석: 어떤 사건이 동시에 일어나는지를 알아보는 것

# findAssocs 함수를 이용한 방법

findAssocs(my.TDM2,'datascience',0.01)  # datascience라는 단어와 연관성이 0.01이상인 단어들을 표시

# apriori 함수를 이용한 방법 
install.packages("arules")
library(arules)

# TDM은 arules 패키지의 apriori 함수를 이용한 연관분석을 위해, 단일 처리형(transaction)으로 변환함
# 이유: transactions class : 1과 0으로 이루어져 있는 데이터에서 0이 훨씬 많을 때(spase format - 희소 형태의 데이터). 
#       즉, 의미 없는 정보가 많고 크기가 커서 데이터를 처리하기 힘들 때 transactions class로 처리

terms.m<-as.matrix(my.TDM2)

terms.m

transaction_m <- as(terms.m, "transactions")

transaction_m

rules.all <- apriori(transaction_m, parameter=list(supp=0.3, conf=0.1))

# apriori알고리즘: 빈도와 신뢰도를 계산하여, 연관성분석
# 빈도를 나타내는 지지도(support)를 0.3로 설정함.
# 신뢰도를 나타내는 confidence를 0.1로 설정함.
# 출현빈도가 30%이상인 어떤 단어가, 출현했을 때, 다른 어떤 단어가 출현할 확률이 10%이상인 경우의 연관성을 분석함.


#inspect(rules.all)


class(rules.all)

is(rules.all)


inspect(rules.all[1])

#워드 클라우드 

library(wordcloud)



is(terms.m)

term.freq<-sort(rowSums(terms.m), decreasing = T)


term.freq



wordcloud(words = names(term.freq), freq = term.freq, min.freq = 1, random.order = F, colors = brewer.pal(8,'Dark2'))


