


#행렬 곱

A<-matrix(c(3,2,7,5), nrow = 2, byrow = T)

?solve

A_inv <- solve(A)
  
  
A_inv  
  

A %*% A_inv  




data("USArrests")
?USArrests


cor(USArrests)



princomp(USArrests, cor = T)


summary(princomp(USArrests, cor = T))

# 주성분들의 로딕 벡터를 보여줌
?loadings


loadings()


plot(princomp(USArrests, cor = T), type="lines")


pca1<-princomp(USArrests, cor = T)

pca1$scores




biplot(pca1)


