
install.packages("colorspace")
install.packages("ggplot2")
install.packages("ggmap")
library(XML)
library("colorspace")
library("ggplot2")
library("ggmap")

busRtNm <- "402"
API_key <-"JPWBT082Gn4bu%2BgoZ%2BD4t86tghEVRbFzQag4wcZSEDDCihIdtSilnI4MWDJJ23ygD9ByD0JkeFmz6Szb8LNIzw%3D%3D"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", busRtNm,sep="")

xmlfile <-xmlParse(url)
is(xmlfile)

XML::xmlRoot()


xmlRoot(xmlfile)

XML::getNodeSet()

xmlset<-getNodeSet(xmlfile,"//itemList")

is(getNodeSet(xmlfile,"//itemList"))


xmlToDataFrame(xmlset)
df<-xmlToDataFrame(xmlset)






df_busRoute <-subset(df, busRouteNm==busRtNm)

df_busRoute



df_busRoute$busRouteId

# ?????? ID??? ?????? ?????? ????????? ?????? ?????? ??????

API2_key <-"g2RXAyTPKl43uBgkvNWiwt5Y4HEyYKCoJJIWkhZcqY45CO5%2BA81JxNZFVOdfE38UHUSWb9gc0Rp4E%2F%2FouFOCIg%3D%3D"

url2 <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API2_key, "&busRouteId=",df_busRoute$busRouteId, sep="")


xmlfile <- xmlParse(url2)

xmlfile


xmlRoot(xmlfile)

df<-xmlToDataFrame(getNodeSet(xmlfile,"//itemList"))
df

str(df)
gpsX<-as.numeric(as.character(df$gpsX))
gpsY<-as.numeric(as.character(df$gpsY))


is(gpsX)


gc<-data.frame(lon=gpsX, lat=gpsY)

cen <- c(mean(gc$lon), mean(gc$lat))
ggmap::re
?register_google()
register_google(key="AIzaSyCaDHYayQduOzgXWKLNEgezwFIMq0ZdpSE")

map<-get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc)


ggmap(map,extent = "device")

?get_googlemap
