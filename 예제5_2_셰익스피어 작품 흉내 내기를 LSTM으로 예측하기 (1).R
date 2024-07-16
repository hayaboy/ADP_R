infer_raw <- c("a")
dic <- train_buckets$dic
rev_dic <- train_buckets$rev_dic
infer_split <- dic[unlist(strsplit(infer_raw, ''))]
infer_length <- length(infer_split)

symbol.infer.ini <- rnn.graph.unroll(seq_len = infer_length,
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
                                     output_last_state = T,
                                     config = "one-to-one")

symbol.infer <- rnn.graph.unroll(seq_len = 1,
                                 num_rnn_layer = num.rnn.layer, 
                                 num_hidden = num.hidden ,
                                 input_size = vocab,
                                 num_embed = num.embed, 
                                 num_decode = vocab,
                                 masking = F, 
                                 loss_output = "softmax",
                                 dropout = drop.out, 
                                 ignore_label = -1,
                                 cell_type = cell.type,
                                 output_last_state = T,
                                 config = "one-to-one")
#Inference with most likely term

predict <- numeric()
data = mx.nd.array(matrix(infer_split))

infer <- mx.infer.rnn.one.unroll(infer.data = data, 
                                 symbol = symbol.infer.ini,
                                 num_hidden = num.hidden,
                                 arg.params = model$arg.params,
                                 aux.params = model$aux.params,
                                 init_states = NULL,
                                 ctx = ctx)

pred_prob <- mx.nd.slice.axis(infer[[1]], axis=0, begin = infer_length-1, end = infer_length)
pred <- mx.nd.argmax(data = pred_prob, axis = 1, keepdims = T)
predict <- c(predict, as.numeric(as.array(pred)))


for (i in 1:100) {
  infer <- mx.infer.rnn.one.unroll(infer.data = pred, 
                                   symbol = symbol.infer,
                                   num_hidden = num.hidden,
                                   arg.params = model$arg.params,
                                   aux.params = model$aux.params,
                                   init_states = infer[-1],
                                   ctx = ctx)
  
  pred <- mx.nd.argmax(data = infer$loss_output, axis = 1, keepdims = T)
  predict <- c(predict, as.numeric(as.array(pred)))
  
}

predict_txt <- paste0(rev_dic[as.character(predict)], collapse = "")
predict_txt_tot <- paste0(infer_raw, predict_txt, collapse = "")
print(predict_txt_tot)


#Inference from random sample


set.seed(44)
predict <- numeric()

pred_prob <- as.numeric(as.array(mx.nd.slice.axis(
  infer[[1]], axis=0, begin = infer_length-1, end = infer_length)))
pred <- sample(length(pred_prob), prob = pred_prob, size = 1) - 1
pred=mx.nd.array(array(pred, dim = c(1,1)))
predict <- c(predict, as.numeric(as.array(pred)))

for (i in 1:100) {
  
  infer <- mx.infer.rnn.one.unroll(infer.data = pred, 
                                   symbol = symbol.infer,
                                   num_hidden =  num.hidden,
                                   arg.params = model$arg.params,
                                   aux.params = model$aux.params,
                                   init_states = infer[-1],
                                   ctx = ctx)
  
  pred_prob <- as.numeric(as.array(infer[[1]]))
  pred <- sample(length(pred_prob), prob = pred_prob, size = 1, replace = T) - 1
  pred=mx.nd.array(array(pred, dim = c(1,1)))
  predict <- c(predict, as.numeric(as.array(pred)))
}

predict_txt <- paste0(rev_dic[as.character(predict)], collapse = "")
predict_txt_tot <- paste0(infer_raw, predict_txt, collapse = "")
print(predict_txt_tot)