install.packages("dummies")
install.packages("rnn") 
library(dummies)
library(rnn)
set.seed(1)
x=sample(1:10, 50, replace=T) # regarded as a sequence
lx=length(x)
ux=length(unique(x))
xf=factor(x)
xd=dummy(xf) # dummy 변수 만듬 
xarray=array(xd,dim=c(1,lx,ux)) #RNN에서는 입력이 관측치*시점*변수를                       
# 표현하는 차원이 n * t * p인 array 
X=xarray[,-dim(xarray)[2],, drop=F]
Y=xarray[,-1,, drop=F]
m1 <- trainr(Y,X, learningrate = 0.2, 
             hidden_dim = 16, numepochs=1000)