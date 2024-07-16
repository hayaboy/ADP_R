


library(nnet)
iris3[,,1]
str(iris3)


ir<-rbind(iris3[,,1], iris3[,,2],iris3[,,3])
ir


#class.ind(c(rep("yes",10),rep("no",10)))


class.ind(c(rep("s",50),rep("c",50),rep("v",50) ))
class.ind(c(rep("s",50),rep("c",50),rep("v",50) ))


targets<-class.ind(c(rep("s",50),rep("c",50),rep("v",50) ))
samp<-c(sample(1:50,25), sample(51:100,25),sample(101:150,25))
samp

ir
5e-4+1

ir1<-nnet(ir[samp,], targets[samp,],size = 2, rang = 0.1, decay = 5e-4,maxit = 200)
pred01<-predict(ir1,ir[-samp,])

test.cl<-function(true,pred){
  true<-max.col(true)
  cres<-max.col(pred)
  table(true,cres)
}
test.cl(targets[-samp,], pred01)













test.err=function(h.size){
  ir1<-nnet(ir[samp,],targets[samp,], size = h.size,rang = 0.1, decay = 5e-4,maxit = 200)
  y<-targets[-samp,]
  p<-predict(ir1,ir[-samp,])
  err=mean(y!=p)
  c(h.size,err)
}


sapply(1:5,FUN = test.err())
t(sapply(1:5,FUN = test.err))






