
#미국의 인기 드라마 그레이 아나토미에 등장한 여러 주인공들 간의 연인 관계 데이터로
#사회 연결망 분석


library(igraph)


ga.data<-read.csv(file.choose(), header = T)
ga.data


g<-graph.data.frame(ga.data, directed = F)

g$layout<-layout.fruchterman.reingold(g)

plot(g)


#노드의 라벨을 모두 지우고 노드의 크기를 연결정도(degree) 값에 2를 곱하여 지정

?V


V(g)$label <- NA

V(g)$size <- degree(g) * 2

plot(g)



#근접중심성 closeness
#closeness를 계산하고 closeness에 따라 노드의 색상을 달리하도록 설정

clo<-closeness(g)

clo


clo.score<-round((clo - min(clo)) * length(clo) / max(clo)) + 1


?heat.colors()


?rev

clo.colors<-rev(heat.colors(max(clo.score)))

clo.score

V(g)$color<-clo.colors[clo.score]


plot(g)


#중개중심성은 betweenness



#betweenness를 계산하고 betweenness에 따라 노드의 색상을 달리하도록 설정



btw<-betweenness(g)

btw.score<-round(btw + 1 )


btw.score

btw.colors<-rev(heat.colors(max(btw.score)))


V(g)$color<-btw.colors[btw.score]


plot(g)

