cereials<-read.csv(file.choose(),header = T)

mean(cereials$calories)
mean(cereials$rating)

cov(cereials$calories,cereials$rating)

cor(cereials$calories,cereials$rating)

cor(cereials)

str(cereials)

nrow(cereials)
length(cereials)
cor(cereials[,4:16])

df_cor<-as.data.frame(cor(cereials[,4:16]))

plot(df_cor)



var(cereials$calories)
var(cereials$rating)

#총변동은 두 변수의 분산의 합
var(cereials$calories) + var(cereials$rating)

379.6309 / 576.9572

# 칼로리가 총 변동 중 66%를 설명하고 있다는 것을 의미


#PCA
data.frame(cereials$calories,cereials$rating)

pcs<-prcomp(data.frame(cereials$calories,cereials$rating))



pcs


summary(pcs)

#회전 행렬, 원래자료를 두 개의 새로운 방향으로 투영하는데 사용되는 가중치를 제공


pcs$rotation

#Z1의 가중치는 (0.847, -0.532)
#Z2의 가중치는 (0.532, 0.847)


#Z1은 총 변동성의 86%를 설명하고, Z2는 나머지 약 14%를 설명하고 있다.



pcs$x

round(mean(cereials$calories),3)
round(mean(cereials$rating),3)
0.847*(70-106.88)+(-0.532)*(68.40-42.67)

mean(pcs$x[,1])

mean(pcs$x[,2])

var(pcs$x[,1]) +  var(pcs$x[,2])
var(cereials$calories) +  var(cereials$rating)

var(pcs$x[,1])

var(pcs$x[,2])


var(pcs$x[,1])/(var(pcs$x[,1]) +  var(pcs$x[,2]))

sum(is.na(cereials[,-c(1:3)]))

na.omit(cereials[,-c(1:3)])

pcs2<-prcomp(na.omit(cereials[,-c(1:3)]))

summary(pcs2)

#데이터의 정규화

?prcomp

pcs3<-prcomp(na.omit(cereials[,-c(1:3)]), scale. = TRUE)

summary(pcs3)


pcs2$rotation[,1:5]
pcs3$rotation[,1:5]



biplot(pcs3)



  