

admission<-read.csv(file.choose(),header = TRUE)

str(admission)

#sum(is.na(admission))

cor(admission)

#TOEFL 83.6  CGPA 83.3  Chance_of_Admit 80.2

attach(admission)
cor.test(GRE,Chance_of_Admit)

?cor()

#coplot(GRE ~ TOEFL, admission)

??corelation


install.packages("corrgram")
library(corrgram)

?corrgram()
corrgram(admission,upper.panel=panel.conf)

library(nlme)

matrix(admission)
corMatrix()

plot(admission)

colnames(admission)

step(lm(Chance_of_Admit ~ GRE+TOEFL+Univ_Rating+SOP+LOR+CGPA+Research, data=admission))


summary(lm(Chance_of_Admit ~ GRE+TOEFL+Univ_Rating+SOP+LOR+CGPA+Research, data=admission))

l_m<-lm(Chance_of_Admit ~ GRE+TOEFL+Univ_Rating+SOP+LOR+CGPA+Research, data=admission)

plot(lm(Chance_of_Admit ~ GRE+TOEFL+Univ_Rating+SOP+LOR+CGPA+Research, data=admission))

resid(l_m)




install.packages("lmtest")
lmtest::dwtest(l_m)
resid()




shapiro.test(resid(l_m))








titanic_data<-read.csv(file.choose())



sum(is.na(titanic_data))


install.packages("DWmR")


