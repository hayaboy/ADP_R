
# 주성분 분석(Principal Component Analysis)
data("USArrests")
str(USArrests)
nrow(USArrests)
rownames(USArrests)

apply(USArrests, 2, var)

# prcomp(), princomp() 두개가 있음, 둘 중 하나 사용, 알고리즘 차이

?princomp

?prcomp

USArrests_pca<-prcomp(USArrests, scale=TRUE) #데이터 표준화하겠다.

summary(USArrests_pca)
#4개의 축으로 주성분 표시
#분산비(첫번째 주성분 분석을 해보니 전체 분산의 62%를 차지한다.(즉 62%를 설명))
#누적비









print(USArrests_pca)


#y= -0.5358995Murder -0.5831836Assault -0.2781909UrbanPop - 0.5434321Rape 회귀계수 
#첫번째 주성분 식


plot(USArrests_pca, type="l")
#line
#스크리 플롯(주성분을 선택할 때 1미만인 애들은 선택안함), 엘보우 포인트까지 선택
#70~90%인 주성분을 선택한다.





biplot(USArrests_pca)
#빨간색이 로딩벡터(같은 방향이면 상관관계가 많음 )
#직교하면 상관관계가 0


names(USArrests_pca)

USArrests_pca$rotation <- -USArrests_pca$rotation  #-를 곱해서 방향을 바꾸어 줌 
USArrests_pca$x<- -USArrests_pca$x
biplot(USArrests_pca)


#빨간색은 주성분 벡터 
#범죄율과 관련된 켈리포니다,  네바다, 플로리다
#노스타코타가 법죄율이 낮다
#인구비율이 캘리포니아가 높다
#인구비율 적은 곳은 노스카롤리나, 미시시피
