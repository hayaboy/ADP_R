# p.271
# API URL과 인증키 설정
remove(list=ls())
install.packages("RCurl")
install.packages("XML")
library(RCurl)
library(XML)

searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "8824f61BTpA8sx5VX1Ov"
Client_Secret <- "KdSzYF7Gjw"

# 블로그 검색 
query <- URLencode(iconv("겨울추천요리","euc-kr","UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=20", sep="")

doc <- getURL(url, 
              httpheader = c('Content-Type' = "application/xml",
                             'X-Naver-Client-Id' = Client_ID,
                             'X-Naver-Client-Secret' = Client_Secret))
doc
# p.272
# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
doc2
text <- xpathSApply(doc2, "//item/description", xmlValue) 
text

# p.274
# 워드 클라우드 만들기(8장 워드 클라우드 참조)
# install.packages("KoNLP")
# install.packages("RColorBrewer")
# install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)   
library(wordcloud)

useSejongDic() 

noun <- sapply(text, extractNoun, USE.NAMES=F)
noun   

# p.275
noun2 <- unlist(noun)  
noun2

# p.276
word_count <- table(noun2)   
word_count   

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)
noun2  

# p.277
noun2 <- gsub('\\d+', '', noun2)
noun2 <- gsub('<b>', '', noun2)
noun2 <- gsub('</b>', '', noun2)
noun2 <- gsub('&amp', '', noun2)
noun2 <- gsub('&lt', '', noun2)
noun2 <- gsub('&gt', '', noun2)
noun2 <- gsub('&quot;', '', noun2)
noun2 <- gsub('"', '', noun2)
noun2 <- gsub('\'', '', noun2)
noun2 <- gsub(' ', '', noun2)
noun2 <- gsub('-', '', noun2)
noun2

wordcount <- table(noun2)
head(sort(wordcount, decreasing=T), 30)

# p.278
palete <- brewer.pal(9,"Set1") 

wordcloud(names(wordcount), freq=wordcount, scale=c(5,0.25), rot.per=0.25, min.freq=1, random.order=F,  random.color=T, colors=palete)

##########################







