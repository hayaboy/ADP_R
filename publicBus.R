# p.251
# 노선 번호에 대한 노선 ID 확인  
install.packages("XML")
install.packages("ggmap")
library(XML)
library(ggmap)

#노선정보서비스(서울시)
#data.go.kr -> kc8e6nSURd^2
busRtNm <- "402"
API_key <- "lpqmtIpSYxE%2F7Pa4qF1HgoRXu7rz4b2P2RvyPQ7RI6LVWwgMq4pbRqbnaBYFWxylA4oaDSRYkAtVVFFZKc2PRg%3D%3D"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", busRtNm,sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.252
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
head(df)

df_busRoute <- subset(df, busRouteNm==busRtNm)
df_busRoute

df_busRoute$busRouteId

# p.253
# 노선 ID에 대한 버스 실시간 위치 정보 확인
API_key <- "lpqmtIpSYxE%2F7Pa4qF1HgoRXu7rz4b2P2RvyPQ7RI6LVWwgMq4pbRqbnaBYFWxylA4oaDSRYkAtVVFFZKc2PRg%3D%3D"
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=",
             df_busRoute$busRouteId, sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.254
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
df

gpsX <- as.numeric(as.character(df$gpsX))
gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=gpsX, lat=gpsY)
gc

# p.257
# 구글 맵에 버스 위치 출력
install.packages("scales")
library(ggmap)
cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc,key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE" )
ggmap(map, extent="device")

######################
