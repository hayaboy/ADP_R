# p.59
# ���� �����
x <- c(80, 85, 70)
x

c(80, 85, 70) -> x
x

# p.60
# ���� ���Ұ� �ϳ��� ��
x <- c(80)
x

x <- 80
x

# p.62
# �������
x <- 5+2
x

x <- 5/3
x

x <- 5^2
x

x <- 5%%3
x

x <- 5%/%3
x

# p.63
# ������ ��Ģ���� 
x <- c(1, 2, 3, 4) # 4�� ����
y <- c(2, 3, 4, 5) # 4�� ����
z <- c(1, 2)       # 2�� ����

w <- x+y
w

w <- x+5
w

w <- y/2
w

w <- x+z
w

w <- x/z
w

# p.64
w <- z/x
w

# ���� �ٸ� ������ ������ ����
x <- c(1, 2, 3)
x

y <- c("A", "B", "c")
y

y <- c("A", 1, 2)
y

z <- y + 1

# p.65
# �� ������
x <- 5 < 3
x 

y <- c(10, 20, 30)
z <- y <= 10
z

# p.66
# ���� ������
x <- TRUE
y <- FALSE
x | y

x & y

# p.67
x <- 3
!x

isTRUE(y)

z <- c(TRUE, FALSE, FALSE)
z | y

# �������� ������ ���� �����
x <- seq(1, 10)
x

x <- 1:10
x

# p.68
x <- seq(10, 1)
x

y <- 10:1
y

x <- seq(1, 10, by=3)
x

y <- seq(1, 10, length.out=5)
y

# p.69
# �ݺ����� ������ ���� �����
x <- c(1, 2, 3)
rep(x, times=2)

rep(x, each=2)

# p.70
# ���� ��ġ�� ���� ���
x <- c(1, 2, 3, 4, 5)
x[2]

x[c(1, 3, 5)]

# p.71
x[-c(2, 4)]

# ���� ���� ���ǿ� ���� ���  
x[x > 2]

x[x >=2 & x <=4]

# ���� ���� ���� 
x[2] <- 20
x

x[c(3, 4)] <- 15
x

# p.72
x[x <= 15] <- 10
x

# ���Ϳ� ���� �Լ��� ���
x <- seq(1:10)
sum(x)

mean(x)

var(x)

sd(x)

# p.73
sqrt(x)

length(x)

x <- c(1, 2, -3)
abs(x)

# NULL, NA(not available), NaN(not a number)
x <- NULL
is.null(x)

y <- c(1, 2, 3, NA, 5)
y

# p.74
z <- 10/0
z

w <- 0/0
w

# p75
# 1���� �迭
x <- array(1:3, dim=c(3))
x

# p.76
# 2���� �迭 �����
x <- array(1:6, dim=c(2, 3))
x

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3))
x

# 2���� �迭�� ��� �� ����� ����
x[1, 3]

x[, 3]

x[,-3]

# p.77
x[1, 2] <- 20
x

# 2���� �迭�� ��� �� �̸� �߰�
names <- list(c("1��", "2��"), c("1��", "2��", "3��"))

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3), dimnames=names)
x

x["1��", ]

# p.78
# 3���� �迭
x <- array(1:24, dim=c(2, 3, 4))
x

## p.79
# ��� �����
x <- matrix(1:6, nrow=2)
x

x <- matrix(1:6, nrow=2, byrow=TRUE)
x

x[1, 3]

# ��� �� �̸� �ֱ�
names <- list(c("1��", "2��"), c("1��", "2��", "3��"))

matrix(1:6, nrow=2, byrow=TRUE, dimnames=names)

# p.80
# ���� ���տ� ���� ��� �����
v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)
x <- cbind(v1, v2, v3)
x

# p.81
# ��� �� �̸� �ֱ�
rownames(x) <- c("1��", "2��", "3��", "4��")
x

colnames(x) <- c("1��", "2��", "3��")
x

rbind(v1, v2, v3)

# p.82
# ����Ʈ �����
x <- list("ȫ�浿", "2016001", 20, c("IT����", "������ ����"))
x

# p.83
y <- list("����"="ȫ�浿", "�й�"="2016001", "����"=20, "��������"=c("IT����",
"������ ����"))
y

# ����Ʈ�� ���� ���
y["����"]

y[["����"]]

y$����

# p.85
# �� ���� ���� ������ ���� ������ ������ �����
x <- data.frame(����=c("ȫ�浿", "�տ���"), ����=c(20, 30), �ּ�=c("����", "�λ�"))
x

# ������ ���
x <- data.frame("����"=c("ȫ�浿", "�տ���"), "����"=c(20, 30), "�ּ�"=c("����", "�λ�"))

# p.86
# ���� �� ���� �߰�
x <- cbind(x, �а�=c("������", "�濵��"))
x

x <- rbind(x, data.frame(����="�����", ����=25, �ּ�="�ĸ�", �а�="������"))
x

# ��� �� ����
x[3, 2]

x[3,]

x[, 2]

# p.87
x[-2,]

x["�а�"]

x$�а�

x[["�а�"]]

x[[4]]

x[[4]][2]

x[1, 2] <- 21
x

# p.88
# ��� �� ����
x[1, "����"] <- 22
x


# ������ �������� factor ������ ����
str(x)
x[3] <- lapply(x[3], as.character)
str(x)

# 'ȫ3'�� 'ȫ5'�� ����
x[3, 3] <- "����"
x

# p.90
# ������ ��Ʈ ��� ����
library(help=datasets)

# p.94
quakes

head(quakes, n=10)

# p.95
tail(quakes, n=6)

# ������ ��Ʈ ���� ����
names(quakes)

str(quakes)

dim(quakes)

# p.96
# ������ ��Ʈ ��� ����
summary(quakes)

summary(quakes$mag)

# p.97
# ������ ��Ʈ �����ϰ� �б�
write.table(quakes, "c:/temp/quakes.txt", sep=",")

x <- read.csv("c:/temp/quakes.txt", header=T)
x

x <- read.csv(file.choose(), header=T)
x

# p.100
# ������Ʈ�� ������ ���� �б�
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/
Titanic.csv"
x <- read.csv(url)
x

# p.101
# ���� ������ ���ϴ� �Լ��� ���ǿ� ȣ��
getCircleArea <- function(r) {
    area <- 3.14 * r^2
    return(area)
}

getCircleArea(3)

#####################