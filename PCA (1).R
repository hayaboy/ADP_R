# 주성분 분석(Principal Component Analysis)
data("USArrests")
str(USArrests)
nrow(USArrests)
rownames(USArrests)

apply(USArrests, 2, var)

# prcomp(), princomp()

USArrests_pca<-prcomp(USArrests, scale=TRUE)

summary(USArrests_pca)

print(USArrests_pca)


plot(USArrests_pca, type="l")

biplot(USArrests_pca)
names(USArrests_pca)

USArrests_pca$rotation <- -USArrests_pca$rotation
USArrests_pca$x<- -USArrests_pca$x




