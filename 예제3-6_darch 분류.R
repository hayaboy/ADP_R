#=== darch의 설치 및 darch에 연결 ===#
install.packages("devtools")
library(devtools)
install_github("maddin79/darch@v0.12.0")
library(darch)                         

#=== 자료 불러오기 ===#
hyperurl <-'http://archive.ics.uci.edu/ml/machine-learning-databases/thyroid-disease/hypothyroid.data'
names <- c('target', 'age', 'sex', 'on_thyroxine', 'query_on_thyroxine', 
           'on_antithyroid_medication', 'thyroid_surgery', 'query_hypothyroid',
           'query_hyperthyroid', 'pregnant', 'sick', 'tumor', 'lithium', 'goitre',  
           'TSH_measured', 'TSH', 'T3_measured', 'T3', 'TT4_measured', 'TT4', 
           'T4U_measured', 'T4U', 'FTI_measured', 'FTI', 'TBG_measured', 'TBG')
hyper <- read.table(hyperurl, header=F, sep =',', col.names=names)

#=== 자료의 전처리 ===#  
hyper$target <- ifelse(hyper$target=='negative',0,1)
ind <- sapply(hyper, is.factor)
hyper[ind] <- lapply(hyper[ind], as.character)
hyper[ hyper == "?" ] = NA
hyper[ hyper == "f" ] = 0
hyper[ hyper == "t" ] = 1
hyper[ hyper == "n" ] = 0
hyper[ hyper == "y" ] = 1
hyper[ hyper == "M" ] = 0
hyper[ hyper == "F" ] = 1
hyper[ind] <- lapply(hyper[ind], as.numeric)
repalceNAsWithMean <- function(x) {replace(x, is.na(x), mean(x[!is.na(x)]))}
hyper <- repalceNAsWithMean(hyper)

#=== 훈련자료와 검정자료 만들기 ===#
set.seed(20180202)
n1 <- table(hyper$target)[1]  
n2 <- table(hyper$target)[2]  
ind1 <- sample(which(hyper$target==0), round(n1/2), replace=F)
ind2 <- sample(which(hyper$target==1), round(n2/2), replace=F)
tr_ind <- c(ind1,ind2)
hyper_tr <- hyper[tr_ind,]
hyper_te <- hyper[-tr_ind,]
hyper_tr$target <- as.factor(hyper_tr$target)
hyper_te$target <- as.factor(hyper_te$target)

#=== 딥러닝을 사용하여 심층 신경망을 학습하기 ===#
# darch는 RBM을 사용하여 예비학습을 수행하고 역전파 알고리즘 또는 
# Rprop를 사용하여 세부조정한다
darch_fit <- darch(hyper_tr[,2:26], hyper_tr[,1], rbm.numEpochs = 100,
                   rbm.batchSize = 2, rbm.lastLayer = F, 
                   layers = c(25,19,18,10,1), 
                   # 입력층, 은닉층1, 은닉층2, 은닉층3 및 출력층의 노드 수  
                   darch.fineTuneFunction = rpropagation, rprop.method = "iRprop+",
                   darch.batchSize = 2, retainData = F, darch.numEpochs = 100)

#=== 학습된 심층 신경망을 사용하여 예측하기 ===#
y_pred <- predict(darch_fit, newdata=hyper_te[,2:26], type="class")
mean(y_pred != hyper_te[,1])  #검정자료에 대한 오분류율 계산
#[결과]
#0.04743833
table(hyper_te[,1], y_pred, dnn=c("Observed","Predicted"))
#[결과]
#         Predicted
#Observed    0    1
#        0 1506   0
#        1   75   0 