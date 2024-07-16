install.packages("arulesSequences")
data("zaki")
?zaki
str(zaki)

as(zaki, "data.frame")


?cspade()

seqr<-cspade(zaki, parameter = list(support=0.3,maxsize=5,maxlen=4))

as(seqr,"data.frame")



install.packages("kohonen")
library(kohonen)

kohonen::wines
wines<-read.csv(file.choose())
str(wines)

colnames(wines)<-c('y', 'Alcohol','Malic acid','Ash', 'Alcalinity of ash','Magnesium','Total phenols','Flavanoids','Nonflavanoid phenols','Proanthocyanins','Color intensity','Hue','OD280/OD315 of diluted wines','Proline')
str(wines)


wines_data<-wines[2:14,]

library(kohonen)

wines.sc<-scale(wines_data)
set.seed(7)

?som
wine.som<-som(data=wines.sc, grid=somgrid(5,4,"hexagonal"),rlen=100,alpha=c(0.5,0.01),toroidal=FALSE,keep.data=TRUE)
