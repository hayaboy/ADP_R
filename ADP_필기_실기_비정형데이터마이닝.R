
##비정형 데이터 마이닝

#텍스트마이닝


#1.텍스트마이닝의 기능


#문서 요약, 문서 분류, 문서 군집, 특성 추출



rm(list=ls())

install.packages("twitteR")

library(twitteR)

#####################################################################
# (1) 트위터에 접속해서 자료 가져오기

api_key<-"tUEJMyiUl43fiDdItpxDId3xf"

api_secret<-'SuulRr5J959vUWttPuORiCCgjuDjbSAIKRiIWyq1PExTYTc5p1'

access_token<-'2795354162-o8nZZ5Qpbn7Ln3F9mBrp6IhnlnhWb5JXbyjGCc8'

access_token_secret<-'LKENgOz7fIddjItmJ4M2isWtwYtGhTXSJzuqnYQseutLM'


?twitteR::setup_twitter_oauth()

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)  # 1 yes를 선택함.

keyword<- 'bigdata'


?twitteR::searchTwitter()

bigdata.tw<- searchTwitter(keyword, since='2014-01-01', n=1000, lang = 'en')


is(bigdata.tw)


tweet1<-bigdata.tw[[1]]


is(tweet1)

tweet1$created

tweet1$favoriteCount

tweet1$favorited



tweet1$id


tweet1$isRetweet


tweet1$latitude

tweet1$replyToSID

tweet1$text

tweet1$screenName


is(tweet1$getText())




class(bigdata.tw)



twitteR::twListToDF()


bigdata.df<-twListToDF(bigdata.tw)



class(bigdata.df)

bigdata.df[1,1]


bigdata.df

View(bigdata.df)

bigdata.text<-bigdata.df$text



head(bigdata.text)


class(bigdata.text)

#####################################################################
# (2) 데이터 전처리  및 가공

#1) Corpus(텍스트 문서의 집합) 생성

# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태


# Corpus는 저장장소를 표시하는  DirSource, VectorSource, DataframeSource처럼 디렉토리, 각 벡터값


is(bigdata.text)


library(tm)

my.corpus<-Corpus(VectorSource(bigdata.text))


inspect(my.corpus[[1]])


inspect(my.corpus[[2]])

# tm패키지 내에서는 Corpus의 형식을 가지는 데이터들의 변형을 위한 tm_map() 함수가 존재


inspect(my.corpus[1:10])


?stripWhitespace
?tm_map

# 이 함수를 통해, Corpus() 형식의 데이터에 일반적인 함수를 적용해서 가공할 수 있음.


class(inspect(my.corpus[[1]]))


my.corpus[[1]]

nchar(my.corpus)

my.corpus<-tm_map(my.corpus, stripWhitespace)  # 대부분의 경우 빈 공간이 있으면 "\n"으로 변경되어 있음. 분석할 때 걸림돌이 되므로, 반드시 처리하고 진행해야함.


inspect(my.corpus[[1]])
# @\\S* @뒤에 띄어쓰기 없이 붙어 있는 단어를 제거한다. (s는 공백임. 대문자S는 반대)

#gsub

?content_transformer

#tm_map for an interface to apply transformations to corpora

?tm_map



my.corpus<-tm_map(my.corpus,content_transformer(gsub), pattern='@\\S*', replacement='' )

inspect(my.corpus[[1]])

getTransformations()

#위에 나온 5개의 함수를 제외한 함수들은 content_transformer 사용해서 함


my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='http\\S*', replacement='')


inspect(my.corpus[[1]])

#Punctuation  (#, ···, ? , ! , ~ , @ , $, &, % , .  ,)

my.corpus<-tm_map(my.corpus, removePunctuation)

inspect(my.corpus[[1]])



# 영문의 경우 소문자 변경시 오류 발생하므로 미리 처리 한 후 진행


my.corpus<-tm_map(my.corpus, content_transformer(tolower))

inspect(my.corpus[[1]])

stopwords('en')

my.corpus<-tm_map(my.corpus, removeWords, stopwords('en'))


inspect(my.corpus[[1]])

