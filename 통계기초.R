rm(list=ls())

df<-read.csv(file.choose())


df$english

hist(df$english)


boxplot(df$english)


#상관

eng_mat<-read.csv(file.choose())

str(eng_mat)

cov(eng_mat$english, eng_mat$mathematics)
cor(eng_mat$english, eng_mat$mathematics)

plot(eng_mat$english, eng_mat$mathematics)



lm_model<-lm(eng_mat$mathematics ~ eng_mat$english)


lm_model

plot(eng_mat$english, eng_mat$mathematics, main = "영어와 수학 성적 인과  ")

?abline()

abline(lm_model)

df


plot(df$english, df$mathematics)

corplot




?runif

runif(100, 0, 5)

# Load the library
library("lattice")

# Dummy data

data <- matrix(runif(100, 0, 5) , 10 , 10)

data


colnames(data) <- letters[c(1:10)]

rownames(data) <- paste( rep("row",10) , c(1:10) , sep=" ")

# plot it flipping the axis
levelplot(data)








