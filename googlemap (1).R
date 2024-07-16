# p.178
# 도시(서울) 중심의 지도 출력
install.packages("ggmap")
library(ggmap)
?ggmap::geocode()
gc <- geocode(enc2utf8('서울'), source="dsk")
cen <- as.numeric(gc)
?ggmap::sdsdds
map <- get_googlemap(center=cen,key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
ggmap(map)

# p.182
# 임의 주소지(충청북도 단양군) 중심의 지도 출력
gc <- geocode(enc2utf8('충청북도 단양군'), source="dsk")
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="terrain",key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE" )
ggmap(map)

# 전체 영역으로 지도 출력
map <- get_googlemap(center=cen, maptype="roadmap",key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
ggmap(map, extent="device")

# p.183
# 마커 출력
gc <- geocode(enc2utf8('충청북도 단양군'),source="dsk" )
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="roadmap", marker=gc,key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE" )
ggmap(map, extent="device")



'''
# p.185
# 단양팔경 위치의 마커 출력
install.packages("ggplot2")
library(ggplot2)
names <- c("1.도담삼봉/석문", "2.구담/옥순봉", "3.사인암", "4.하선암", "5.중선암", "6.상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로",
          "충청북도 단양군 대강면 사인암2길 42",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")

gc <- geocode(enc2utf8(addr),source="dsk" )
gc

# p.186
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen 

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc, key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
ggmap(map)

# p.187
# 단양팔경 이름 출력
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon, y=lat), size=5, label=df$name)

# p.188
# 범례 출력
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=11)
gmap <- ggmap(map, extent="device", legend="topright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), size=10, label=seq_along(df$name))
'''




# p.191
# 지진 지역의 마커 표시
library(ggmap)
df <- head(quakes, 100)
df

cen <- c(mean(df$long), mean(df$lat))
cen

gc <- data.frame(lon=df$long, lat=df$lat)
gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
#위도의 범위는 0(적도)~90(북구), 0 ~ -90(남구)이며, 경도는 영국 그리니치 천문대를 지나는 0~180(동경),0~-180(서경)
#따라서 경도 데이터가 180도보다 큰 경우 -좌표로 변환하여 0~-180도 사이가 되도록 변환
gc

# p.192
map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=4, marker=gc, key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
ggmap(map, extent="device")


# p.193
# 지진 규모 표시
#map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=5, key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")
#ggmap(map, extent="device") + geom_point(data=df, aes(x=long, y=lat, size=mag), alpha=0.5)
#######################