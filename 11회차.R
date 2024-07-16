rm(list=ls())


#네트워크 데이터 시각화 
ebay.df<-read.csv(file.choose(),header = T)

str(ebay.df)

ebay.df[,1]<-as.factor(ebay.df[,1])
ebay.df[,2]<-as.factor(ebay.df[,2])

str(ebay.df)

graph.edges<-as.matrix(ebay.df[,1:2])

install.packages("igragh")

library(igraph)

head(graph.edges)
g<-graph.edgelist(graph.edges, directed = FALSE)

?V
graph.edges[,2]

V(g)$name
graph.edges[,2]
isBuyer<-V(g)$name %in% graph.edges[,2]

isBuyer
plot(g, vertaex.label=NA,vertex.color=ifelse(isBuyer,"gray","black"), vertex.size=ifelse(isBuyer,7,10))



#계층 데이터의 시각화 : 트리맵

tree.df<-read.csv(file.choose())


tree.df$negative.feedback<-1*(tree.df$Seller.Feedback<0)

install.packages("treemap")
library(treemap)
colnames(tree.df)
treemap(tree.df,index = c("Category","Sub.Category","Brand"),vSize = "High.Bid",vColor = "negative.feedback",fun.aggregate = "mean",
                        align.labels = list(c("left","top"),c("right","bottom"),c("center","center")), 
                        palette = rev(gray.colors(3)), type="manual",title="")


