install.packages("cluster")
data(iris)
?cluster::pam()

#(mathematics) A mathematically representative object in a set of objects; it has the smallest average dissimilarity to all other objects in the set



nc2<-pam(iris,2)
# 데이터를 2개로 군집화 시행
si2 = silhouette(nc2) # 실루엣값 계산
si2

#군집화가 얼마나 잘 되었는지 확인하는 척도

#Dumm Index 와 2. 실루엣(Silhouette) 으로 평가합니다.

#1. Dumm Index는 (군집과 군집사이 거리 중 최소값)/(군집 내 데이터들 거리 중 최대값) 으로,

#분자가 클수록 군집 간 거리가 멀고,

#분모값이 작을 수록 군집 내 데이터가 모여있으므로,

#Dumm Index이 클수록 군집화가 잘 되었다고  볼 수 있습니다.



#2. 실루엣(Slihouette) 은 그때그때 식이 살짝 다른데,

#1(숫자 1)에 가까울 수록 군집화가 잘 되었다고 판단합니다.

summary(si2)

#iris 데이터에서 군집을 2로 했을 때는 실루엣값이 0.68
plot(si2)

nc3=pam(iris, 3)
si3=silhouette(nc3)

summary(si3)


#군집을 3으로 가정한 경우에는 실루엣의 평균값은 0.57로 군집을 2로 가정했을 때보다 더 낮은 값으로 확인되었다.

iris.kc<-kmeans(iris[,1:4], 2)
iris.kc



iris.kc = kmeans(iris[, 1:4], 3)

iris.kc





#iris 데이터는 setosa, versicolor, virginica 세 종류의
#iris 꽃을 분류한 데이터로 실제 군집 수를 3으로 가정하고 K 평균 군집화를 수행한 경
#우가 더욱 정확도가 높다. 


?kmeans




