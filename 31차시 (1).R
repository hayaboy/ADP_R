#모집단이 두 개인 경우


#모집단이 두 개인 경우는 ‘서로 독립인 두 집단’과 ‘대응을 이루는 두 집단’이 있습니다. 


#1) 서로 독립인 두 모집단 : 평균 차이검정
"
서로 독립인 두 집단 : 독립표본
각 집단을 변수에 의해 두 개로 구분할 때 서로 영향을 끼치지 않는 집단입니다.
예) 성별 변수에 의해 나눠진 남자 아이와 여자 아이의 몸무게

가정

서로 독립인 두 모집단은 정규분포를 이룬다.
‘정규성’이라 하며, 이를 만족하는지 검정해야 합니다.  ‘정규성’은 만족하는 것으로 가정하겠습니다.
두 집단의 분산은 서로 동일하다
‘등분산성’이라 하며, R의 분산 비교 검정함수를 이용하여 분산이 서로 동일한지 검정해 봅시다.

"
##실습##
#유의 수준 0.05로 하여 여아와 남아의 분산이 서로 동일한지 검정
#영가설 :두 집단의 분산은 서로 동일하다.
#대립가설 : 두 집단의 분산은 동일하지 않다.

rm(list=ls())

data <- read.table(file.choose(), header=T)

par(mar=c(2, 1, 1, 1))

length(data$weight[data$gender==1])
#1번 여아, 2번 남아 
hist(data$weight[data$gender==1], xlim=c(1500, 4500), ylim=c(0, 12), col="orange", border=NA, main="", xlab="", ylab="", axes=F)

hist(data$weight[data$gender==2], density=10, angle=45, add=TRUE, col="green")

?axis
axis(1)

abline(v = mean(data$weight[data$gender==1]), lty=3, lwd=1.5, col="orange")
abline(v = mean(data$weight[data$gender==2]), lty=1, lwd=1.5, col="green")
legends = c("여자아이", "남자아이")
legend("topright", legend=legends, fill=c("orange", "green"), density=c(NA, 20))


var.test(data$weight ~ data$gender)

"
판정
기각역을 이용한 판정 : 검정통계량이 채택역 구간인  (0.39, 2.36) 사이에 있어 영가설을 채택합니다.
유의확률을 이용한 판정 : 유의확률은 0.07526으로 유의수준 0.05보다 크므로 영가설을 채택합니다.

남아와 여아 몸무게의 분산의 동일성을 검정한 결과 두 집단의 분산이 서로 동일하다는 가정을 만족하는 것으로 판단됩니다.
이로부터 두 집단의 분산은 동일함을 확인하고 평균 검정을 실시해 봅시다.

가설수립 
영가설 : 남아와 여아 신생아의 몸무게의 평균은 서로 같다. (차이가 없다)
대안가설 :  여아 신생아의 몸무게의 평균이 남아 신생아의 몸무게의 평균보다 작다.

"
qf(0.975, df1=17, df2=25)


t.test(data$weight ~ data$gender, mu=0, alternative="less", var.equal=TRUE)

#유의확률 0.068은 유의수준 0.05보다 크므로 영가설을 채택합니다.








"
서로 대응인 두 집단 : 대응표본
주로 ‘처리’ 효과를 알기 위해 사용합니다.
동일한 관찰 대상으로 부터 특정 ‘처리’를 실시하기 이전에 관찰되는 모집단과 ‘처리’ 이후에 관찰되는 모집단의 두 모집단입니다.
예) 신경성 식욕부진증 치료제 투약 이전과 이후의 체중


"

#17명의 관찰대상으로부터 식욕부진증 치료제 투여 이전의 사전관찰(Pre) 및 투여 이후 사후관찰(Post)을 변수로 저장한 자료입니다.

"
가설 수립
서로 대응인 두 집단의 평균 차이 검정에서 사용하는 대안가설은 다음과 같습니다.
양쪽 검정은 차이가 있음을,
(왼쪽) 한쪽 검정은 차이의 평균이 0보다 작음을,
즉, 처리로 인해 사후 관찰값이 줄어듦을 나타냅니다.
(오른쪽) 한쪽 검정은 차이의 평균이 0보다 큼을 대안가설로 합니다.
즉, 처리로 인해 사후 관찰값이 증가함을 나타냅니다.

영가설 : 신경성 식욕부진증 치료요법은 효과가 없다. 

(효과가 없을 경우 체중의 변화는 없다)
대안가설 : 신경성 식욕부진증 치료요법은 효과가 있다.
(효과가 있을 경우 체중이 증가하여, 사전-사후는 음수)

"

rm(list=ls())
data <- read.csv(file.choose(), header=T)


str( data )

n <- length(data$Prior - data$Post)
n

m <- mean( data$Prior - data$Post )
m


s <- sd (data$Prior - data$Post)
s


t.t<-m/(s/sqrt(n))
t.t

t.test(data$Prior, data$Post, paired=T, alternative="less")

"
결론
새롭게 개발한 신경성 식욕부진증 치료요법의 효과가 있는지 알아보기 위해 
17명의 여학생을 대상으로 
치료요법 시행 전 몸무게를 측정하고 시행 후 몸무게를 측정하여 차이를 구한 결과 
7.265 ± 7.157(lbs)로 나타났습니다. 
이로부터 유의수준 0.05에서 검정통계량은 -4.185(p-value=0.00035 혹은 p-value < 0.000)로 나타나
 “신경성 식욕부진증 치료요법은 효과가 있다.”는 통계적으로 유의한 결론을 얻을 수 있었습니다. 
즉 식욕부진중 치료요법은 효과가 있는 것으로 판단됩니다.

"
