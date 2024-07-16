
boston.housing.df<-read.csv(file.choose(), header = T)

head(boston.housing.df,9)

#요약 통계량
?summary
summary(boston.housing.df)

#mean(), sd(),min(),max(),median(),length()
summary(boston.housing.df$CRIM)
boxplot(boston.housing.df$CRIM)
sd(boston.housing.df$CRIM)

sum(is.na(boston.housing.df$CRIM))

cor(boston.housing.df)

data.frame(mean=sapply(boston.housing.df,mean), 
          sd=sapply(boston.housing.df,sd), 
          min=sapply(boston.housing.df,min),
          max=sapply(boston.housing.df,max),
          median=sapply(boston.housing.df,median),
          length=sapply(boston.housing.df,length),
          miss.val=sapply(boston.housing.df, function(x){sum(length(which(is.na(x))))})
         )



table(boston.housing.df$CHAS)
             

?.bincode()

summary(boston.housing.df$RM)
boxplot(boston.housing.df$RM)
range(boston.housing.df$RM)

boston.housing.df$RM.bin<-.bincode(boston.housing.df$RM, c(1:9))

aggregate(boston.housing.df$MEDV, by=list(RM=boston.housing.df$RM.bin, CHAS=boston.housing.df$CHAS), FUN=mean)

#피벗 테이블

library(reshape)

?melt

mlt<-melt(boston.housing.df,id=c("RM.bin", "CHAS"), measure=c("MEDV"))
mlt

?cast

cast(mlt, RM.bin ~ CHAS, subset = variable=="MEDV", margins = c("grand_row", "grand_col"), mean)


#상관 분석
cor(boston.housing.df)


#범주형 변수의 범주 개수 축소

library(ggmap)


tbl<-table(boston.housing.df$CAT..MEDV,boston.housing.df$ZN)


prop.tbl<-prop.table(tbl, margin = 2)

prop.tbl



barplot(prop.tbl, xlab = "ZN", ylab="", yaxt="n", main="Distribution of CAT.MEDV by ZN")