# 불용어 리스트에서 사용자가 별도로 더 추가하여 변수를 생성한다음 그걸 제거할 수 도 있음.
mystopword <- c(stopwords('en'), 'rt','via','even')


tail(mystopword)

my.corpus<-tm_map(my.corpus, removeWords, mystopword)




inspect(my.corpus[[1]])

#(3) 자연어처리 (형태소분석stemming)


?tm::stemDocument()


# updated   update  updating

test1<-stemDocument(c('updated',   'update',  'updating'))


?tm::stemCompletion()  #dictionary	 A Corpus or character vector to be searched for possible completions


stemCompletion(test1, dictionary = c('updated',   'update',  'updating'))




data("crude")

?crude


inspect(crude[[1]])

?stemCompletion

stemCompletion(c('be','is',   'am',  'are'), crude)

stemCompletion(c("compan", "entit", "suppl"), crude)


# stemDocument와 stemCompletion 과정이 있음. 
# stemDocument: 앞 어간을 제외한 나머지 부분을 잘라버림.(이 과정을 stemming이라 함.)  ex) updated, update, updating -> updat


# stemCompletion: stemming된 단어와 완성을 위한 dictionary를 여기에 넣으면 가장 기본적인 어휘로 완성시켜줌, 즉 그냥 처리했으면 각각 1개씩 집계되었을 updated, update, updating이 3건의 update로 모이게 됨.

inspect(my.corpus[[1]])

my.corpus<-tm_map(my.corpus, stemDocument)  # 어간만 남김



inspect(my.corpus[[1]])

# stemCompletion을 할 때 잘못하면 모든 값이 NA가 되버리는 경우가 있어 이를 방지하기 위해, 몇 단계가 추가된 함수를 새롭게 정의함.

stemCompletion_mod <- function(x,dict){
  PlainTextDocument(stripWhitespace(paste(stemCompletion(unlist(strsplit(as.character(x)," ")),dictionary=dict,type='first'),sep="",collapse=" ")))
} 

# 1. as.character: 입력된 데이터를 character형으로 바꾸고,
# 2. strsplit: character정보를 " " 한칸 띄어쓰기에 맞춰 분리시켜 리스트로 만듬.
# 3. unlist: 그걸 unlist시켜서 벡터로 만듬
# 4. 이내용을 stemCompletion을 이용해서, 매개변수로 들어오는 dictionary와 first타입을 적용해서(먼저 발견되는 양식을 기준으로 함) 단어를 완성시킴.
# type: prevalent: Default. Takes the most frequent match as completion. // first: Takes the first found completion. // longest: Takes the longest completion in terms of characters.// none: Is the identity.// random:Takes some completion. // shortest: Takes the shortest completion in terms of characters.
# 5. 나온 결과들을 paste함수로 모으고, 공백없이 처리함 붙이되, 공백(" ")이 나올경우 collapse(분리)함.
# 6. stripWhitespace를 통해 여백(연속된 공백)을 제거해버림
# 7. PlainTextDocument: 이렇게 나온 결과를 PlainTextDocument 데이터로 만듬.


dict.corpus<-my.corpus


my.corpus<- lapply(my.corpus, stemCompletion_mod, dict.corpus)

inspect(my.corpus[[1]])

#TDM 구축

my.TDM<-TermDocumentMatrix(my.corpus)
dim(my.TDM)

inspect(my.TDM[55:60, 1:10])

#단어 사전

myDict<-c("bigdata","data", "analyst","cloud","company","privacy","analytics","business","hadoop","datascience")
my.TDM<-TermDocumentMatrix(my.corpus,control = list(dictionaty=myDict))
inspect(my.TDM[,60:70])


#분석 및 시각화

findAssocs(my.TDM,'data',0.3)

#워드클라우드

install.packages("wordcloud")

library(wordcloud)

my.TDM.m<-as.matrix(my.TDM)

term.freq<-sort(rowSums(my.TDM.m), decreasing = T)
head(term.freq, 15)
wordcloud(words = names(term.freq), freq = term.freq,min.freq = 15, random.order = F, colors = brewer.pal(8,"Dark2"))

