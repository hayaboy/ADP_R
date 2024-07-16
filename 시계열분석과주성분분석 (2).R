
datasets::EuStockMarkets

data("EuStockMarkets")

str(EuStockMarkets)

View(EuStockMarkets)

?attr

attributes(EuStockMarkets)[1]

attributes(EuStockMarkets)


plot(EuStockMarkets)

plot(EuStockMarkets[ ,'DAX' ])
class(EuStockMarkets[ ,'DAX' ][[1]])
class(EuStockMarkets[ ,'DAX' ][1])


attributes(EuStockMarkets)




dimnames(EuStockMarkets)



EuStockMarkets[, "SMI"][1:10]



summary(EuStockMarkets)


mean(EuStockMarkets[ , 'DAX'])

sqrt(var(EuStockMarkets[ , 'DAX']))

sd(EuStockMarkets[ , 'DAX'])


install.packages("fBasics")

library(fBasics)

fBasics::skew


?timeDate

skewness(EuStockMarkets[ , 'DAX'])
kurtosis(EuStockMarkets[ , 'DAX'])

par<-par(mfrow=c(2,2))


plot(EuStockMarkets[ , 'DAX'])
hist(EuStockMarkets[ , 'DAX'])
boxplot(EuStockMarkets[ , 'DAX'])



par<-par(no.readonly=TRUE)
par


plot(EuStockMarkets[ , 'DAX'], EuStockMarkets[ , 'SMI'])
cov(EuStockMarkets[ , 'DAX'], EuStockMarkets[ , 'SMI'])
cor(EuStockMarkets[ , 'DAX'], EuStockMarkets[ , 'SMI'])


cor(EuStockMarkets)


CorrEU<-cor(EuStockMarkets)



install.packages("corrplot")

corrplot::corrplot()


par<-par(mfrow=c(1,1))
corrplot(CorrEU)
?corrplot





corrplot(CorrEU, method ="ellipse")





data(iris)


?prcomp()


prcomp(iris[ ,1:4 ])
prcomp(iris[ ,1:4 ], cor=T)


summary(prcomp(iris[ ,1:4 ]))





iris.pca<-prcomp(iris[ ,1:4 ], cor=T)


iris.predict<-predict(iris.pca)

iris.predict[, 1:2]

biplot(iris.pca)




v1<-c(2,1,5,2,3,4,4,1,3,5)
v2<-c(4,5,3,2,5,3,4,2,3,5)
v3<-c(5,1,4,3,5,2,3,1,2,3)

df<-data.frame(v1,v2,v3)
colnames(df)<-c('면','그릇','국물')
df

rownames(df)<-c('쇠고기라면','해물라면','얼큰라면','떡라면','짬뽕라면','만두라면','치즈라면','된장라면','볶음라면','김치라면')


prcomp(df)

pca_myun<-prcomp(df,cor=T)

summary(pca_myun)



predict(pca_myun)[, 1:2]






p1<-prcomp(df, scale = T)
p1
summary(p1)

biplot(p1)




data("USArrests")

cor_matrix<-cor(USArrests)

?corrplot

corrplot(cor_matrix, method = "ellipse")


?pairs()

plot(USArrests, panel=panel.smooth)

?princomp
?prcomp

pca_usa<-princomp(USArrests,cor=T)

summary(pca_usa)



screeplot(pca_usa)

?screeplot

screeplot(pca_usa, npcs=4, type = "l")


pred_pca_usa<-predict(pca_usa)[, 1:2]

biplot(pca_usa)

?USArrests

str(USArrests)


head(USArrests,10)






