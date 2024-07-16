#다차원 척도법
#Multidimensional Scaling

# 여러 대상 간의 거리가 주어져 있을 때, 대상들을 동일한 상대적 거리를 가진 
# 실수 공간의 점들로 배치시키는 방법
# 주로 자료들의 상대적 관계를 이해하는 시각화 방법의 근간으로 주로 사용

# 

eurodist

str(eurodist)

loc<-cmdscale(eurodist)
#cmdscale 함수를 사용하여 각 도시의 상대적 위치를 도식화 할 수 있는
# X,Y 좌료를 계산하고 그래프로 표현
loc
x<-loc[,1]
y<-loc[,2]
plot(x,y, type="n", main="eurodist")
text(x,y, rownames(loc),cex=0.8)
abline(v=0,h=0)
#각 도시 사이의 거래를 포함하는 행렬 형태의 자료
text
?plot
