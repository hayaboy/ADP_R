#10명을 표본으로 추출하여 머리 둘레를 측정한 결과는 다음과 같습니다.
#520,498,481,512,515,542,520,518,527,526

smp <- c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)

?qt
1-0.05/2

qt(0.975,9)

ci.t<-function(x, alpha=0.05){
  n<-length(smp)
  m<-mean(x)
  s<-sd(x)
  t<-qt(1-(alpha/2), df=n-1)
  ll<-m - t*(s/sqrt(n))
  ul<-m + t*(s/sqrt(n))
  ci<-c(1-alpha,ll,m,ul)
  names(ci)<-c( "Confidence Level", "Lower limit", "Mean", "Upper limit" )

  return (ci)
  
}


ci.t(smp)
ci.t(smp, 0.1)
