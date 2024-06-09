eng <-c(42,	69,	56,	41,	57,	48,	65,	49,	65,	58)
math <-c(65,	80,	63,	63,	76,	60,	81,	66,	78,	82)

cov(eng, math)

cor(eng, math)

var(eng)
var(math)



plot(eng, math)

file_path <- file.choose()
df<-read.csv2(file_path, sep = ',')

as.vector(df[2])

str(df$english)

plot(df$english, df$mathematics)


# 회귀 모델 생성
model <- lm(df$mathematics ~ df$english)

model

abline(model, col = "blue", lwd = 2)


