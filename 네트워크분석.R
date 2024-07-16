#네트워크 분석

#사회 및 자연 현상들을 네트워크 형태로 모델링하여 그 특성을 파악하는 것 

#그래프 이론 (점(node, vertex, point), 간선(edge, line)의 집합)


#사회연결망 시각화하고 분석하는 패키지  :igraph, statnet(sna, network, ergm), RSiena


install.packages("igraph")


#네트워크 분석 지표

# 1) 연결정도(degree) : 각 노드가 어느 정도로 많은 관계를 맺고 있는지를 나타냄
# 2) 근접(closeness) : 한 점이 다른 모든 점들에 얼마나 가까운가
# 3) 중개(betweenness) : 연결망에서 한 노드가 다른 노드들 사이에 위치하는 정도


# 각 지표는 중심성(centrality)과 중심화(centrailization) 관점으로 설명된다.
# 중심성 : 연결정도 중심성, 근접 중심성, 중개 중심성
# 중심화 : 연결정도 중심화, 근접 중심화, 중개 중심화

# 밀도 : 중심화와 같이 네트워크의 전체 특성을 나타내는 지표로 전체 노드가 서로 간에 얼마나 많은 관계를 맺고 있는가.....


#네트워크의 유형 : 스타형(star), Y자형, 원형


?graph
#1) 스타형(star)

g_star<-graph(edges=NULL, n=NULL, directed = FALSE)

#방향성이 없고, 에지(edges)와 노드(n)가 없는 igraph생성(초기화)


g_star<-g_star+vertex("A", shape="circle", size=30, color="yellow" )
# 그래프에 A노드 추가, 

g_star<-g_star+vertices("B","C","D","E","F",shape="circle", size=30 )
plot(g_star)


g_star<-g_star+edge("A","B")

plot(g_star)

g_star<-g_star+edge("A","C","A","D","A","E","A","F")

plot(g_star)

?vcount

vcount(g_star) # 네트워크내의 노드 수
ecount(g_star) # 노드 간 연결된 에지의 총 수 







#2) Y자형 

g_Y<-graph(edges=NULL, n=NULL, directed = FALSE)

g_Y<-g_Y+vertices("A","B","C","D","E","F",shape="circle", size=30 )

plot(g_Y)
g_Y<-g_Y+edge("A","B","A","C","A","D","D", "E","E", "F")

plot(g_Y)



#3) 원형 


g_ring<-graph(edges=NULL, n=NULL, directed = FALSE)

g_ring<-g_ring+vertex("A",shape="circle", size=30, color="yellow" )

g_ring<-g_ring+vertices("B","C","D","E","F",shape="circle", size=30 )

plot(g_ring)
g_ring<-g_ring+edge("A","B","B","C","C","D","D", "E","E", "F","F","A")

plot(g_ring)



#연결정도
degree(g_star,normalized = FALSE)
degree(g_star,normalized = TRUE) # 정규화된 연결 중심성


#degree

?degree


centralization.degree(g_star)
#res 노드 수준의 중심성
#centralization 그래프 수준의  중심성
#theoretical_max 이론적 그래프 수준의 중심화 최대값



closeness(g_star,normalized = FALSE)
#A가 근접 중심성이 가장 큼

tmax<-centralization.closeness.tmax(g_star)
#이론적인 근접 중심화의 최대값

#최단 경로

shortest.paths(g_star)
#B에서 F는 2단계를 거치면 도달 
# 노든 간 모든 경로들에 대한 거리를 나타내는 행렬 


?get.shortest.paths

get.shortest.paths(g_ring,"A")
get.shortest.paths(g_ring,"A","C")
get.shortest.paths(g_ring,"A",c("C","E"))



average.path.length(g_star)
#노드간 모든 경로의 평균 거리



sn<-read.table(file.choose(), header = F)
#read.table 테이블 형태의 파일을 읽어들여 데이터 프레임으로 변환
head(sn)



sn.df<-graph.data.frame(sn, directed = FALSE)

is(sn.df)
plot(sn.df)

#graph.data.frame : 데이터프레임으로부터 igraph의 그래프로 변환




sn1<-subset(sn, sn$V1==1)
sn1.df<-graph.data.frame(sn1, directed = FALSE)
plot(sn1.df)


vcount(sn.df)
ecount(sn.df)


?V
V(sn.df)$name
#V(graph)




vmax<-V(sn.df)$name[degree(sn.df)==max(degree(sn.df))]
#연결 정도가 최대인 것을 인덱스로 해서 그 사람 찾기


vmax

?degree
degree(sn.df,vmax)
#1045개의 연결을 가짐


summary(degree(sn.df))


plot(degree(sn.df),xlab="사용자 번호", ylab="연결정도", type='h')



sn.df.dist<-degree.distribution(sn.df)
plot(sn.df.dist, xlab = "연결정도", ylab="확률")




#degree.distribution : 노드에 연결된 에지의 분포

degree(sn.df, normalized = TRUE)
#정규화된 연결정도 중심성




# 연결정도 (degree) 
# 연결정도 중심성(degree centrality)
#: 각 노드가 어느 정도로 많은 관계를 맺고 있는지를 나타내는 지표



#근접(closeness)
# 근접 중심성(closeness centrality)
# : 한 점이 다른 모든 점들에 얼마나 가까운가를 나타내는 지표




closeness(sn.df,normalized = TRUE)
#정규화된 근접 중심성


betweenness(sn.df,normalized = TRUE)

#정규화된 중개 중심성


graph.density(sn.df)

# sn.df에 대한 네트워크 밀도 :  총 연결 정도를 연결 가능한 수로 나눈 비율(1.08%)

average.path.length(sn.df)

#임의의 두 사용자는 평균적으로 약 3.7단계를 거치면 연결이 됨


sn10 <- subset(sn, sn$V1<10 & sn$V2 <10)

sn10


sn10.graph<-graph.data.frame(sn10, directed = FALSE)


shortest.paths(sn10.graph)
#0~9번 사용자 간 최소 경로에 대한 행렬

get.shortest.paths(sn10.graph,"5")

#5번 사용자와 연결되 최단 경로


get.shortest.paths(sn10.graph,"5", "9")

#5번 사용자와 9번 사용자 간 최단 경로


get.shortest.paths(sn10.graph,"5", c("8","9"))












