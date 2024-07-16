require(mxnet)
train<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_train.csv')
test<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_test.csv')
train <- data.matrix(train)
test <- data.matrix(test)
train.y <- train[,1]
train.x <- train[,-1]
train.x <- t(train.x/255)
test.y <- test[,1]
test.x <- test[,-1]
test.x <- t(test.x/255)
train.array <- train.x
dim(train.array) <- c(28, 28, 1, ncol(train.x)) 
test.array <- test.x
dim(test.array) <- c(28, 28, 1, ncol(test.x)) 

par(mfrow=c(3,4))
for (i in 1:10){
image((train.array[,28:1,,i*500]), axes = FALSE, col = grey(seq(0, 1, length = 256)))
}
data <- mx.symbol.Variable('data')
conv1 <- mx.symbol.Convolution(data=data, kernel=c(5,5), stride=c(1,1), num_filter=20) 
tanh1 <- mx.symbol.Activation(data=conv1, act_type="tanh")
pool1<- mx.symbol.Pooling(data=tanh1,pool_type="max",kernel=c(2,2),stride=c(2,2)) 
conv2 <- mx.symbol.Convolution(data=pool1, kernel=c(5,5),stride=c(1,1), num_filter=50)                                    
tanh2 <- mx.symbol.Activation(data=conv2, act_type="tanh")
pool2 <- mx.symbol.Pooling(data=tanh2, pool_type="max",kernel=c(2,2), stride=c(2,2)) 
flatten <- mx.symbol.Flatten(data=pool2)
fc1 <- mx.symbol.FullyConnected(data=flatten, num_hidden=50)
tanh3 <- mx.symbol.Activation(data=fc1, act_type="tanh")
fc2 <- mx.symbol.FullyConnected(data=tanh3, num_hidden=10)
lenet <- mx.symbol.SoftmaxOutput(data=fc2)


model2 <- mx.model.FeedForward.create(lenet, X=train.array, y=train.y,
                            num.round=20, array.batch.size=100,
                            learning.rate=0.05,momentum=0.9, 
                            wd=0.00001, eval.metric=mx.metric.accuracy, 
                            epoch.end.callback=mx.callback.log.train.metric(100))
L1 <- predict(model2, test.array)
pred.label <- max.col(t(L1)) - 1
mean(test.y != pred.label)
table(test.y, pred.label)



