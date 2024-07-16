make_data <- function(path, seq.len=32, dic=NULL) {
  
  text_vec <- readtext(file=path)
  text_vec <- str_replace_all(string = text_vec$text, pattern = "[^[:print:]]", replacement = "")
  #[:print:]: letters, numbers, punctuation, and whitespace. 구두점 문자, 공백 문자
  text_vec <- unlist(strsplit(text_vec, ''))
  
  if (is.null(dic)) {
    char_keep <- sort(unique(text_vec))
  } else char_keep <- names(dic)[!dic == 0]
  
  ### Remove terms not part of dictionary
  text_vec <- text_vec[text_vec %in% char_keep]
  
  ### Build dictionnary
  dic <- 1:length(char_keep)
  names(dic) <- char_keep
  dic <- c(`¤` = 0, dic)
  
  ### reverse dictionnary
  rev_dic <- names(dic)
  names(rev_dic) <- dic
  
  ### Adjuste by -1 because need a 1-lag for labels
  num.seq <- as.integer(floor((length(text_vec)-1)/seq.len))
  
  features <- dic[text_vec[1:(seq.len*num.seq)]] 
  labels <- dic[text_vec[1:(seq.len*num.seq)+1]]
  
  features_array <- array(features, dim=c(seq.len, num.seq))
  labels_array <- array(labels, dim=c(seq.len, num.seq))
  
  return (list(features_array=features_array, labels_array=labels_array, dic=dic, rev_dic=rev_dic))
}

#평가지표 
mx.metric.custom_nd <- function(name, feval) {
  init <- function() {
    c(0, 0)
  }
  update <- function(label, pred, state) {
    m <- feval(label, pred)
    state <- c(state[[1]] + 1, state[[2]] + m)
    return(state)
  }
  get <- function(state) {
    list(name=name, value=(state[[2]]/state[[1]]))
  }
  ret <- (list(init=init, update=update, get=get))
  class(ret) <- "mx.metric"
  return(ret)
}

mx.metric.Perplexity <- mx.metric.custom_nd("Perplexity", function(label, pred) {
  label <- mx.nd.reshape(label, shape = -1)
  label_probs <- as.array(mx.nd.choose.element.0index(pred, label))
  batch <- length(label_probs)
  NLL <- -sum(log(pmax(1e-15, as.array(label_probs)))) / batch
  Perplexity <- exp(NLL)
  return(Perplexity)
})
