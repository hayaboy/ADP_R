#=== h2o의 설치, 초기화 및 h2o에 연결 ===#
rm(list =ls())


install.packages("h2o")
library(h2o)
h2o.init()                            

#=== 자료 불러오기 ===#
hyperurl <-'http://archive.ics.uci.edu/ml/machine-learning-databases/thyroid-disease/hypothyroid.data'
names <- c('target', 'age', 'sex', 'on_thyroxine', 'query_on_thyroxine', 
           'on_antithyroid_medication', 'thyroid_surgery', 'query_hypothyroid', 
           'query_hyperthyroid', 'pregnant', 'sick', 'tumor', 'lithium', 'goitre', 
           'TSH_measured', 'TSH', 'T3_measured', 'T3', 'TT4_measured', 'TT4', 
           'T4U_measured', 'T4U', 'FTI_measured', 'FTI', 'TBG_measured', 'TBG')
hyper <- read.table(hyperurl, header=F, sep =',', col.names=names)

#=== 관측값의 개수와 변수의 개수 확인 ===#
n <- dim(hyper)[1]  
p <- dim(hyper)[2] 

#=== 두 그룹의 불균형 확인 ===# 
print(table(hyper$target))
print(prop.table(table(hyper$target)))

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
hyper_tr1 <- hyper[tr_ind,]
hyper_tr <- as.h2o(hyper_tr1) 
hyper_te1 <- hyper[-tr_ind,]
hyper_te <- as.h2o(hyper_te1)
hyper_tr$target <- as.factor(hyper_tr$target)
hyper_te$target <- as.factor(hyper_te$target)

#=== AUC를 이용한 심층 신경망의 모형선택 ===# 
h1 <- 20; h2 <- 20; h3 <- 20;
grid <- expand.grid(10:h1,10:h2,10:h3)

auc_mo <- c()
for (i in 1:NROW(grid))
{
  # 오토인코더를 사용한 예비학습 
  ae_pretr1 <- h2o.deeplearning(x = 2:26, activation="TanhWithDropout",
                                training_frame = hyper_tr, mini_batch_size=2, epoch=100,
                                model_id = "cc_autoencoder1", ignore_const_cols = FALSE,
                                hidden = c(grid[i,1],grid[i,2],grid[i,3]), autoencoder = TRUE, 
                                input_dropout_ratio=0.2, hidden_dropout_ratios=c(0.5,0.5,0.5)) 
  
  # 역전파 알고리즘을 이용한 세부조정 
  dnn_fit1 <- h2o.deeplearning(x = 2:26, y = 1, activation="TanhWithDropout",
                               training_frame = hyper_tr, mini_batch_size=2, epoch=100,
                               ignore_const_cols = FALSE, hidden = c(grid[i,1],grid[i,2],grid[i,3]),
                               pretrained_autoencoder = "cc_autoencoder1",
                               input_dropout_ratio=0.2, hidden_dropout_ratios=c(0.5,0.5,0.5))
  
  # 심층 신경망을 이용한 예측 
  perf1 <- h2o.performance(dnn_fit1, hyper_te)
  auc_mo[i] <- h2o.auc(perf1)
}

best_h <- which.max(auc_mo)
h1 <- grid[best_h,1]
h2 <- grid[best_h,2]
h3 <- grid[best_h,3]

#=== 최종 심층 신경망을 이용하여 예측하기 ===#
# 오토인코더를 사용한 예비학습 
ae_pretr2 <- h2o.deeplearning(x = 2:26, activation="TanhWithDropout",
                              training_frame = hyper_tr, mini_batch_size=2, epoch=100,
                              model_id = "cc_autoencoder2", ignore_const_cols = FALSE,
                              hidden = c(h1,h2,h3), autoencoder = TRUE, 
                              input_dropout_ratio=0.2, hidden_dropout_ratios=c(0.5,0.5,0.5)) 

# 역전파 알고리즘을 이용한 세부조정 
dnn_fit2 <- h2o.deeplearning(x = 2:26, y = 1, activation="TanhWithDropout",
                             training_frame = hyper_tr, mini_batch_size=2, epoch=100,
                             ignore_const_cols = FALSE, hidden = c(h1,h2,h3),
                             pretrained_autoencoder = "cc_autoencoder2",
                             input_dropout_ratio=0.2, hidden_dropout_ratios=c(0.5,0.5,0.5))

# 예측결과
h2o.performance(dnn_fit2, hyper_te)  
#[결과]
#MSE:  0.04656425
#RMSE:  0.2157875
#LogLoss:  0.2268013
#Mean Per-Class Error:  0.499004
#AUC:  0.4316689
#Gini:  -0.1366622 

h2o.confusionMatrix(dnn_fit2,hyper_te) 
#[결과]
#           0   1    Error       Rate
#0      1200 306 0.203187  =306/1506
#1         69   6 0.920000     =69/75
#Totals 1269 312 0.237192  =375/1581
