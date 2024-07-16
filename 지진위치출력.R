data()
quakes
str(quakes)
df<-head(quakes,10)
quakes
cen <- c(-(360-mean(df$long)), mean(df$lat))
cen
class(cen)
is(cen)
gc <- data.frame(lon=df$long, lat=df$lat)
# 경도 데이터가 180보다 큰 경우 - 좌표로 변환하여
#0~ -180도 사이가 되도록 변환, 지도 출력

?ifelse


gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
gc

map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=4, marker=gc)


ggmap(map,extent="device")

