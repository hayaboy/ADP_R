USArrests


pc1<-princomp(USArrests,cor=T)

summary(pc1)

plot(pc1)

pc1$center


pc1$scale


pc1$loadings



pc1$scores

plot()


plot(pc1$scores[,1],pc1$scores[,2], xlab="Z1", ylab="Z2" )

abline(v=0,h=0,col="gray")







biplot(pc1,cex=0.7)

abline(v=0,h=0,col="gray")





