# p.104
# �ܼ� ���� ��Ʈ
x <- c(9, 15, 20, 6)
label <- c("���� 1��", "���� 2��", "���� 3��", "���� 4��")
pie(x, labels=label, main="�μ��� ���� ����")

# p.105
# �ܼ� �� ��Ʈ
height <- c(9, 15, 20, 6)
name <- c("���� 1��", "���� 2��", "���� 3��", "���� 4��")
barplot(height, names.arg=name, main="�μ��� ������ ��", col=rainbow(length(height)), xlab="�μ�", ylab="���� ����(�� ��)")

# p.106
# ���� ���: ī��Ʈ �ٿ�
install.packages("animation")
library(animation)

ani.options(interval = 1)

for (i in 10:0) {
    plot.new()
    rect(0, 0, 1, 1, col="yellow")
    text(0.5, 0.5, i, cex=5, col=rgb(.2,.2,.2,.7))
    ani.pause()
}

# p.107
# �ܾ��Ȱ� ��ġ ���
install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages("ggmap")
library(ggplot2)
library(RgoogleMaps)
library(ggmap)

names <- c("1.������/����", "2.����/������", "3.���ξ�", "4.�ϼ���", "5.�߼���", "6.�󼱾�")
addr <- c("��û�ϵ� �ܾ籺 ������ ����� 644-33",
          "��û�ϵ� �ܾ籺 �ܼ��� ���Ƿ� 3827",
          "��û�ϵ� �ܾ籺 �밭�� ���ξ�2�� 42",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 1337",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 868-2",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 790")

# p.108
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen

map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc)
ggmap(map, fullpage = TRUE)

# p.110
# Ű����� �󵵼��� ���� ���� Ŭ���� ���
install.packages("wordcloud")
install.packages("RColorBrewer")
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
x <- c("����", "���ѱ���ȸ", "����")
y <- c(5, 4, 3)
wordcloud(x, y, colors=pal2)

# p.112
# ������ 5,000�� ���� �� Ƚ���� ���� �ո��� ������ Ȯ���� ��ȭ
iteration <- 5000
plot(0, 0, xlab="������ ���� Ƚ��", ylab="�ո��� ������ ����", xlim=c(0, iteration), ylim=c(0, 1))

abline(a=0.5, b=0, col="red")

sum <- 0

for(x in 1:iteration) {
    y <- sample(c("�ո�", "�޸�"), 1, replace=T)
    if ( y == "�ո�")
        sum = sum + 1
    prob <- sum / x
    points(x, prob)
}

#####################

  