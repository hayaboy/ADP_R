
#R의 자료 구조

# l a m v s f 


#벡터 만드는 함수

?c


vec1<-c(1,2,3)

is(vec1)


vec2<-c("제주도","충북","강원도")

is(vec2)


data.frame(vec1,vec2)



# 리스트(짬뽕) 벡터의 구분

1:6

c(1:6,'a')


?list()  

#R에서는 인덱스가 1부터.....

li1<-list(1:6,'a')

li1[[1]]

li1[[2]]

li1[[1]][3]


## 텍스트 분석을 위한 R의 베이스 함수 

# 영어
#알파벳 출력

?letters


letters

LETTERS



#대소문자

tolower(LETTERS)

toupper(letters)

#문자 수 

nchar("hello")
nchar("안녕")


?nchar

nchar("hello", type = 'bytes')
nchar("안녕", type = 'bytes')


nchar("he llo", type = 'bytes')

nchar("안 녕", type = 'bytes')


#\t은 2개의 문자수가 아니라 1개의 문자수를 갖는다. 
nchar("hello\t", type = 'bytes')

nchar("hi
      hello")

nchar("hi\nhello")





#텍스트 분해


?strsplit()



mySentence<-'Learing R is so interesting'

is(mySentence)


li_txt<-strsplit(mySentence, split = ' ')


is(li_txt)


li_txt[[1]][1]


for (i in 1:5){
  print(i)
}

## 문제

#Learing R is so interesting를

#'L' 'e' ...
#'R'
#'i' 's'
#'s' 'o'
# 'i' 'n' ....

sent1<-'Learing R is so interesting'

#strsplit(sent1, split = ' ')


mywords<-strsplit(sent1, split = ' ')

mywords


myletters<-list(rep(NA,5))


for (i in 1:5){
  myletters[i]<- strsplit(mywords[[1]][i], split = '')
}

myletters[[1]]

?paste

paste(myletters[[1]], collapse='')

myletters<-list(rep(NA,5))

mywords2<-list(rep(NA,5))

myletters

for (i in 1:5){
  mywords2[i]<- paste(myletters[[i]], collapse = '')
}


mywords2

paste(mywords2, collapse = ' ')




R_wiki<-"R is a programming language and free software environment for statistical computing and graphics supported by the R Core Team and the R Foundation for Statistical Computing.[7] It is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, data mining surveys, and studies of scholarly literature databases show substantial increases in R's popularity;[8] since August 2021, R ranks 14th in the TIOBE index, a measure of popularity of programming languages.[9]

The official R software environment is a GNU package. It is written primarily in C, Fortran, and R itself (thus it is partially self-hosting) and is freely available under the GNU General Public License. Precompiled executables are provided for various operating systems. It has a command line interface, but multiple third-party graphical user interfaces are available, such as RStudio, an integrated development environment; and Jupyter, a notebook interface."


R_wiki

R_wiki_para<-strsplit(R_wiki, split = '\n')


R_wiki_para

#R은 마침표(.)를 자연어에서 사용하는 마침표로 인식하지 못함 , 콤마(,)와 괄호도 그렇다.
R_wiki_sent<-strsplit(R_wiki, split = '\\.')


R_wiki_sent



strsplit(R_wiki, split = ' ')






#정규 표현식

rm(list = ls())


mysentence<-'Learing R is so interesting'

#g : global 전체 영역 


#sub   : 교체

?regexpr() 

?grep # 특정 표현이 텍스트 데이터에서 등장하는지 확인




regexpr('ing', mysentence)

#텍스트 패턴이 어디에서 등장하며 어느 정도의 길이를 갖는지


#regexpr vs gregexpr (global)

gregexpr  #텍스트 데이터에서 등장하는지, 그리고 몇 번 등장하면 각각의 위치는 어딘지 


gregexpr('ing', mysentence)



gregexpr('software', mysentence)

#없을 경우 -1


sub('ing','ING', mysentence)

mysentence

gsub('ing','ING', mysentence)

install.packages("tm")



##전처리 연습1

mytext<-"The 45th President of the United States, Donald Trump, states that he knows how to play trump with the former president"





mytext2<-strsplit(mytext, split = ' ')

?table

table(mytext2)



stringr::str_replace()

is(mytext2)

mytext2<-str_replace(unlist(mytext2), "Trump", "Trump_unique" )

table(tolower(mytext2))




#대소문자 통합
#숫자 제거, 문장부호 및 특수문자 제거 -> tm

tm::removeNumbers()

tm::removePunctuation()



#불용어(stop word) 

tm::stopwords(kind = "en")


stopwords(kind = "en")
?stopwords


stopwords(kind = "SMART")





#어근 동일화(stemming)

# Porter's Stemmer

?str_replace_all

mystemmer.func <-function(mytextobject,mystemmer,mystemmed){
  mytext<-str_replace_all(mytext,"(\\bam )|(\\bare )|(\\bis )|(\\bwas )|(\\bwere )|(\\bbe )", "be ")
  mytext
}


is(mystemmer.func)


mytext <- c("I am a boy. You are a boy. He might be a boy.")

mytext.stem <- mystemmer.func(mytext)


mytext.stem

#어근 동일화이전과 이후의 텍스트 데이터의 단어들이 어떻게 다른 빈도표를 갖고 있는지 살펴보자. 

#빈도

table(str_split(mytext," "))
table(str_split(mytext.stem," "))




## tm 라이브러리 함수들을 이용해 텍스트 데이터 사전처리

#1. 말뭉치 구성

?tm::VCorpus()


?DirSource()


my.text.location<-"C:/ex/ymbaek_papers"

mypaper<-VCorpus(DirSource(my.text.location))


mypaper

is(mypaper)

summary(mypaper)

mypaper[1]
summary(mypaper[2])


mypaper[[1]]


mypaper[[1]]$meta

mypaper[[1]]$content


?meta

meta(mypaper[[2]], tag = 'author')<-'D.S. Kim'

mypaper[[2]]$meta


## 말뭉치 전처리

tm::removeNumbers()
tm::removePunctuation()
tm::stripWhitespace() #2개 이상 연이어 등장하는 공란을 1개의 공란으로 치환 
tm::removeWords() # 말뭉치에서 사전에 지정된 단어들을 삭제함
tm::stemDocument() # 어근 동일화 알고리즘 적용
tm::content_transformer() # 이용자가 지정한 함수를 적용
#예를 들어 content_transformer(tolower)를 사용하면 말뭉치의 모든 대문자를 소문자로 치환



#tm_map(말뭉치,removeNumbers )


##말뭉치 살펴볼 때의 가이드
#1 특수문자를 중심으로 연결된 단어들을 살펴봄
# co-exist와 같은 표현에서는 '-'를 제거해 하나의 단어로 처리하는 것이 합리적
#2 수치로 표시된 단어들을 살펴봄
#3 대문자로 시작하는 단어들의 목록을 살펴봄


library('KoNLP')







