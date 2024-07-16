

fifa<-read.csv(file.choose())
str(fifa)

fifa$Height

?split()
library("stringi")
?stringr::str_split_fixed()
library("stringr")

fifa$Height

split_fifa_height<-str_split_fixed(fifa$Height,pattern = "'",2)




Height_cm<-as.numeric(split_fifa_height[,1])*30 + as.numeric(split_fifa_height[,2])*2.5

#1)
Height_cm



po<-fifa$Position

?reshape2::melt()

po


if(po[1] =="LS" || po[1] =="ST" || po[1] =="RS" || po[1] =="LW" || po[1] =="LF" || po[1] =="CF" || po[1] =="RF" || po[1] =="RW"){
  fifa$Position_Class[1]<-"Forward"  
}


po[1] =="LS" || po[1] =="ST"

fifa$Position_Class[1]

po[1]

fifa$Position_Class<-fifa$Position[i]

for (i in 1:10){
  print(i)
}

length(length(po))


for (i in 1:length(po)) {
  if(po[i] =="LS" || po[i] =="ST" || po[i] =="RS" || po[i] =="LW" || po[i] =="LF" || po[i] =="CF" || po[i] =="RF" || po[i] =="RW" ){
    fifa$Position_Class[i]<-"Forward"  
  }else if(po[i] =="LAM" || po[i] =="CAM" || po[i] =="RAM" || po[i] =="LM" || po[i] =="LCM" || po[i] =="CM" || po[i] =="RCM" || po[i] =="RM"){
    fifa$Position_Class[i]<-"Midfielder"  
  }else if(po[i] =="LWB" || po[i] =="LDM" || po[i] =="CDM" || po[i] =="RDM" || po[i] =="RWB" || po[i] =="LB" || po[i] =="LCB" || po[i] =="CB" || po[i] =="RCB"  || po[i] =="RB" ){
    fifa$Position_Class[i]<-"Defender"  
  }else if(po[i] =="GK" ){
    fifa$Position_Class[i]<-"GoalKeeper"  
  }
}



fifa$Position_Class<-factor(fifa$Position_Class)



#2)
str(fifa)

?var.test()


str(fifa$Value)

install.packages("dplyr")
library(dplyr)




#fifa %>% group_by(fifa$Position_Class)

#fifa %>% group_by(fifa$Position_Class) %>% summarise(mean(fifa$Value))

#새로 생성한 Position_Class 변수의 각 범주에 따른
#Value 변수 평균값의 차이 비교하는 일원배치 분산분석(등분산성 가정 만족)
#귀무 가설 : 4가지 포지션에 대해 Value의 평균은 모두 값다.
#대립 가설 : 적오도 하나의 포지션에 대한 Value의 평균값에는 차이가 있다.

?aov()


?TukeyHSD

TukeyHSD(aov(Value ~ Position_Class, data = fifa))


fifa_result<-aov(Value ~ Position_Class, data = fifa)
fifa_result

summary(fifa_result)

colnames(fifa)

?aov

fifa_twoway_anova <-aov(Value ~  Preferred_Foot + Position_Class + Preferred_Foot:Position_Class, data = fifa)

summary(fifa_twoway_anova)















