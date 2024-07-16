rm(list = ls())
#실기 기출문제 1회 유형 분석

#EDA

#범주형/연속형
#범주형 : 명목형, 순서형
#연속형 : 등간형, 비율형

#결측치 처리
#0으로 대체

customer1<-read.csv(file.choose())

summary(customer1)
str(customer1)

customer1$Product_Category_2<-ifelse(is.na(customer1$Product_Category_2)==TRUE,0,customer1$Product_Category_2)

customer1$Product_Category_2

customer1$Product_Category_3<-ifelse(is.na(customer1$Product_Category_3)==TRUE,0,customer1$Product_Category_3)


customer1$Product_Category_3




str(customer1)

?transform()



customer1<-transform(customer1, product_all=Product_Category_1+Product_Category_2+Product_Category_3)
customer1



#데이터타입변경

customer1$User_ID<-as.character(customer1$User_ID)

customer1$Occupation<-as.factor(customer1$Occupation)
customer1$Marital_Status<-as.factor(customer1$Marital_Status)



customer1$Product_Category_1<-as.factor(customer1$Product_Category_1)
customer1$Product_Category_2<-as.factor(customer1$Product_Category_2)
customer1$Product_Category_3<-as.factor(customer1$Product_Category_3)

customer1$Product_ID<-as.factor(customer1$Product_ID)

customer1$Gender<-as.factor(customer1$Gender)
customer1$Age<-as.factor(customer1$Age)

customer1$City_Category<-as.factor(customer1$City_Category)


customer1$Stay_In_Current_City_Years<-as.factor(customer1$Stay_In_Current_City_Years)

str(customer1)


#더미변수화


















