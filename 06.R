# p.159
# ���� ���: ī��Ʈ �ٿ�
install.packages("animation")
library(animation)
ani.options(interval = 1)
 
plot.new()
for (i in 10:0) {
    rect(0, 0, 1, 1, col="yellow")
    size = 11-i
    text(0.5, 0.5, i, cex=size, col=rgb(0,0,1,1)) 
    ani.pause()
}

# p.165
# 1�� �������� �׷��� �׸���
library(animation)
ani.options(interval = 1)
while(TRUE) {
    y <- runif(5, 0, 1)
    barplot(y, ylim = c(0, 1), col=rainbow(5))
    ani.pause()
}

# p.168
# �������� ��
library(animation)
library(png)
ani.options(interval = 0.1)
plot.new()
rect(0, 0, 1, 1, col="white")
for (i in 1:6) {
    img <- paste("C://temp/ball", i, ".png", sep="")
    img <- readPNG(img)
    rasterImage(img, 0, 0, 1, 1)
    ani.pause()
}
dev.off()

########################