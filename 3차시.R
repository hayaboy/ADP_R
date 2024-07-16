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

library(dplyr)


customer2<-customer1 %>% mutate(Gender_binary=as.numeric(Gender), age_binary=as.numeric(Age), City_Category_numeric=as.numeric(City_Category),
                     Stay_In_Current_City_Years_numeric=as.numeric(Stay_In_Current_City_Years))


View(customer2)


?caret::dummyVars()


library(caret)

dummy<- dummyVars( ~ Gender+Age+City_Category+Stay_In_Current_City_Years, data = customer2)

?predict()

new_df<-data.frame(predict(dummy, newdata = customer2))

new_df




customer3<-cbind(customer1,new_df)

str(customer3)


#군집화

colnames(customer3)

customer_clust<- customer3 %>% select(-User_ID,-Product_ID,-Gender,-Age,-City_Category,-Stay_In_Current_City_Years,-product_all)




str(customer_clust)


customer_clust$Occupation <- as.numeric(customer_clust$Occupation)

customer_clust$Marital_Status <- as.numeric(customer_clust$Marital_Status)

customer_clust$Product_Category_1 <- as.numeric(customer_clust$Product_Category_1)

customer_clust$Product_Category_2 <- as.numeric(customer_clust$Product_Category_2)

customer_clust$Product_Category_3 <- as.numeric(customer_clust$Product_Category_3)


str(customer_clust)


set.seed(1234)

customer_B <- kmeans(customer_clust,3)



customer_B

#최적의 군집 


wssplot<-function(data, nc=15, seed=1234){
    wss<-(nrow(data)-1) * sum(apply(data, 2, var))
    for(i in 2:nc){
      set.seed(seed)
      wss[i]<-sum(kmeans(data, centers = i)$withinss)
    }
    plot(1:nc,wss, type="b", xlab="Number of Cluster", ylab="Within groups sum of squares")
  
}


wssplot(customer_clust)


customer_B_4 <- kmeans(customer_clust,4)




customer_B_4


# 클러스터별 특성 파악

kmeans_cl <- customer_B_4$cluster


kmeans_cl


customer4<-cbind(customer1, clust=kmeans_cl)



str(customer4)


write.csv(customer4,"F:/itgo3/ADP실기기출분석/3차시/final_customer.csv")


table(customer4$clust)



?xtabs()


xtabs(customer4$clust ~ customer4$Gender)

xtabs(customer4$clust ~ customer4$Gender)


xtabs( ~ customer4$clust + customer4$Gender)

xtabs(customer4$clust ~ customer4$Age)

xtabs( ~ customer4$clust + customer4$Age)


aggregate(Purchase ~ clust, customer4, mean)

aggregate(Purchase ~ Age, customer4, mean)


aggregate(Purchase ~ Gender, customer4, mean)






