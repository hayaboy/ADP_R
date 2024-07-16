install.packages("SAENET")
library(SAENET)

abaurl <-
  'http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data'
names <- c('sex', 'length', 'diameter', 'height', 'whole.weight',
          'shucked.weight', 'viscera.weight', 'shell.weight', 'rings')
data <- read.table(abaurl, header = F, sep = ',', col.names = names)

data$sex <-NULL
data$height[data$height==0] <- NA
data <- na.omit(data)
data_m <- as.matrix(data)

set.seed(2018)
n <- nrow(data)
train <- sample (1:n, 10, FALSE)

fit <- SAENET.train(X.train=data_m[train,], n.nodes = c(5,4,2),
                    unit.type = "logistic", lambda = 1e-5, beta = 1e-5, rho = 0.07,
                    epsilon =0.1, max.iterations = 100, optim.method = c("BFGS"),
                    rel.tol=0.01, rescale.flag = TRUE, rescaling.offset = 0.001)

feature1 <- fit [[3]]$X.output[,1]
feature2 <- fit [[3]]$X.output[,2]

trn <- c(1,2,3,4,5,6,7,8,9,10)
plot(feature1, feature2, type ="p", pch=1, xlab = "Feature 1", ylab ="Feature 2", 
     ylim=c(0.488562,0.488573))
text(feature1, feature2, labels=as.character(trn), pos=3) 

