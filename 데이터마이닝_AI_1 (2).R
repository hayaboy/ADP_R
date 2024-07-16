matrix(c(140,50,120,55,78,80,95,85,95,90), nrow=2,ncol=5,byrow = T)

m<-matrix(c(140,50,120,55,78,80,95,85,95,90), nrow=5,ncol=2,byrow = T)


?dist

dist(m)



dist(m, method ="manhattan" )

m[ , 1]
m[ , 2]

cor(m[ , 1],m[ , 2])


datasets::Nile

?Nile
plot(Nile)

mode(Nile)
class(Nile)

datasets::EuStockMarkets

str(EuStockMarkets)

plot(EuStockMarkets)





datasets::AirPassengers
str(AirPassengers)
plot(AirPassengers)

?stl
#locally weighted robust scatterplot smoothing

stl(AirPassengers,s.window='periodic')

plot(stl(AirPassengers,s.window='periodic'))


