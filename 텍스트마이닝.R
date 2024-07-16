library(tm)
install.packages("twitteR")
library(twitteR)


#본인 인증키 입력
api_key<-"NhG42AeoZTMkT0RwEnSQWtCxu"
api_secret<-"naXKGlThfS6VV1oVFbi1lutfjVTYS1rAj4UKUEnF9tGpueHKsl"
access_token<-"2795354162-CMDJYEF1W98dE0ctvhYlMJohP0XItH9131eOMhX"
access_token_secret<-"im1qeKpzlcEI12SCiZQQf5fJIIQrpx9tELUY8DnG0pXLZ"

?setup_twitter_oauth

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

keyword<-'bigdata'

?searchTwitter
bigdata.tw<-searchTwitter(keyword, since='2019-01-01', n=1000, lang = 'en')

class(bigdata.tw)
bigdata.tw[1]
str(bigdata.tw)



bigdata.tw[[1]]


tweet<-bigdata.tw[[1]]



tweet$getScreenName()


?twListToDF


bigdata.df<-twListToDF(bigdata.tw)


class(bigdata.df)


head(bigdata.df)

bigdata.text<-bigdata.df$text



View(bigdata.text)





############################### 데이터 전처리  및 가공############################################
#1) Corpus(텍스트 문서의 집합) 생성
# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태

?Corpus

my.corpus<-Corpus(VectorSource(bigdata.text))

class(my.corpus)


my.corpus[1]


inspect(my.corpus[1])



my.corpus<-tm_map(my.corpus, stripWhitespace)

inspect(my.corpus)


?tm_map

?content_transformer

?gsub

my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='@\\S*', replacement='')


inspect(my.corpus)



my.corpus<-tm_map(my.corpus, content_transformer(gsub), pattern='http\\S*', replacement='')



inspect(my.corpus)



#문장 부호 및 구두점 제거(removePunctuation)

# #, , ?, !, ~, @, $, &, %, 마침표(.), 쉼표(,) 등의 문장 부호 제거



?removePunctuation



my.corpus<-tm_map(my.corpus, removePunctuation)




inspect(my.corpus)



stopwords('en')




my.corpus<-tm_map(my.corpus, content_transformer(tolower))



inspect(my.corpus)




# 영어의 기본 제외어(stop word)에 해당되는 174개의 단어들은 제거

my.corpus<-tm_map(my.corpus, removeWords, stopwords('en'))



inspect(my.corpus)


#만약에 기본적인 제외어(stop words)이외에 분석에 있어 의미가
#없다고 생각되는 단어는 벡터를 만들어 함께 제외한다.

mystopwords<-c(stopwords('en'),'rt','via','even')


my.corpus<-tm_map(my.corpus, removeWords, mystopwords)




inspect(my.corpus)




############################### 자연어 처리############################################

install.packages("SnowballC")
library(SnowballC)

#https://cran.r-project.org/web/packages/SnowballC/index.html

# 텍스트 마이닝 시 자연어 처리는 기본적으로 형태소 분석을 하는 과정을 포함
#영문의 경우 제외어를 처리하는 과정에서 접속사, 대명사 제거하고, 공통 어간을
#가지는 단어를 묶기 위해 stemming하여 처리한다.

?stemDocument

stemDocument(c('updated', 'update', 'updating'))



inspect(my.corpus)


dict.corpus<-my.corpus



my.corpus<-tm_map(my.corpus, stemDocument)


inspect(my.corpus)



############################### TDM(Term Document Matrix) 구축 ############################################


#행은 각 단어를 나타내고, 열은 트위터 메시지를 나타내는 매트릭스가 생성된다.

?TermDocumentMatrix



my.TDM<-TermDocumentMatrix(my.corpus)

my.TDM

inspect(my.TDM)

dim(my.TDM)


inspect(my.TDM[55:60, 1:10])


#단어 사전은 복수의 문자들의 집합으로 텍스트 마이닝에서 분석에 사용하고자 하는 단어들의 집합



myDict<-c('bigdata', 'data','analyst','cloud','company','privacy','analytics','business','hadoop','datascience')


my.TDM<-TermDocumentMatrix(my.corpus, control=list(dictionary=myDict))




inspect(my.TDM)

?findAssocs


findAssocs(my.TDM, 'datascience', 0.01)


# 연관분석을 수행하는  대표적인 알고리즘으로는 apriori와 FP(frequent-pattern)-성장이 있다.

# apriori알고리즘에서 연관 분석을 수행하기 위해 빈발 아이템 집합과 연과 규칙이라고 하는 
# 두가지 형태로 관계를 표현




#연관분석을 하기 위해서는 단일 처리형(transaction)으로 변환



transaction_m<-as(as.matrix(my.TDM), "transactions")



class(transaction_m)

rulles.all<-apriori(transaction_m, parameter = list(supp=0.2,conf=0.5))


rulles.all
