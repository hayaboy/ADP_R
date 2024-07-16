train <- read.csv('./train.csv', encoding = "cp949")
test  <- read.csv('./test.csv',encoding = "cp949")
full <- dplyr::bind_rows(train, test)



colnames(full) <- c("hour",
                    "weekday",
                    "gu",
                    "dong",
                    "sigungu",
                    "roadname",
                    "injury_degree",
                    "num_dead",
                    "num_wound_3",
                    "num_wound_2",
                    "num_wound_1",
                    "num_casualty",
                    "acc_parties",
                    "acc_situation",
                    "law_violation",
                    "road_condition",
                    "weather",
                    "weather_rain",
                    "roadtype",
                    "roadtype2",
                    "inf_car_model",
                    "inf_sex",
                    "inf_age",
                    "inf_injury",
                    "vic_car_model",
                    "vic_sex",
                    "vic_age",
                    "vic_injury",
                    "injury_degree2"
)



full$inf_age <- ifelse(full$inf_age =='98 이상' , 99, full$inf_age)
full$inf_age <- ifelse(full$inf_age =='미분류' , NA, full$inf_age)
full$inf_age <- ifelse(is.na(full$inf_age) , 0, full$inf_age)
full$inf_age <- as.integer(full$inf_age)


full$vic_age <- ifelse(full$vic_age =='98 이상' , 99, full$vic_age)
full$vic_age <- ifelse(full$vic_age =='미분류' , NA, full$vic_age)
full$vic_age <- ifelse(is.na(full$vic_age) , 0, full$vic_age)
full$vic_age <- as.integer(full$vic_age)


full_mca <- full[, c("weekday"     ,   "acc_parties"   , 
                     "law_violation",       "weather_rain",       
                     "inf_sex",              
                     "vic_sex",              "injury_degree2")]

summary(full_mca)

full_mca$injury_degree2 <- as.factor(full_mca$injury_degree2)

summary(full)
library(MASS)
?mca
mca2 = mca(full_mca, nf=5)
head(mca2$rs)

mca2_vars_df = data.frame(mca2$cs, Variable = rep(names(full_mca), full_mca))
?data.frame
plot(mca2)

princomp(full, cor=TRUE)
