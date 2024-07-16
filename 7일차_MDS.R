#다차원 척도법(Multidimensional Scaling,MDS)

#여러 대상간의 거리가 주어져 있을 때, 대상들을 동일한 상대적 거리를 가진
#실수공간의 점들로 배치시키는 방법
#주로 자료들의 상대적 관계를 이해하는데 시각화 방법의 근간으로 사용됩니다.

data("eurodist")

str(eurodist)

class(eurodist)

eurodist

loc<-cmdscale(eurodist)

class(loc)


x<-loc[,1]
y<-loc[,2]

?plot
plot(x,y, type = "n", main = "eurodist")
text(x,y,row.names(loc),cex = 0.8)
abline(v=0,h=0)
