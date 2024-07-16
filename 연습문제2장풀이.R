rm(list = ls())
wine_data<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",header = F)
str(wine_data)
range(wine_data$V1)
wine_data$V1 <- as.factor(wine_data$V1)
nrow(wine_data)
train_idx <- sample(1:nrow(wine_data), nrow(wine_data) * 0.7)
train_data <- wine_data[train_idx, ]
test_data <- wine_data[-train_idx, ]
library(nnet)

wine_md <- nnet( V1 ~ ., data = train_data,  size = 3, decay = 5e-4, maxit = 200)

is(wine_md)

pred <- predict(wine_md, newdata=test_data,type = "class") 


is(pred)
pred<-as.factor(pred)

is(test_data$V1)

table(pred, test_data$V1)
confusionMatrix(pred, test_data$V1)


#################### NCS##############
library(caret)
is(pred)

is(test_data$V1)
test_data$V1
?confusionMatrix
pred<-as.factor(pred)
is(pred)
levels(pred)
confusionMatrix(factor(pred), factor(test_data$V1))

library(caret)
idx<-createDataPartition(iris$Species, p=0.7, list=F)
iris_train<-iris[idx, ]
iris_test<-iris[-idx, ]
table(iris_train$Species)
table(iris_test$Species)
library(e1071)
?naiveBayes
naive.result<-naiveBayes(iris_train, iris_train$Species,laplace=1)
naive.pred<-predict(naive.result, iris_test, type="class") 
table(naive.pred, iris_test$Species)
naive.pred
is(naive.pred)
is(iris_test$Species)
iris_test$Species
#################









library(nnet)
library(ModelMetrics)
library(caret)
rm(list = ls())
wine_data <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", header = F)
str(wine_data)
wine_data$V1 <- as.factor(wine_data$V1)
#train, test 데이터 셋 분리
train_idx <- sample(1:nrow(wine_data), nrow(wine_data) * 0.7)
train_data <- wine_data[train_idx, ]
test_data <- wine_data[-train_idx, ]
?expand.grid
grid <- expand.grid(.decay = c(0.3, 5e-4), .size = c(1:6)) 
grid

?train
fit <- train(V1 ~ . , data=train_data,        
             method = "nnet", maxit = 200, 
             tuneGrid = grid, trace = F)

fit <- train(V1 ~ . , data=train_data,        
             method = "nnet", maxit = 200, 
             tuneGrid = grid, trace = T)


best <- fit$bestTune
best[[1]]
wine_model <- nnet( V1 ~ ., data = train_data,  size = best[[1]], 
                    decay = best[[2]], maxit = 200)

pred <- predict(fit, newdata=test_data) 
pred
confusionMatrix(pred, test_data$V1) 











###############################################
rm(list = ls())

library(neuralnet)
library(ModelMetrics)
library(caret)
library(mlbench)

# 데이터 로딩 및 전처리
?BreastCancer
data(BreastCancer)

str(BreastCancer)
bc_data <- BreastCancer[, -1]

nrow(bc_data)

bc_data <- bc_data[complete.cases(bc_data), ]
nrow(bc_data)

bc_data1 <- as.data.frame(lapply(bc_data, function(x) as.numeric(x)), stringsAsFactors = F)
bc_data1
str(bc_data1)
bc_data1$Class <- ifelse(bc_data1$Class ==1, 0, 1)
bc_data1$Class

# train, test 데이터 셋 분리
train_idx <- sample(1:nrow(bc_data1), nrow(bc_data1) * .7)
train_data <- bc_data1[train_idx, ]
test_data <- bc_data1[-train_idx, ]

# 최적 모형 도출
h1 <- 2
h2 <- 2

grid <- expand.grid(1:h1,1:h2)
error <- c()

n = names(train_data)
n
f <- as.formula(paste("Class ~", paste(n[!n %in% "Class"], collapse = " + ")))
?paste
f

for (i in 1:NROW(grid)){
  net_bc <- neuralnet(f, 
                      data = train_data, 
                      err.fct="ce", 
                      linear.output=FALSE, 
                      likelihood=TRUE,
                      hidden = c(grid[i,1],grid[i,2]),
                      stepmax=1e6)
  
  y <- test_data$Class
  net_results <- compute(net_bc, test_data[, -ncol(test_data)])
  pred <- net_results$net.result
  p <- ifelse(pred >= 0.5, 1, 0)
  fu_err = mean(y != p)
  error = c(error, fu_err)
}


?ncol
ncol(test_data)

net_bc

y
net_results
pred
p

fu_err
error
grid
grid_err <- cbind(grid, error)
grid_err
grid_fin <- grid[which.min(error), ]
is(grid_fin)
# 모형 생성 밎 검정
?neuralnet

grid_fin<-as.vector(grid_fin)
is(grid_fin)

bc_model <- neuralnet(f,data=train_data,err.fct="ce",linear.output=FALSE, likelihood=TRUE,hidden = grid_fin,stepmax=1e6)

model_result <- compute(bc_model, test_data[, -ncol(test_data)])
pred <- model_result$net.result
p <- ifelse(pred >= 0.5, 1, 0)
confusionMatrix(test_data$Class, p)
