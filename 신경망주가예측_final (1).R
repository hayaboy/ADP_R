rm(list = ls())
library(xlsx)
?xlsx
library(nnet)
?nnet
getwd()
?read.xlsx2
data<-read.xlsx2(file.choose(), 1)
str(data)
data$종가<-gsub(",","",data$종가)
data$종가
data$종가<-as.numeric(data$종가)
is(data$종가)
str(data)
df<-data.frame(일자=data$년.월.일, 종가=data$종가)
str(df)
View(df)

head(df)
is(df$일자)
str(df$일자)
df<-df[order(df$일자), ]
df
n<-nrow(df)
rownames(df)<-1:n
df

n1<-(df$종가-min(df$종가)) / (max(df$종가) - min(df$종가))

n1*0.9+0.05
range(n1*0.9+0.05)

norm<-n1*0.9+0.05

df<-cbind(df,종가norm=norm)
df
nrow(df)
?round()
round(n*0.8)
round(n*0.8,0)

n80<-round(n*0.8)
df[1:97, ]
df.learning<-df[1:97, ]
df.test<-df[98:n, ]
df.learning
df.test

input_node<-10
hidden_node<-10
output_node<-5
iter<-100
?t
getDataSet<-function(item, from, to, size){
  datafrme<-NULL
  to<- to - size +1
  for (i in from:to){
    start<-i
    end<-start+size-1
    temp<-item[c(start:end)]
    datafrme<-rbind(datafrme,t(temp))
  }
  return (datafrme)
  
}

in_learning<-getDataSet(df.learning$종가norm, 1, 92,input_node)
str(in_learning)
is(in_learning)
in_learning
out_learning<-getDataSet(df.learning$종가norm, 11, 97,output_node)

is(out_learning)

# 학습
model<-nnet(in_learning, out_learning, size=hidden_node,linout = FALSE,skip = FALSE, maxit=iter)

?nnet
#nnet(x , y, size, linout, rang, skip, maxit, MaxNWts)
#nnet(입력 데이터프레임, 목표값(레이블)의 데이터 프레임 ,)
# x 입력 데이터프레임
# y 목표값(레이블)의 데이터 프레임
#size 히든 노드의 갯수
# linout활성화함수 지정 , TRUE이면 선형함수, FALSE이면 로지스틱 함수(디폴트)
#rang 초기 가중치 값 [-rang, rang] 범위에서 설정됨 
#skip 입력 노드와 출력 노드의 연결 
#maxit 반복 학습 수, 디폴트는 100
#MaxNWts 노드간 최대 허용 가중치 수, 디폴트는 1000



is(model)


in_test<-getDataSet(df.test$종가norm, 1,19, input_node)


in_test

is(in_test)


predict(model,in_test)
predict(model,in_test, type='raw')
?predict

predict(object, newdata, type)

#object : nnet의 학습된 모형
#newdata: 입력 데이터
#type, raw로 지정하면 예측값이 행렬 형태로 변환 

predicted_values<-predict(model,in_test, type='raw')

Vpredicted <- (predicted_values - 0.05) / 0.9 * (max(df$종가) - min(df$종가)) + min(df$종가)
Vpredicted

Vreal <- getDataSet(df.test$종가, 11, 24,output_node )
Vreal

ERROR <- abs(Vreal - Vpredicted)
ERROR
MAPE<-rowMeans(ERROR/Vreal)*100

mean(MAPE)
in_forecasting <- df$종가norm[112:121]
predicted_values <- predict(model, in_forecasting, type="raw")
Vpredicted <- (predicted_values - 0.05) / 0.9 * (max(df$종가) - min(df$종가)) + min(df$종가)

plot(82:121, df$종가[82:121], xlab="기간", ylab="종가", xlim=c(82,126), ylim=c(1800, 2100), type="o")
lines(122:126, Vpredicted, type="o", col="red")
abline(v=121, col="blue", lty=2)
