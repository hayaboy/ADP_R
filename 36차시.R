

adv
sales


?lm


lm ( sales ~ adv)

y_hat = 2.186*Xi + 62.929


#적합도 검정과 분산분석

# 이 회귀식이 표본을 얼마나 잘 나타내는지 혹은 그 설명력이 어느 정도인지 확인하는 과정 필요

#회귀선의 설명력(R^2) : 설명력은 0~1까지의 숫자로 나타내거나 몇 %의 설명력을 가지는지 확률로 표현


summary(lm ( sales ~ adv))

?qf


qf(0.95, 1,14)




?readxl::read_xlsx()

library(readxl)

read_excel(file.choose(),sheet ="Sheet2" )



df<-read_excel(file.choose(),sheet ="Sheet2" )

df<-as.data.frame(df)
str(df)


m_lm<-lm(df$satisfaction ~ df$display+df$convenience+df$utility)

#y_hat =  3.5136   +  0.2694 X1 + 0.2105 X2 + 0.1623 X3


summary(m_lm)





qf(0.95, 3,76)

