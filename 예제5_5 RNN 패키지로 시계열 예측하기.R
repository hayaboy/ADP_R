set.seed(1)
xt<-arima.sim(model=list(ar=c(.5,-0.3)),200)
xt<-arima.sim(model=list(ar=c(.5,-0.3)),200)
x<-xt+rnorm(200,0,0.3)
x<-(x-min(x))/(max(x)-min(x))

# training with covariates at t=1,...,48 and response at t=49 data 
# predicting t=50 with covariates at t=1,...,49 
# training with covariates at t=1,...,49 and response at t=50 data 
# predicting t=51 with covariates at t=1,...,50 
# ...
# training with covariates at t=51,...,98 and response at t=99 data 
# predicting t=100 with covariates at t=1,...,99 

out<-numeric(200)
for(n in 50:100){
  cat(n)
  trX<-array(0,c(1,n-3,2))
  trY<-array(0,c(1,n-3,1))
  trX[,,1]<-x[1:(n-3)] 
  # 두개의 변수가 필요하지 않지만 변수를 입력하는 연습을 위함 
  trX[,,2]<-x[2:(n-2)]
  trY[,,1]<-x[3:(n-1)]
  testX<-array(0,c(1,n-2,2))
  testY<-array(0,c(1,n-2,1))
  testX[,,1]<-x[1:(n-2)]
  testX[,,2]<-x[2:(n-1)]
  testY[,,1]<-x[(3:n)]
  model.time <- trainr(trY, trX, learningrate = 0.5, 
                       hidden_dim =16 , numepochs=5000,  
                       epoch_function = c(epoch_annealing))
  yptest<-predictr(model.time, testX)
  out[n]<-yptest[1,n-2]
}

#plot real and predicted values
plot(c(testY), type="b", col=1,pch=1)
lines(c(yptest), type="b", lty=2, col=1, lwd=1, pch=2)
legend(0,1,c('y','predicted'), pch=c(1,2))
