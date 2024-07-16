
install.packages("RCurl")
install.packages("XML")
library(RCurl)
library(XML)
rm(list = ls())
library(RCurl)
library(XML)
searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "vGn8Y00nzll5G6r1wQQq"
Client_Secret <- "n6FEmrwqPf"

query <- URLencode(iconv("인공지능","euc-kr","UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=100", sep="")
url
doc <- getURL(url, 
              httpheader = c('Content-Type' = "application/xml",
                             'X-Naver-Client-Id' = Client_ID,
                             'X-Naver-Client-Secret' = Client_Secret))

# p.272

doc2 <- htmlParse(doc, encoding="UTF-8")
doc2
text <- xpathSApply(doc2, "//item/description", xmlValue) 
text

# p.274

# install.packages("KoNLP")
# install.packages("RColorBrewer")
# install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)   
library(wordcloud)

useSejongDic() 

noun <- sapply(text, extractNoun, USE.NAMES=F)
noun   


noun2 <- unlist(noun)  
noun2


word_count <- table(noun2)   
word_count   

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)
noun2  


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


palete <- brewer.pal(9,"Set1") 

wordcloud(names(wordcount), freq=wordcount, scale=c(5,0.25), rot.per=0.25, min.freq=1, random.order=F,  random.color=T, colors=palete)


