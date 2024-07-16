
#모비율에 대한 점 추정

# 주사위를 세번 굴려 나오는 짝수의 비율을 표본비율로하여 표본비율들의 분포를 구해 봅시다.

library(prob)
n<-3
smps.all<-rolldie(n)

smps.all

str(smps.all)


6*6*6 

!7%%2

!6%%2

is.even<-function(x){
  return (!x%%2)
}



var.p<-function(x){
  return(  sum((x-mean(x))^2 /length(x)))
}



p.even<-function(x, s.size=3){
  return (sum(is.even(x)) / s.size)
  
}

?apply

phat<-apply(smps.all, 1, p.even)



mean(phat)


(p.p<-0.5)


var.p(phat)


(p.p*(1-p.p)/3)




sqrt(var.p(phat))















