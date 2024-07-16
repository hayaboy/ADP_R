install.packages("ggplot2")
install.packages("ggmap")
library(ggplot2)
library(ggmap)

# 'EDIYA COFFEE' 매장과 주소
# 매장 URL정보:http://ediya.com/contents/find_store.html#c
names <- c("1.역삼더블루점","2.역삼상록점")
addr <- c("서울특별시 강남구 논현로63길 16","서울특별시 강남구 테헤란로43길 18")

gc <- geocode(enc2utf8(addr), source="dsk")
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc, key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
ggmap(map)

# 마커와 문자 출력
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon, y=lat), size=5, label=df$name)

# 범례 출력
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=11)
gmap <- ggmap(map, extent="device", legend="topright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), size=10, label=seq_along(df$name))

########################################     