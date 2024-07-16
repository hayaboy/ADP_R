
#1)cabin, embarked 변수의 값 중 ""로 처리된 값을 NA로 바꾸고 아래의 테이블을 보고
#문자형, 범주형 변수들을 각각 character, factor형으로 변환
#또, 수치형 변수가 NA인 값을 중앙값으로 대체하고, 범주형 변수가 NA인 값을 최빈값으로
#대체하고 age 변수를 아래의 표와 같이 구간화하여 age_1이라는 변수를 생성하고 추가

#범주 0 0이상 10미만  
#     1 10이상 20미만
#     ~
#     8 80이상 90미만

rm(list = ls())

titanic<-read.csv(file.choose())

summary(titanic)

titanic$embarked<-ifelse(titanic$embarked=="", NA, titanic$embarked)

?table

table(titanic$embarked, useNA = "always")

titanic$cabin<-ifelse(titanic$cabin=="", NA, titanic$cabin)

table(titanic$cabin, useNA = "always")

summary(titanic)


str(titanic)


titanic$pclass<-as.factor(titanic$pclass)
titanic$survived<-as.factor(titanic$survived)
titanic$sex<-as.factor(titanic$sex)
titanic$embarked<-as.factor(titanic$embarked)

str(titanic)

#결측치 확인 및 결측치 대체


#install.packages("DMwR")
install.packages("https://cran.r-project.org/src/contrib/Archive/DMwR2/DMwR2_0.0.1.tar.gz", repos = NULL, type="source")

library(DMwR2)


DMwR2::centralImputation()

sum(complete.cases(titanic))

sum(is.na(titanic))
titanic2<-centralImputation(titanic)

sum(is.na(titanic2))




#age_1생성


titanic2<-within(titanic2, {
  age_1=integer(0)
  age_1[age>=0 & age<10]=0
  age_1[age>=10 & age<20]=1
  age_1[age>=20 & age<30]=2
  age_1[age>=30 & age<40]=3
  age_1[age>=40 & age<50]=4
  age_1[age>=50 & age<60]=5
  age_1[age>=60 & age<70]=6
  age_1[age>=70 & age<80]=7
  age_1[age>=80 & age<90]=8
  
})



titanic2$age_1<-factor(titanic2$age_1, levels = c(0,1,2,3,4,5,6,7,8), labels = c("10세미만","10대","20대","30대","40대","50대","60대","70대","80대"))


str(titanic2)

# 전처리가 완료된 titanic 데이터를 train(70%), test(30%)데이터로 분할, set.seed(12345)

# train 데이터로 종속 변수인 survived를 독립변수로 예측하는 분류모델을 3개 이상 생성하고 test 데이터에 대한 예측값을 
# 대한 예측값을 csv 파일로 각각 제출



# 데이터 분할
set.seed(12345)
idx<-sample(1:nrow(titanic2), size = nrow(titanic2)*0.7, replace = FALSE)
idx


train<-titanic2[idx, ]
test<-titanic2[-idx, ]

nrow(train)

nrow(test)


colnames(train)


train_1 <- train[ , c("pclass", "survived","sex", "sibsp","parch", "fare", "embarked")]

test_1 <- test[ , c("pclass", "survived","sex","sibsp","parch", "fare", "embarked")]


#의사결정 나무
library(rpart)
library(rpart.plot)

dt.model<-rpart(survived ~ . , method = "class", data = train_1, control = rpart.control(maxdepth = 4,minsplit = 15))

dt.model


rpart.plot::prp()

?prp


prp(dt.model, type = 4, extra = 2)



pred<-predict(dt.model, test_1[, -2], type = "prob")





write.csv(pred, "dT.csv")

getwd()

#랜덤포레스트



library(randomForest)

rf.model<-randomForest(survived ~  . , data = train_1)

print(rf.model)

pred<-predict(rf.model, test_1[ , -2], type = "prob")

#write.csv(pred, "파일명.csv")


#로지스틱 회귀
lg.model<-step(glm(survived ~ 1, data = train_1, family = "binomial"), direction = "both", scope = list(lower= ~1, upper= ~ pclass+sex+survived+sibsp+parch+fare+embarked))



summary(lg.model)

pred<-predict(lg.model, test_1[ , -2], type = "response")
pred

pred1<-as.data.frame(pred)

pred1$survived<-ifelse(pred1$pred<=0.5, pred1$survived<-"dead", pred1$survived<-"survived")

pred1

test_1

confusionMatrix(data = as.factor(pred.lg$survived), reference = test_1, positive = "survived")

#write.csv(pred1, "파일명.csv")


#성과분석

library(caret)
library(ROCR)

#DT 성과분석

pred.dt<-predict(dt.model, test_1[ , -2], type="class")

pred.dt

confusionMatrix(data = pred.dt, reference = test_1[,2], positive = "1")


pre.dt.roc<-prediction(as.numeric(pred.dt), as.numeric(test_1[,2]))

plot(performance(pre.dt.roc, "tpr", "fpr"))


performance(pre.dt.roc, "auc")@y.values

#랜덤포레스트 성과분석 


pred.rt<-predict(rf.model, test_1[ , -2], type="class")



confusionMatrix(data = pred.rt, reference = test_1[,2], positive = "1")


pre.rf.roc<-prediction(as.numeric(pred.rt), as.numeric(test_1[,2]))

plot(performance(pre.rf.roc, "tpr", "fpr"))


performance(pre.rf.roc, "auc")@y.values












