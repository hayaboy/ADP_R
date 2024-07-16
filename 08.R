# p.202
# ������ ���̵��� ���� ���� Ŭ����
install.packages("wordcloud")
library(wordcloud)

word<- c("��õ������", "��ȭ��", "������")
frequency <- c(651, 85, 61)

wordcloud(word, frequency, colors="blue")

# p.203
# �ܾ���� �� ��ȯ
wordcloud(word, frequency, random.order=F, random.color=F, colors=rainbow(length(word)))

# p.204
# �پ��� �ܾ� �� ����� ���� �ȷ�Ʈ ��Ű���� Ȱ��
install.packages("RColorBrewer")
library(RColorBrewer)      

pal2 <- brewer.pal(8,"Dark2")

word <- c("��õ������", "��ȭ��", "������")
frequency <- c(651, 85, 61)
wordcloud(word, frequency, colors=pal2)

# p.211
# ������ �ε� �� ������ ���� ����
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")

data <- read.csv(file.choose(), header=T)
head(data)

# ������ ����: ���ʿ� ���� ����
# '����' ���� ���� 
data2 <- data[data$��������.�ñ���.�� != "����", ]
head(data2)

# p.212
# '���� ���� ���� ��� ����
x <- grep("��$", data2$��������.�ñ���.��)
data3 <- data2[-c(x), ]
head(data3)

# p.213
# ������ ����  ���� ����
data4 <- data3[data3$���̵�.��>0, ]
word <- data4$��������.�ñ���.��
frequency <- data4$���̵�.��
wordcloud(word, frequency, colors=pal2)

# ������ ���� ���� ����
data5 <- data3[data3$���̵�.��<0, ]
word <- data5$��������.�ñ���.��
frequency <- abs(data5$���̵�.��)
wordcloud(word, frequency, colors=pal2)

# p.219
# �������� �ܾ ���� ���� Ŭ���� �����
install.packages("KoNLP")  
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()  

pal2 <- brewer.pal(8,"Dark2")   

text <- readLines(file.choose())
text 

# p.220
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun

noun2 <- unlist(noun) 
noun2

# p.221
word_count <- table(noun2) 
word_count  

head(sort(word_count, decreasing=TRUE), 10)

wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

# p.222
# ������ �ܾ� �߰� �� ����� ������ ����
mergeUserDic(data.frame(c("��ġ"), c("ncn")))
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun) 

noun2 <- gsub("������", "", noun2)
noun2 <- gsub("�츮", "", noun2)
noun2 <- gsub("����", "", noun2)

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

# p.223
word_count <- table(noun2)
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

# ��� ����� �̹��� ����
setwd("/temp")  
png(filename = "speech.png", width = 480, height = 480)
# ���� ����̽� ���� 
dev.off()

# p.226
# �������� �ܾ ���� ���� Ŭ���� �����
text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun) 
word_count <- table(noun2) 
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

# ����� �ܾ��� ���� 
noun2 <- gsub("���ü�", "", noun2)
noun2 <- gsub("������", "", noun2)
noun2 <- gsub("�츮", "", noun2)

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

word_count <- table(noun2)
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

#######################