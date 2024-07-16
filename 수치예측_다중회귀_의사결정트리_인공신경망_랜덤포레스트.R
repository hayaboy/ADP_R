Boston
str(Boston)
?Boston


nrow(Boston)


idx<-sample(1:nrow(Boston), size=nrow(Boston)*0.7, replace = F)

Boston_train<-Boston[idx,]
Boston_test<-Boston[-idx,]
dim(Boston_train)
dim(Boston_test)

#다중회귀분석 기법 사용


li.fit<-lm(medv ~ . , data = Boston_train )
summary(li.fit)
?step

lm.fit2<-step(li.fit, method="both")
summary(lm.fit2)


lm.yhat2<-predict(lm.fit2,newdata=Boston_test)


mean((lm.yhat2-Boston_test$medv)^2)


sqrt(mean((lm.yhat2-Boston_test$medv)^2))


#의사결정트리 기법 사용


install.packages("tree")


tree.fit<-tree(medv ~ . , data=Boston_train)
summary(tree.fit)


?Boston


plot(tree.fit)
text(tree.fit,pretty = 0)


tree.yhat<-predict(tree.fit, newdata=Boston_test)


mean((tree.yhat - Boston_test$medv)^2)

sqrt(mean((tree.yhat - Boston_test$medv)^2))


rpart.fit<-rpart(medv ~ . , data=Boston_train)


summary(rpart.fit)

?Boston



rpart.plot(rpart.fit,type=0,extra=1,fallen.leaves = F, cex = 1)

?rpart.plot



rpat.hat<-predict(rpart.fit, newdata=Boston_test)




sqrt(mean((rpat.hat-Boston_test$medv)^2))





#인공 신경망 기법 사용


normalize<-function(x){return ((x-min(x))/(max(x)-min(x)))  }

Boston_train_norm<-as.data.frame(sapply(Boston_train,normalize))

Boston_test_norm<-as.data.frame(sapply(Boston_test,normalize))


nnet.fit<-nnet(medv ~ . , data=Boston_train, size=5)

nnet.yhat<-predict(nnet.fit, newdata=Boston_test_norm,type="raw")


mean((nnet.yhat - Boston_test_norm$medv)^2)

install.packages("neuralnet")



neural.fit<-neuralnet(medv ~ crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat, data=Boston_train_norm, hidden = 5)


neural.results<-compute(neural.fit,Boston_test_norm[1:13] )
neural.yhat<-neural.results$net.result



mean((neural.yhat-Boston_test_norm$medv)^2)

plot(neural.fit)


set.seed(1)
rf.fit<-randomForest(medv ~ . , data=Boston_train, mtry=6,importance=T)


rf.fit


plot(rf.fit)
importance(rf.fit)



varImpPlot(rf.fit)


rf.yhat<-predict(rf.fit, newdata=Boston_test)



mean((rf.yhat- Boston_test$medv)^2)

sqrt(mean((rf.yhat- Boston_test$medv)^2))


