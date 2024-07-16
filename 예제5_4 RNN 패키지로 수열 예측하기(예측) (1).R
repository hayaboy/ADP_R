x0<-array(0,c(1,20,10)) #make 0 filled array
out<-numeric(0)
xx=7 # 초기 입력을 7로 하고 이 후 20개 예측
for ( i in 1:20){
  x0[1,i,]<-as.numeric(xd[min(which(x==xx)),])
  yp<-predictr(m1, x0[1,1:i, , drop=F])
  (xx<-which.max(yp[,i ,]))
  out[i]<-xx
}
cat(out)
cat(x) # 결과 비교