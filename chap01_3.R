rm(list = ls())
#영화 기생충_review.txt 데이터를 읽어온 뒤 숫자, 특수 문자 등을 제거하는 전처리 작업을 시행

?read.table



install.packages("tm")
library(tm)

?tm::removePunctuation()

?tm::VCorpus()

?tm::Corpus()

#txt_matrix<-as.matrix(txt)
#txt_corpus<-Corpus(txt_matrix)

is(txt)

str(txt)

txt_vector<-as.vector(txt)

txt<-DirSource("C:/ex/r/gisangReview.txt")


txt_corpus<-VectorSource(txt_vector)

?tm_map

txt_corpus2<-SimpleCorpus(txt_corpus)

txt_corpus

txt2<-tm_map(txt_corpus2, removePunctuation)

tm::removeNumbers()

txt3<-tm_map(txt2, removeNumbers)

txt3


inspect(txt3)














###################################################################
install.packages("Rtools")

install.packages("rJava")
library(rJava)
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk1.8.0_271")
install.packages("KoNLP","wordcloud")


install.packages('devtools')
devtools::install_github('haven-jeon/KoNLP')

library(Rtools)


library(KoNLP)

install.packages("remotes")

library(remotes)

remotes::install_github('haven-jeon/KoNLP')
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

install.packages("https://cran.r-project.org/src/contrib/Archive/KoNLP/KoNLP_0.80.2.tar.gz", repos = NULL, type="source", INSTALL_opts = c('--no-lock'))
library('KoNLP')

#영화기생충_review.txt을 사전에 등록하시오

library(KoNLP)



#영화기생충_사전.txt를 단어 사전으로 하는 TDM을 구축하고 빈도를 파악하고 시각화
gi_dic<-read.csv(file="C:/ex/r/gisang_dic.txt",header = FALSE)



tm::TermDocumentMatrix()


?TermDocumentMatrix()


gi_tdm<-as.TermDocumentMatrix(gi_dic, weightTf)

is(gi_tdm)

frequency(gi_dic)


hist(table(gi_dic))



tm::ext


#extractNoun으로 명사를 추출하여 워드 클라우드를 그리고 특성을 파악













