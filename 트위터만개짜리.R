install.packages("twitteR")
#twitteR 패키지 불러오기

#본인 인증키 입력
api_key<-"ggryaGc2gb5K6h0uW2uhSn79C"
api_secret<-"lKXxbyhLef8tq9jclMzUkhGVAO2b7yFaAZnJvu09o6PGoXLTmO"
access_token<-"2795354162-pOaMWWotgtr6mYodLwbVBsHS1veXR0Ci0uAyL9k"
access_token_secret<-"zrACrIPTxrBNPAXiE0PRt28pqllebVIWPRD95eXVIvJnA"
?setup_twitter_oauth
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
keyword<-'bigdata'
?searchTwitter
bigdata.tw<-searchTwitter(keyword, since='2014-01-01', n=10000, lang = 'en')

str(bigdata.tw)
bigdata.tw[1:3]
bigdata.tw[1:50]
tweet<-bigdata.tw[[1]]
tweet$getScreenName()
#getScreenName 정보를 가져온다. 해당 메시지를 작성한 사람의 이름을 볼 수 있다.
tweet$getText()
#list list 형태로 되어 있는 bigdata.tw를 data.frame 형태로 변환하여 저장텍스트만 추출해서 저장

class(bigdata.tw)
bigdata.df<-twListToDF(bigdata.tw)
class(bigdata.df)
bigdata.text<-bigdata.df$text
bigdata.text



#데이터 전처리  및 가공

#1) Corpus(텍스트 문서의 집합) 생성
# 데이터마이닝의 절차 중 데이터의 정제, 통합, 선택, 변환의 과정을 거친 
#구조화된 단계로서 더 이상 추가적인 절차없이 데이터 마이닝 알고리즘 실험에서 활용될 수 있는 상태



# Corpus는 저장장소를 표시하는  DirSource, VectorSource, DataframeSource처럼 디렉토리, 각 벡터값, 
# csv  파일 같은 데이터 프레임을 통해 읽어들여 생성된다.



my.corpus<-Corpus(VectorSource(bigdata.text))
#현재 만들어진 object인 bigdata.text는 트위터 메시지에서 text 부분만 추출한 벡터 형식
#VectorSource를 사용

my.corpus


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


#@\\S*   @뒤에 띄어쓰기 없이 붙었는 단어를 제거하라


inspect(my.corpus)
