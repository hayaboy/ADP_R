#군집 분석을 위한 유사성 척도
#1)군집 분석 유사성 청도(거리/상관계수)
#2)거리 척도를 사용한 유사성 계산 : 유클리디안 거리 계산법(L2 distance)


#계층형 군집
#벡터(1차원)
2:6
rep(5,4)
seq(2:7)
c

#matrix 2차원

length(c(140,50,120,55,78,80,95,85,95,90))

m<-matrix(c(140,50,120,55,78,80,95,85,95,90),nrow = 2,byrow = TRUE)

is(m)

class(m)

m2<-matrix(c(140,50,120,55,78,80,95,85,95,90),nrow = 5,byrow = TRUE)

m2

?dist

dist(m2)

dist(m2, method = 'manhattan')

?dist
dist(m2, method = 'minkowski',p=1)
dist(m2, method = 'manhattan')


dist(m2, method = 'minkowski',p=2)
dist(m2)

install.packages("DAAG")

library(DAAG)
?DAAG



?DAAG::wages1833


str(wages1833)

?na.omit()



View(wages1833)

dat<-wages1833

nrow(dat)

dat2<-na.omit(dat)

nrow(dat2)

distdat<-dist(dat2)


?hclust


hc_a<-hclust(distdat,method ="single" )

plot(hc_a,hang = -1,cex=0.7)


hc_complete<-hclust(distdat,method = "complete")
hc_complete
plot(hc_complete, hang = -1,cex=0.7)

hc_average<-hclust(distdat,method = "average")
hc_average
plot(hc_average, hang = -1,cex=0.7)


hc_centroid<-hclust(distdat,method = "centroid")
hc_centroid
plot(hc_centroid, hang = -1,cex=0.7)


hc_ward<-hclust(distdat,method = "ward.D2")
hc_ward
plot(hc_ward, hang = -1,cex=0.7)


?rect.hclust()

rect.hclust(hc_ward,k=5)




#비계층형 군집
wages_data<-DAAG::wages1833
wage_data<-na.omit(wage_data)
#최적의 K를 구하기 위해서 "factoextra"를 설치

#1)K-means 알고리즘
install.packages("factoextra")

?fviz_nbclust
?kmeans()
fviz_nbclust(wages_data,kmeans,method = "wss" )

set.seed(200)

kmeans(wages_data, 3, nstart = 25)


nstart	
#if centers is a number, how many random sets should be chosen?
#The kmeans() function has an nstart option that attempts multiple initial configurations and reports on the best one. For example, adding nstart=25 will generate 25 initial configurations. This approach is often recommended

km<-kmeans(wages_data,3,nstart = 25)


?fviz_cluster
fviz_cluster(km,data = wages_data,ellipse.type = "convex",repel = TRUE)




#2)K-medoids 알고리즘

#군집 내에서 다른 객체들과의 거리가 최소가 되도록 하는 방법으로 PAM과 CLARA 알고리즘이 있다.
#객체가 속한 군집의 대표 객체와의 거리 합을 최소로 하는 방법이다.

#2-1) PAM(Partitioning  Around Medoids) : 중앙점(medoid)을 사용해서 N개의 모든 데이터를 최종 K개의 군집으로 군집화 시키는 방법 
#임의로 K개의 관측치를 중앙점으로 할당하고 모든 관측치에서 중앙점까지 거리의 총합이 최소화 될때 까지 중앙점을 할당한다.
#총합을 계산하기 때문에 큰 데이터에서는 성능이 떨어질 수 있다.

#2-2) CLARA(Clustering LARge Application): 모든 객체를 대상으로 하지 않고 객체 중에 일부만 대표 값으로 해서 군집화하다. 
#샘플링을 수행하고 PAM 알고리즘을 사용해서 대표 객체를 산정한다.

cluster::pam()

?pam

pam_out<-pam(wages_data,3)

?table

table(pam_out$clustering)

fviz_cluster(pam_out,data=wage_data,ellipse.type = "convex",repel = FALSE)


#3)SOM(Self Organizing Map, 자기 조직화 지도, 코호넨 맵)
#군집 분석시에 신경망 분석을 수행하는 방법, 거리값은 유클리드 거리 수식을 사용
#신경망과 K-means 기법의 특징을 모두 가지고 있다. 





