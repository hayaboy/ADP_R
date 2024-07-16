library(igraph)

# [1] 천체물리학자 협업 데이터 파일 (p.359 참조)
sn <- read.table(file.choose(), header=T)
head(sn)
tail(sn)

# [2] 임의의 노드ID('84424')와 연결된 과학자들의 그래프 
# 네트워크 만들기
sn.df <- graph.data.frame(sn, directed=FALSE)

# 노드ID '84424'와 연결된 과학자들의 그래프
sn1 <- subset(sn, sn$FromNodeId==84424)
sn1.df <- graph.data.frame(sn1, directed=FALSE)
plot(sn1.df)

# [3.1] 연결 정도
# 중심성
degree(sn.df, normalized=TRUE)
# 중심화
tmax <- centralization.degree.tmax(sn.df)
centralization.degree(sn.df, normalized=FALSE)$centralization / tmax

# [3.2] 근접
# 중심성
closeness(sn.df, normalized=TRUE)
# 중심화
tmax <- centralization.closeness.tmax(sn.df)
centralization.closeness(sn.df, normalized=FALSE)$centralization / tmax

# [3.3] 중개 
# 중심성
betweenness(sn.df, normalized=TRUE)
# 중심화
tmax <- centralization.betweenness.tmax(sn.df)
centralization.betweenness(sn.df, normalized=FALSE)$centralization / tmax

# [4] 연결정도 분포 그리기
sn.df.dist <- degree.distribution(sn.df)
plot(sn.df.dist, xlab="연결 정도", ylab="확률", type="l")

# [5] 가장 많이 협업한 연구자 10명 
# 연구자별 협업 수 
degree(sn.df, normalized=FALSE)
# 연구자별 협업 수(헙업 수 오름차순)
sort(degree(sn.df, normalized=FALSE))
# 연구자별 협업 수(헙업 수 내람차순)
sort(degree(sn.df, normalized=FALSE), decreasing = TRUE)
# 협업 수가 큰 연구자 10명
head(sort(degree(sn.df, normalized=FALSE), decreasing = TRUE), n=10)

#####################################


      
 