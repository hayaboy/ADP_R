#천체물리학 논문 연구 협업 네트워크 분석

sn<-read.table(file.choose(), header = T)



head(sn)
str(sn)

sn.df<-graph.data.frame(sn,directed = FALSE)

class(sn.df)


sn1<-subset(sn, sn$FromNodeId==84424)
sn1.df<-graph.data.frame(sn1, directed = FALSE)
plot(sn1.df)


degree(sn.df,normalized = TRUE)

tmax<-centralization.degree.tmax(sn.df)
centralization.degree(sn.df,normalized = FALSE)$centralization/tmax

closeness(sn.df, normalized=TRUE)
tmax <- centralization.closeness.tmax(sn.df)
centralization.closeness(sn.df, normalized=FALSE)$centralization / tmax
betweenness(sn.df, normalized=TRUE)
tmax <- centralization.betweenness.tmax(sn.df)
centralization.betweenness(sn.df, normalized=FALSE)$centralization / tmax
sn.df.dist <- degree.distribution(sn.df)
plot(sn.df.dist, xlab="연결 정도", ylab="확률", type="l")


degree(sn.df, normalized=FALSE)

sort(degree(sn.df, normalized=FALSE))

sort(degree(sn.df, normalized=FALSE), decreasing = TRUE)
head(sort(degree(sn.df, normalized=FALSE), decreasing = TRUE), n=10)
