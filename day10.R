
data<-matrix(c(140,50,120,55,78,80,95,85,95,90), nrow = 5, ncol = 2, byrow = T)


class(data)


?dist

dist(data)


sqrt((140-120)^2 + (50-55)^2)


sqrt((140-78)^2 + (50-80)^2)

abs(140-120) + abs(50-55)

dist(data, method = "manhattan")


dist(data, method = "minkowski")



#군집분석을 위한 패키지

install.packages("DAAG")
library(DAAG)


DAAG::wages1833

str(wages1833)


?wages1833



sum(is.na(wages1833))


?dist


distData<-dist(wages1833)




View(distData)






class(distData)




?hclust()




hc_a<-hclust(distData, method = 'single')



hc_a

plot(hc_a)

?rect.hclust

rect.hclust(hc_a, k = 3)



#완전 연결법(최장거리)




hc_b<-hclust(distData, method = 'complete')




plot(hc_b)



hc_b<-hclust(distData, method = 'complete')


plot(hc_b)

hc_c<-hclust(distData, method = 'average')



plot(hc_c)

hc_d<-hclust(distData, method = 'centroid')




plot(hc_d)



hc_e<-hclust(distData, method = 'ward.D2')


plot(hc_e)




rect.hclust(hc_e, k = 5)



#비계층형 군집(k-means)

iris2<-iris[,1:4]


km.out.withness<-c()

km.out.between<-c()



for (i in 2:7){
  set.seed(100)
  km.out<-kmeans(iris2, centers=i) 
  km.out.withness[i-1]<-km.out$tot.withinss 
  km.out.between[i-1]<-km.out$betweenss 
}

data.frame(km.out.withness, km.out.between)


152.34795 -   78.85144    

 
78.85144 - 57.2284


57.22847 - 49.8277




km.out.k3<-kmeans(iris2, centers=3 )

km.out.k3$centers


km.out.k3$cluster #각 관측치의 할당된 군집번호 출력 



km.out.k3$size 


table(km.out.k3$cluster, iris$Species) 




plot(iris2[,1:2], col=km.out.k3$cluster, pch=ifelse(km.out.k3$cluster==1, 16, ifelse(km.out.k3$cluster==2, 17,18)), cex=2) 



points(km.out.k3$centers, col=1:3, pch=16:18, cex=5)



install.packages("factoextra")
library(factoextra)

#wss는 그룹 내부의 합계제곱을 산출
#그래프에서 완만해지는 지점을 최적의 K 로 추정

?factoextra::fviz_nbclust()

fviz_nbclust(wages1833, kmeans, method="wss")


?kmeans

km<-kmeans(wages1833, centers = 3, nstart =25 )



km


fviz_cluster(km, data = wages1833, ellipse.type = "convex", repel=T)


#PAM 알고리즘


library(cluster)

?cluster::pam()



pamout<-pam(wages1833,k = 3)

pamout




table(pamout$clustering)




fviz_cluster(pamout, data = wages1833, ellipse.type = "convex", repel=F)
