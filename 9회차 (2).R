
?heatmap()
heatmap(cor(housing.df), Rowv = NA,Colv = NA)

library(gplots)

gplots::heatmap.2()

heatmap.2(cor(housing.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(housing.df),2), 
          notecol = "black", key = FALSE, trace = 'none',margins = c(10,10))

library(ggplot2)

library(reshape)

cor.mat<-round(cor(housing.df),2)
melted.cor.mat<-melt(cor.mat)
melted.cor.mat

ggplot(melted.cor.mat, aes(x=X1,y=X2,fill=value)) + geom_tile() + geom_text(aes(x=X1,y=X2,label=value))




heatmap(1*is.na(housing.df), Rowv = NA,Colv = NA)

install.packages("titanic")

library("titanic")

titanic::titanic_train

class(titanic_train)

head(titanic_train)

sum(is.na(titanic_train))



heatmap(1*is.na(titanic_train),Rowv = NA,Colv = NA)
#결측치는 1로 표시하고 나머지 값은 0으로 나타낸다.



#다차원 시각화

par(xpd=TRUE)

par(mfrow=c(1,1))
plot(housing.df$NOX ~ housing.df$LSTAT, ylab = "NOX", xlab="LSTAT",col=ifelse(housing.df$CAT..MEDV==1, "red", "gray"))

legend("topleft", inset = c(0,-0.2),leg end = c("CAT.MEDV=1", "CAT.MEDV=0"), col = c("red","gray"),pch=1,cex = 0.5)


library(ggplot2)


ggplot(housing.df,aes(x=LSTAT,y=NOX, colour=CAT..MEDV)) + geom_point(alpha=0.6)


data.for.plot3<-aggregate(housing.df$MEDV, by=list(housing.df$RAD, housing.df$CHAS), FUN=mean,drop=FALSE)

names(data.for.plot3)<-c("RAD","CHAS","meanMEDV")

par(mfcol=c(2,1))
barplot(height = data.for.plot3$meanMEDV[data.for.plot3$CHAS==0],names.arg = data.for.plot3$RAD[data.for.plot3$CHAS==0],
        xlab = "RAD", ylab = "Avg.MEDV", main = "CHAS=0")

barplot(height = data.for.plot3$meanMEDV[data.for.plot3$CHAS==1],names.arg = data.for.plot3$RAD[data.for.plot3$CHAS==1],
        xlab = "RAD", ylab = "Avg.MEDV", main = "CHAS=1")

plot(housing.df[, c(1,3,12,13)])

install.packages("GGally")
library(GGally)


ggpairs(housing.df[,c(1,3,12,13)])
