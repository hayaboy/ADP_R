library("mxnet")
library("stringr")
library("readtext")

batch.size <- 64
seq.len <- 32
num.hidden <- 24
num.rnn.layer <- 4
num.embed <- 16
num.round <- 5
drop.out <- 0.2
cell.type = "lstm"
ctx <- mx.cpu()

path="C:\\deeplearning\\input.txt"
data_prep <- make_data(path = path, seq.len=seq.len, dic=NULL)

X <- data_prep$features_array
Y <- data_prep$labels_array
dic <- data_prep$dic
rev_dic <- data_prep$rev_dic
vocab <- length(dic)

samples <- dim(X)[2] #number of observations
train.val.fraction <- 0.9#훈련자료 비율 

X.train.data <- X[, 1:as.integer(samples * train.val.fraction)]
X.val.data <- X[, -(1:as.integer(samples * train.val.fraction))]

X.train.label <- Y[, 1:as.integer(samples * train.val.fraction)]
X.val.label <- Y[, -(1:as.integer(samples * train.val.fraction))]

train_buckets <- list("100"=list(data=X.train.data, label=X.train.label))
eval_buckets <- list("100"=list(data=X.val.data, label=X.val.label))

train_buckets <- list(buckets = train_buckets, dic = dic, rev_dic = rev_dic)
eval_buckets <- list(buckets = eval_buckets, dic = dic, rev_dic = rev_dic)

train.data <- mx.io.bucket.iter(buckets = train_buckets$buckets, 
                                batch.size = batch.size, 
                                data.mask.element = 0, shuffle = TRUE)

eval.data <- mx.io.bucket.iter(buckets = eval_buckets$buckets, 
                               batch.size = batch.size,
                               data.mask.element = 0, shuffle = TRUE)


#모형 구조 설계 
rnn_graph <- rnn.graph.unroll(seq_len = seq.len,
                              num_rnn_layer = num.rnn.layer, 
                              num_hidden = num.hidden,
                              input_size = vocab,
                              num_embed = num.embed, 
                              num_decode = vocab,
                              masking = F, 
                              loss_output = "softmax",
                              dropout = drop.out, 
                              ignore_label = -1,
                              cell_type = cell.type,
                              output_last_state = F,
                              config = "one-to-one")

#초기치 선택 
initializer <- mx.init.Xavier(rnd_type = "gaussian", factor_type = "avg", magnitude = 3)
#최적화 방법 
optimizer <- mx.opt.create("adadelta", rho = 0.9, eps = 1e-5, wd = 1e-8,
                           clip_gradient = 5, rescale.grad = 1/batch.size)



#학습하기 
model <- mx.model.buckets(symbol = rnn_graph,
                          train.data = train.data, 
                          eval.data = eval.data, 
                          num.round = num.round, 
                          ctx = ctx, 
                          verbose = TRUE,
                          metric = mx.metric.Perplexity, 
                          initializer = initializer, 
                          optimizer = optimizer, 
                          batch.end.callback = NULL, 
                          epoch.end.callback = NULL)

