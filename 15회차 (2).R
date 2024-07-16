rm(list=ls())


#홀드아웃웃

data("iris")
nrow(iris)


set.seed(1234)

idx<-sample(2,nrow(iris),replace = TRUE,prob = c(0.7 , 0.3))
idx

?sample

sample(c(1,2,3), 1)
sample(c(1,2,3),2)
sample(2,150, replace = T)


trainData<-iris[idx==1, ]
testData<-iris[idx==2, ]

nrow(trainData)
nrow(testData)

rm(list=ls())
#교차 검증
k<-10
data("iris")
sample(nrow(iris))

iris_1<-iris[sample(nrow(iris)),]
seq(1, nrow(iris_1))
folds<-cut(seq(1, nrow(iris_1)), breaks=k, labels=FALSE)

list()
trainData_1 <- list(0)
testData_1 <- list(0)

?which

which(folds==1, arr.ind = TRUE)
which(folds==2, arr.ind = TRUE)

for(i in 1:k){
  testIdx<-which(folds==i, arr.ind = TRUE)
  testData_1[[i]]<-iris_1[testIdx,]
  trainData_1[[i]]<-iris_1[-testIdx,]
}


head(trainData_1[[1]])
