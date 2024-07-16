train <- read.csv('./train.csv', encoding = "cp949")
test  <- read.csv('./test.csv',encoding = "cp949")
full <- dplyr::bind_rows(train, test)

#reference

#http://www.sthda.com/english/articles/22-principal-component-methods-videos/71-mca-in-r-using-factominer-quick-scripts-and-videos/     (MCA)
#http://www.sthda.com/english/articles/16-r-packages/28-factoinvestigate-r-package-automatic-reports-and-interpretation-of-principal-component-analyses    (MCA)
#http://www.gastonsanchez.com/visually-enforced/how-to/2012/10/13/MCA-in-R/ (MCA)

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


full$vic_age
full_a <- full[, c("vic_age", "inf_age")]
full <- within( full, { 
   vic_age_cd = character(0) 
   vic_age_cd[ vic_age >=0 & vic_age <20 ] = "0~20" 
   vic_age_cd[ vic_age >=20 & vic_age <40 ] = "20~40" 
   vic_age_cd[ vic_age >=40 & vic_age <60 ] = "40~60" 
   vic_age_cd[ vic_age >=60 & vic_age <80 ] = "60~80" 
   vic_age_cd[ vic_age >=80 & vic_age <100 ] = "80~99이상" 
   vic_age_cd = factor(vic_age_cd,  
                       level = c("0~20", "20~40", "40~60",  
                                                        "60~80", "80~99이상")) 
  })

full <- within( full, { 
  inf_age_cd = character(0) 
  inf_age_cd[ inf_age >=0 & inf_age <20 ] = "0~20" 
  inf_age_cd[ inf_age >=20 & inf_age <40 ] = "20~40" 
  inf_age_cd[ inf_age >=40 & inf_age <60 ] = "40~60" 
  inf_age_cd[ inf_age >=60 & inf_age <80 ] = "60~80" 
  inf_age_cd[ inf_age >=80 & inf_age <100 ] = "80~100" 
  inf_age_cd = factor(inf_age_cd,  
                      level = c("0~20", "20~40", "40~60",  
                                "60~80", "80~99이상")) 
})

full

library(tidyverse)
library(stringr)
library(FactoMineR)
library(ggplot2)
library(ggthemes)
library(ggmosaic) # devtools::install_github("haleyjeppson/ggmosaic")
library(extrafont)
library(forcats)
loadfonts()

colnames(full3)

colSums(is.na(full))
full[is.na(full)] 
full

full_mca <- full[, c("hour"      ,   "inf_age",   "vic_age", "weekday"     ,   "acc_parties"   , 
                            "law_violation",       "weather_rain",       
                             "inf_sex",              
                             "vic_sex",              "injury_degree2")]
length(colnames(full_mca))
str(full_mca)

?MCA
full.mca <- MCA(full_mca, 
               quanti.sup = 1:3, # Supplementary quantitative variable
               quali.sup = 4:9,  # Supplementary qualitative variable
               graph=FALSE)

Investigate(full.mca, file = "MCA3.Rmd", document = c("word_document", "pdf_document"), 
            parallel = TRUE)

getwd()
summary(full_ca_result)

par(mfrow=c(1,1))
full.mca$eig
full_ca_result$eig

eig.val<- full_ca_result$eig

eig.val3 <- full.mca$eig
barplot(eig.val[, 2], 
        names.arg = 1:nrow(eig.val), 
        main = "Variances Explained by Dimensions (%)",
        xlab = "Principal Dimensions",
        ylab = "Percentage of variances",
        col ="steelblue")



barplot(eig.val3[, 2], 
        names.arg = 1:nrow(eig.val3), 
        main = "Variances Explained by Dimensions (%)",
        xlab = "Principal Dimensions",
        ylab = "Percentage of variances",
        col ="steelblue")


# Add connected line segments to the plot
lines(x = 1:nrow(eig.val), eig.val[, 2], 
      type = "b", pch = 19, col = "red")


plot(full_ca_result, autoLab = "yes")
biplot(full_ca_result)
par(mfrow=c(1,2))

full_ca_result

install.packages("FactoInvestigate")
library("FactoInvestigate")

full_mca$injury_degree2 <- as.factor(full_mca$injury_degree2)
full_ca_result$eig
is(full_ca_result$col$coord)
is(full_mca)
summary(full_ca_result)
full_ca_result_df = data.frame(full_ca_result$col$coord, Variable = rep(names(full_mca),full_mca))
