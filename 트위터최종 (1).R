rm(list = ls())


install.packages("tm")
library(tm)

############################### 데이터 수집############################################

install.packages("twitteR")
#twitteR 패키지 불러오기

#본인 인증키 입력
api_key<-"NhG42AeoZTMkT0RwEnSQWtCxu"
api_secret<-"naXKGlThfS6VV1oVFbi1lutfjVTYS1rAj4UKUEnF9tGpueHKsl"
access_token<-"2795354162-CMDJYEF1W98dE0ctvhYlMJohP0XItH9131eOMhX"
access_token_secret<-"im1qeKpzlcEI12SCiZQQf5fJIIQrpx9tELUY8DnG0pXLZ"
?setup_twitter_oauth
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
keyword<-'bigdata'
?searchTwitter
#bigdata.tw<-searchTwitter(keyword, since='2014-01-01', n=10000, lang = 'en')

bigdata.tw<-searchTwitter(keyword, since='2014-01-01', n=1000, lang = 'en')




str(bigdata.tw)
is(bigdata.tw)
class(bigdata.tw)
bigdata.tw[1:3]
bigdata.tw[1:200]
tweet<-bigdata.tw[[1]]
tweet$getScreenName()
#getScreenName 정보를 가져온다. 해당 메시지를 작성한 사람의 이름을 볼 수 있다.
tweet$getText()
#list list 형태로 되어 있는 bigdata.tw를 data.frame 형태로 변환하여 저장텍스트만 추출해서 저장

class(bigdata.tw)
bigdata.df<-twListToDF(bigdata.tw)
class(bigdata.df)
bigdata.text<-bigdata.df$text

View(bigdata.text)


############################### 데이터 전처리  및 가공############################################


#1) Corpus(텍스트 문서의 집합) 생성
# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태



# Corpus는 저장장소를 표시하는  DirSource, VectorSource, DataframeSource처럼 디렉토리, 각 벡터값, 
# csv  파일 같은 데이터 프레임을 통해 읽어들여 생성된다.



my.corpus<-Corpus(VectorSource(bigdata.text))
#현재 만들어진 object인 bigdata.text는 트위터 메시지에서 text 부분만 추출한 벡터 형식
#VectorSource를 사용

is(my.corpus)


my.corpus[[1]]


#문서 내용을 보는 방법은 inspect()함수를 통해서 array를 지정해서 선택해 볼 수있다.



inspect(my.corpus[1:2])

#tm 패키지 내에는 Corpus의 형식을 가지는 데이터들의 변형을 위한 tm_map()이라는 함수가 있다.
# 이 함수를 사용하면 Corpus() 형식의 데이터에 일반적인 함수를 적용해서 전처리 등의 가공을 할 수 있다.


#빈공간(white space) 제거 
my.corpus<-tm_map(my.corpus, stripWhitespace)


#대부분의 경우 중간에 빈 공간이 있으면 "\n"으로 변경되어서 
# 분석할 때 걸림돌이 될 수 있으므로, 반드시 처리하고 진행하여야 한다.
inspect(my.corpus)

my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='@\\S*', replacement='')


#@\\S*   @뒤에 띄어쓰기 없이 붙어있는 단어를 제거하라

# @로 연결된 ID 부분이 모두 제거



inspect(my.corpus)



my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='http\\S*', replacement='')

#http로 시작되는 부분 제거


inspect(my.corpus)


#문장 부호 및 구두점 제거(removePunctuation)

# #, , ?, !, ~, @, $, &, %, 마침표(.), 쉼표(,) 등의 문장 부호 제거


my.corpus<-tm_map(my.corpus, removePunctuation)


inspect(my.corpus)


my.corpus<-tm_map(my.corpus, content_transformer(tolower))

inspect(my.corpus)



#tm 패키지에는 stop words라는 것이 있다. 한글에서는 조사에 해당되면 띄어쓰기
# 등을 통해 확인 할 수 있다. 영어의 갱우 기본적으로 174개의 제외어(stop word)를 가지고 있다.


stopwords('en')


my.corpus<-tm_map(my.corpus, removeWords, stopwords('en'))
# 영어의 기본 제외어(stop word)에 해당되는 174개의 단어들은 제거


inspect(my.corpus)

is(stopwords('en'))


mystopwords<-c(stopwords('en'),'rt','via','even')

