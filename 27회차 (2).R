

#R에 내장되어 있는 iris  데이터를 이용하여 종(Species)별로 꽃받침의 폭(Sepal Width)의 평균이 같은지 혹은 차이가 있는지를
#확인하기 위해 일원배치 분산분석을 수행하시오.



data("iris")

#검정을 수행하기에 앞서 설정할 수 잇는 가설
#귀무가설(H0) : 세 가지 종에 대해 Sepal.Width의 평균은 모두 같다.
#대립가설(H1) : 적어도 하나의 종에 대한 Sepal.Width의 평균값에는 차이


result<-aov(Sepal.Width ~ Species, data = iris)

summary(result)




TukeyHSD(result)
