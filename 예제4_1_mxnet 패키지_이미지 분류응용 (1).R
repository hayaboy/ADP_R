require(mxnet)
A <- matrix(c(0,0,0,0,0,0,  
           0,1,0,0,0,0,
           0,1,1,0,0,0,
           0,1,0,1,0,0,
           0,1,0,0,1,0,
           0,0,0,0,0,0), ncol=6, byrow=T) 
B <- matrix(c(0,0,0,0,0,0,  
             0,0,0,0,1,0,
             0,0,0,0,1,0,
             0,0,0,0,1,0,
             0,1,1,1,1,0,
             0,0,0,0,0,0), ncol=6, byrow=T) 
train.x1 <- rep(A,10)
train.x2 <- rep(B,10)
train.x <- c(train.x1, train.x2)
train.y <- c(rep(1,10), rep(0,10)) 
noise <- sample(c(0,1),length(train.x), replace=T, prob=c(9,1))
v <- which(noise==1)
train.x[v] <- abs(train.x[v]-1)
train.array <- train.x
dim(train.array) <- c(6, 6, 1, 20) # image with noise

par(mfrow=c(2,4))
image(A, axes = FALSE, col = grey(seq(0, 1, length = 256)))
for(i in 1:3){
image(train.array[,,1, i*3], axes = FALSE, col = grey(seq(0, 1, length = 256)))
}
image(B, axes = FALSE, col = grey(seq(0, 1, length = 256)))
for(i in 1:3){
image(train.array[,,1, i*3+10], axes = FALSE, col = grey(seq(0, 1, length = 256)))
}
data <- mx.symbol.Variable('data')
conv1 <- mx.symbol.Convolution(data=data, kernel=c(4,4), stride=c(1,1), num_filter=4)
act1 <- mx.symbol.Activation(conv1, name="conv1", act_type="tanh") 
pool1 <- mx.symbol.Pooling(data=act1, pool_type="max", kernel=c(2,2), stride=c(1,1))
flatten <- mx.symbol.Flatten(data=pool1)
fc2 <- mx.symbol.FullyConnected(data=flatten, num_hidden=2)
lenet <- mx.symbol.SoftmaxOutput(data=fc2)
model1 <- mx.model.FeedForward.create(lenet, X=train.array, y=train.y,     
                               num.round=20, array.batch.size=100,
                               learning.rate=0.01, wd=0.00001, 
                               momentum=0.1,eval.metric=mx.metric.accuracy,
                              epoch.end.callback=mx.callback.log.train.metric(100))
L=predict(model1, train.array)
pred.label= max.col(t(L)) - 1 
mean(train.y!= pred.label)
table(train.y, pred.label)