#만약에 기본적인 제외어(stop words)이외에 분석에 있어 의미가
#없다고 생각되는 단어는 벡터를 만들어 함께 제외한다.

my.corpus<-tm_map(my.corpus, removeWords, mystopwords)


inspect(my.corpus)

############################### 자연어 처리############################################



# 텍스트 마이닝 시 자연어 처리는 기본적으로 형태소 분석을 하는 과정을 포함
#영문의 경우 제외어를 처리하는 과정에서 접속사, 대명사 제거하고, 공통 어간을
#가지는 단어를 묶기 위해 stemming하여 처리한다.



# 1) stemmimg

# tm 패키지에서는 stemming을 하고자 할 때 사용하는 함수에는
# stemDocument와 stemCompletion이 있다.


test<-stemDocument(c('updated', 'update', 'updating'))



test<-stemCompletion(test, dictionary = c('updated', 'update', 'updating'))

test
# stemCompletion은 stemming된 단어와 완성을 위한 dictionary를 함께 넣으면 가장 기본적인
# 어휘로 완성시켜주는 역할을 한다.stemCompletion은 반드시 dictionary가 필요하다.


#스테밍을 하기전에 stemCompletion에서 사용될 dictionary를 위해 현재의 Corpus 파일을
# dict.corpus에 저장한다.

dict.corpus<-my.corpus

my.corpus<-tm_map(my.corpus, stemDocument)
# stemDocument 하기 전과 비교하면 어간이 추출된 것을 확인 할 수 있다.

is(my.corpus)
inspect(my.corpus)


# stemCompletion을 할 때 잘 못 하면 모든 값이 NA 가 되어 버리는 경우가 있어 
#이를 방지하기 위해 completion을 위해 간단하게 제작된 함수를 실행



?paste


stemCompletion_mod<-function(x, dict){
  
  PlainTextDocument(stripWhitespace(paste(stemCompletion(unlist(strsplit(as.character(x), " ")), dictionary = dict, type='first'), sep="", collapse = " ")))
  
}


#type을 first로 지정해주어 등장하는 첫 번째 어휘로 어간이 같은 모든 단어를 사용하도록 설정



my.corpus<-lapply(my.corpus, stemCompletion_mod, dict=dict.corpus)




############################### TDM(Term Document Matrix) 구축 ############################################


#행은 각 단어를 나타내고, 열은 트위터 메시지를 나타내는 매트릭스가 생성된다.

?TermDocumentMatrix




inspect(my.corpus)



is(my.corpus)



my.corpus<-Corpus(VectorSource(my.corpus))

is(my.corpus)



inspect(my.corpus[1:2])



my.TDM<-TermDocumentMatrix(my.corpus)
dim(my.TDM)
#단어가 2819개 추출되어 2819개의 행과 1000개의 열




inspect(my.TDM[55:60, 1:10])
# 처음 10개의 메시지의 55번째에서 60번째 단어의 분포 확인 

# TDM 구축

#TermDocumentMatrix()함수 : 행은 각 단어, 열은 트위터 메시지를 나타내는 매트릭스


# 단어 사전
#단어 사전은 복수의 문자들의 집합으로 텍스트 마이닝에서 분석에 사용하고자 하는 단어들의 집합

myDict<-c('bigdata', 'data','analyst','cloud','company','privacy','analytics','business','hadoop','datascience')

my.TDM<-TermDocumentMatrix(my.corpus, control=list(dictionary=myDict))



inspect(my.TDM)

findAssocs(my.TDM, 'datascience', 0.01)

# findAssocs 함수를 통해 my.TDM에서 datascienc와 연관성이 0.01이상인 단어 표시


#연관분석



# 연관분석을 수행하는  대표적인 알고리즘으로는 apriori와 FP(frequent-pattern)-성장이 있다.

# apriori알고리즘에서 연관 분석을 수행하기 위해 빈발 아이템 집합과 연과 규칙이라고 하는 
# 두가지 형태로 관계를 표현



#연관분석을 하기 위해서는 단일 처리형(transaction)으로 변환


transaction_m<-as(as.matrix(my.TDM), "transactions")




rulles.all<-apriori(transaction_m, parameter = list(supp=0.01,conf=0.5))




my.TDM.m<-as.matrix(my.TDM)


term.freq<-sort(rowSums(my.TDM.m),decreasing=T)





wordcloud(words=names(term.freq), freq = term.freq, min.freq = 15,random.order = F,colors = brewer.pal(8,'Dark2'))







