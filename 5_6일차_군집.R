
#계층형 군집

data<-matrix(c(140,50,120,55,78,80,95,85,95,90), nrow = 5,ncol = 2, byrow = T) 

class(data)


?dist
dist(data)

sqrt((140-120)^2+(50-55)^2)
sqrt((140-78)^2+(50-80)^2)


dist(data, method = "manhattan")


abs(140 - 120) + abs(50-55)


#군집분석을 위한 패키지
install.packages("DAAG")
library(DAAG)
DAAG::wages1833

str(wages1833)
#age:나이, mnum: 남성 근로자 수, mwage:남성 근로자 평균 임금, fnum:여성 근로자 수, fwage:여성 근로자 평균 임금 



sum(is.na(wages1833))

#있을 경우, na.omit() 사용



#유클리드 거리 값 계산

distData<-dist(wages1833)

distData
View(distData)

?hclust()

#단일 연결법
hc_a<-hclust(distData, method = 'single')


plot(hc_a)

rect.hclust(hc_a, k = 3)

#완전 연결법(최장거리)

?hclust

hc_b<-hclust(distData, method = 'complete')

plot(hc_b)


#평균 연결법
?hclust
hc_c<-hclust(distData, method = 'average')

plot(hc_c)


#중심 연결법

hc_d<-hclust(distData, method = 'centroid')
plot(hc_d)

#워드 연결법

hc_e<-hclust(distData, method = 'ward.D2')
plot(hc_e)

rect.hclust(hc_e, k = 5)



#비계층형 군집(k-means)


#K-means 사례 첫번째

iris2<-iris[,1:4]

str(iris2)

km.out.withness<-c()
km.out.between<-c()


for (i in 2:7){ #군집수를 k=2~7까지 변화시켜가며 클러스터링 시행
set.seed(1)
km.out<-kmeans(iris2, centers=i) 
km.out.withness[i-1]<-km.out$tot.withinss #군집 내 제곱합 저장
km.out.between[i-1]<-km.out$betweenss #군집 간 제곱합 저장
}

71-49

152-78

data.frame(km.out.withness, km.out.between)

?kmeans

km.out.k3<-kmeans(iris2, centers=3 )

km.out.k3

km.out.k3$centers #각 클러스터의 중심점($centers)


km.out.k3$cluster #각 데이터 관측치의 클러스터 번호($cluster)


km.out.k3$size #각 클러스터의 데이터 관측치 수($size) 




table(km.out.k3$cluster, iris$Species) 



plot(iris2[,1:2], col=km.out.k3$cluster, pch=ifelse(km.out.k3$cluster==1, 16, ifelse(km.out.k3$cluster==2, 17,18)), cex=2) 


points(km.out.k3$centers, col=1:3, pch=16:18, cex=5)


#K-means 사례 두번째


library(DAAG)
wages1833

#최적의 K를 구하기 위해 "factoextra" 설치
install.packages("factoextra")
library(factoextra)

#wss는 그룹 내부의 합계제곱을 산출
#그래프에서 완만해지는 지점을 최적의 K 로 추정

factoextra::fviz_nbclust()



?fviz_nbclust
#Dertermining and Visualizing the Optimal Number of Clusters

fviz_nbclust(wages1833, kmeans, method="wss")

#k-means 알고리즘 실행(k=3)
set.seed(200)

str(wages1833)

?kmeans

km<-kmeans(wages1833, centers = 3, nstart =25 )

km


km2<-kmeans(wages1833, centers = 3, nstart =10 )
km2


km3<-kmeans(wages1833, centers = 3, nstart =50 )
km3

wages1833
?fviz_cluster
fviz_cluster(km, data = wages1833, ellipse.type = "convex", repel=T)



#K-평균 클러스터링 결과를 해석하고 결과 해석의 용이성 및 타당성을 판단한 뒤 결과가 
#타당하지 않다고 판단될 경우, 군집 개수를 늘리거나 초기 중심점을 변경하는 등의 추가
#적인 작업을 수행한다. 군집 개수 및 초기 중심점에 대한 절대 판단 기준은 없으므로, 반복적인 수행 작업을 통
#해 가장 결과 해석이 타당한 군집분석 결과를 선정할 필요가 있다.




## K-medoids 알고리즘
#군집 내에서 다른 객체들과의 거리가 최소가 되도록 하는 대표 객체를 고려하는 방법으로 
#PAM과 CLARA 알고리즘이 있다.
#객체가 속한 군집의 대표 객체와의 거리 합을 최소로 하는 방법

#1)PAM(partitioning around medoids)
#  중앙점(medoid)을 사용해서 N개의 모든 데이터를 최종 K개의 군집으로 군집화 시키는 방법
#  총합을 계산하기 때문에 큰 데이터에서는 성능이 떨어질 수 있다.

#2)CLARA(clustering large application)
# 모든 객체를 대상으로 하지 않고 객체 중에 일부만 대표값으로 해서 군집화 한다.
# 샘플링을 수행하고 PAM알고리즘을 사용해서 대표 객체를 산정한다.


#PAM 알고리즘

install.packages("cluster")
library(cluster)
?cluster


cluster::pam()


?pam

pamout<-pam(wages1833,k = 3)


pamout



#군집별 객체의 수
table(pamout$clustering)


#시각화
fviz_cluster(pamout, data = wages1833, ellipse.type = "convex", repel=F)



##자기 조직화 지도(Self Organizing Map)
#코호넨에 의해서 개발된 것으로 자기 조직화 네트워크 기법
#군집분석시에 신경망 분석을 수행하는 방법이며 거리 값은 유클리드 거리 수식 사용
#신경망과 K-means의 기법의 특징을 모두 가지고 있다.



install.packages("kohonen")
kohonen
library(kohonen)
data("wines")
str(wines)

class(wines)

head(wines)

View(wines)

?scale()

wines.sc<-scale(wines)


?som

?somgrid


#rlen : 학습횟수,alpha : learning rate(기본 설정:0.05,0.01에서 정지), radius :  이웃의 초기 반경

wine.som<-som(wines.sc, grid=somgrid(5,4,"hexagonal"), rlen=100, alpha=c(0.05,0.01))
wine.som
plot(wine.som)

summary(wine.som)


?plot.kohonen

plot.kohonen


