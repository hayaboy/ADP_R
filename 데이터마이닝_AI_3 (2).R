rm(list=ls())

study_time<-c(2,4,6,8)

score<-c(81,93,91,97)

st_m<-mean(study_time)
sc_m<-mean(score)


st_pyuncha<- st_m - study_time


va_st<-sum(st_pyuncha^2)/(length(study_time)-1)
va_st
var(study_time)

sc_pyuncha<- sc_m - score

?sd


sd(study_time)
sd(score)

cov(study_time,score) / (sd(study_time) * sd(score))


cor(study_time, score)


plot(study_time,score)

?lm
lm(score ~ study_time)

install.packages("ggplot2")


ggplot2::Cars

?file.choose

?read.table

auto_mpg<-read.table(file.choose(),header = FALSE, na.strings = "?")
View(auto_mpg)

str(auto_mpg)
?colnames
colnames(auto_mpg)<-c('mpg','cylinders','displacement','horsepower','weight','acceleration','model year','origin','name')
str(auto_mpg)

library(dplyr)

auto_mpg4<-auto_mpg %>% select(mpg,weight,horsepower) %>% filter(horsepower!="?")

# %>%  ctrl + shift + M

#auto_mpg %>% select(mpg,weight,horsepower) %>% filter(horsepower!="?")

attach(auto_mpg4) # auto_mpg4¸¦ ¸Þ¸ð¸®¿¡ ·Îµù

colnames(auto_mpg4)

plot(mpg ~ weight)

lm(mpg ~ weight)

summary(lm(mpg ~ weight))
#Åë°èÇÐ ±â¹ÝÀÇ µ¥ÀÌÅÍ È¸±Í ºÐ¼®
#1.È¸±Í¸ðµ¨ÀÇ °¡Á¤
# 1)¼±Çü¼º(µ¶¸³º¯¼öÀÇ º¯È­¿¡ µû¶ó Á¾¼Ó º¯¼öµµ ÀÏÁ¤Å©±â·Î º¯È­)
# 2)µ¶¸³¼º(ÀÜÂ÷¿Í µ¶¸³º¯¼öÀÇ °ªÀÌ °ü·ÃµÅ ÀÖÁö ¾ÊÀ½)
# 3)µîºÐ»ê¼º(µ¶¸³º¯¼öÀÇ ¸ðµç °ª¿¡ ¿ÀÂ÷µéÀÌ ºÐ»êÀÌ ÀÏÁ¤)
# 4)ºñ»ó°ü¼º(°üÃøÄ¡µéÀÇ ÀÜÂ÷µé³¢¸® »ó°üÀÌ ¾ø¾î¾ß ÇÔ )
# 5)Á¤»ó¼º(ÀÜÂ÷Ç×ÀÌ Á¤±ÔºÐÆ÷¸¦ ÀÌ·ç¾î¾ß ÇÔ)
#residuals(¿¹Ãø°ª°ú ½ÇÁ¦°ªÀÇ Â÷ÀÌ)
#2.RÁ¦°ö°ªÀÌ 0.7ÀÌ»óÀÌ¸é ÃæºÐÈ÷ Àß ¸¸µé¾îÁø ¸ðµ¨ÀÌ¶ó°í ÆÇ´Ü.
#3. Adjusted R-squared(Á¶ÀýµÈ °áÁ¤°è¼ö) : ¸ðµ¨¿¡ ¹Ý¿µµÇ´Â µ¶¸³º¯¼öÀÇ ¼ýÀÚ°¡ Áõ°¡ÇÔ¿¡ µû¶ó °áÁ¤°è¼ö°¡ Ä¿Áö´Â ¼ºÇâ, ÀÌ¸¦ Á¶ÀýÇÏ±â À§ÇÔ . 
#4. F-statistic : MSR(Æò±ÕÈ¸±ÍÁ¦°ö)/Æò±Õ¿ÀÂ÷Á¦°ö(MSE) -> Ç¥ÁØ¿ÀÂ÷º¸´Ù È¸±Í½ÄÀ¸·Î ¼³¸íµÇ´Â ºÎºÐÀÌ ¾î´ÀÁ¤µµ ´õ ¸¹ÀºÁö 
plot(lm(mpg ~ weight))




colnames(auto_mpg)

auto_mpg5<-auto_mpg %>% select(mpg,displacement,horsepower,weight,acceleration) %>% filter(horsepower!="?")

auto_mpg5


lm(mpg ~ displacement + horsepower + weight + acceleration , data = auto_mpg5)



colnames(auto_mpg)<-c('mpg','cyl','disp','hp','wt','acc','model year','origin','name')

colnames(auto_mpg)
attach(auto_mpg)


car_lm<-lm(mpg ~ disp + hp + wt + acc, data =auto_mpg )

hp


summary(car_lm)




str(auto_mpg)

x_test<-c('mpg','disp','hp','wt','acc')

pairs(auto_mpg[x_test], cex=1,col=as.integer(auto_mpg$cyl))

str(auto_mpg)

?step

#AIC?Š” ? •ë³? ?´ë¡ ì„ ê¸°ë°˜?œ¼ë¡? ?•©?‹ˆ?‹¤. ?°?´?„°ë¥? ?ƒ?„± ?•œ ?”„ë¡œì„¸?Š¤ë¥? ?‚˜??€?‚´?Š” ?° ?†µê³? ëª¨ë¸?´ ?‚¬?š©?˜ë©? ê·? ?‘œ?˜„??€ ê±°ì˜ ? •?™•?•˜ì§€ ?•Š?Šµ?‹ˆ?‹¤. 
#?”°?¼?„œ ?”„ë¡œì„¸?Š¤ë¥? ?‚˜??€?‚´?Š” ëª¨ë¸?„ ?‚¬?š©?•˜ë©? ?¼ë¶€ ? •ë³´ê?€ ?†?‹¤?©?‹ˆ?‹¤. 
#AIC?Š” ì£¼ì–´ì§? ëª¨ë¸?— ?˜?•´ ?†?‹¤?˜?Š” ? •ë³´ì˜ ?ƒ??€? ?¸ ?–‘?„ ì¶”ì •?•©?‹ˆ?‹¤.
#ëª¨ë¸?´ ?†?‹¤?•˜?Š” ? •ë³´ê?€ ? ?„?ˆ˜ë¡? ?•´?‹¹ ëª¨ë¸?˜ ?’ˆì§ˆì´ ?†’?•„ì§‘ë‹ˆ?‹¤.
#ëª¨ë¸?— ?˜?•´ ?†?‹¤?˜?Š” ? •ë³´ì˜ ?–‘?„ ì¶”ì • ?•  ?•Œ AIC?Š” ëª¨ë¸?˜ ? ?•©?„ ??€ ëª¨ë¸?˜ ?‹¨?ˆœ?„± ê°„ì˜ ê· í˜•?„ ?‹¤ë£¹ë‹ˆ?‹¤ . 
#ì¦?, AIC?Š” ê³¼ì  ?•© ?œ„?—˜ê³? ê³¼ì†Œ ? ?•© ?œ„?—˜?„ ëª¨ë‘ ì²˜ë¦¬?•©?‹ˆ?‹¤.
step(car_lm, direction = "both")

