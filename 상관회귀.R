
rm(list =ls() )


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

summary(model)

abline(model, col = "blue", lwd = 2)


print(df$english)
print(df$mathematics)


# 회귀 모델의 예측값 계산
predicted_math <- 0.62142 * df$english + 42.60132

# 수학 성적의 평균 계산
mean_math <- mean(df$mathematics)

# SST 계산
SST <- sum((df$mathematics - mean_math)^2)

# SSR 계산
SSR <- sum((df$mathematics - predicted_math)^2)

# R-squared 계산
R_squared <- 1 - (SSR / SST)

# 결과 출력
cat("SST:", SST, "\n")
cat("SSR:", SSR, "\n")
cat("R-squared:", R_squared, "\n")




