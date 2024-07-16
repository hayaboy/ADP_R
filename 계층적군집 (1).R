# H-Clustering 

a<-1:8
a

dim(a) <-c(2,4)
a

class(a)

matrix(1:8, nrow=2, ncol=4, byrow=T)

d<-matrix(c(0,1,11,5,8,
            1,0,2,3,4,
            11,2,0,4,5,
            5,3,4,0,6,
            7,5,6,12,0), nrow=5, ncol=5)
d

d<-as.dist(d) #거리 행렬 만들기 as.dist함수
d

hclust(d, method="single") #single linkage 최단연결법

plot(hclust(d, method="single"))
plot(hclust(d, method="complete")) # complete linkage 최장(완전)연결법
plot(hclust(d, method="average")) # average linkage 평균연결법
plot(hclust(d, method="centroid")) # centroid 중심 연결법
plot(hclust(d, method="ward.D2")) # Ward linkage 와드연결

# 평균 연결법 : 모든 항목에 대한 거리 평균을 구하면서 군집하는 연결법
#               계산량이 불필요하게 많아짐

# 중심 연결법 : 두 군집의 중심간의 거리를 측정한다. 두군집이 결합할 때 새로운
#               군집의 평균을 이용해서 중심을 구하고, 그중심과 또다른 군집의 중심
#               사이의 거리를 측정하여 최소거리를 찾아 군집을 이룬다.

# 와드 연결법 : 군집 내의 오차제곱합에 기초하여 군집을 수해






