
#SOM 군집 분석을 수행하기 위해 
#5X4 SOM 군집 분석
install.packages("kohonen")

?kohonen

data("wines")



View(wines)

str(wines)
class(wines)
head(wines)

?scale()

wines.sc<-scale(wines)

kohonen::som()

?som
#  data
#인수
#grid : 결과를 나타내기 위한 그리드
#rlen : 학습횟수(기본값 :100)
#alpha : 학습률(기본 설정:0.05, 0.01에서 정지)
#radius: 이웃의 초기 반경
#toroidal : True일 경우 , 맵이 엣지가 조인됨
#keep.data : 반환데이터 저장


set.seed(7)





som.wines <- som(scale(wines), grid = somgrid(5, 5, "hexagonal"))
summary(som.wines)

xyf.wines <- xyf(scale(wines), vintages, grid = somgrid(5, 5, "hexagonal"))
summary(xyf.wines)


data(yeast)

str(yeast)

yeast.supersom <- supersom(yeast, somgrid(6, 6, "hexagonal"),
                           whatmap = c("alpha", "cdc15", "cdc28", "elu"),
                           maxNA.fraction = .5)

plot(yeast.supersom, "changes")





minmax_scaler <- function(x, a, b) {
  "
    x: data. numeric vector of values to be scaled
    a: desired minimum after scaling takes place
    b: desired maximum after scaling takes place
    
    e.g. f(c(1,2,3,4), 1, 17)
    [1]  1.000000  6.333333 11.666667 17.000000
    "
  (((b - a)*(x - min(x))) / (max(x) - min(x))) + a
}


minmax_scaler(c(1,2,3,4), 1, 17 )



library(kohonen)

train <- sample(1:150, 100) #무작위로 100개 추출 (학습데이터)
data("iris")

train_Set <-  list( x = as.matrix(iris[train,-5]), Species = as.factor(iris[train,5]))


gr <- somgrid(xdim = 3, ydim = 5, topo = "hexagonal") 

ss <- supersom(train_Set, gr, rlen = 200, alpha = c(0.05, 0.01)) #som 학습하기
#supersom() 함수의 rlen(학습횟수)을 200로 지정하였기 때문에 200회 SOM 알고리즘이 돌면서 각 뉴련의 가중치가 업데이트 됩니다. 학습을 거듭하면서 뉴런과 학습 데이터의 거리가 짧아지는 데, 이러한 경과를 plot() 함수 인자인 type를 "change" 로 설정하여 학습된 som 모델을 입력하면 시각적으로 나타낼 수 있습니다.

plot(ss, type="changes")
#plot() 함수의 type를 "count"로 지정하면 학습된 som 모델의 각 뉴런이 몇 개의 학습 데이터와 맵핑이 되는 지를 그림으로 확인할 수 있습니다. 이를 통해 som 모델의 질(quality)를 평가할 수 있는 하나의 지표가 됩니다. 즉 이상적으로 각 뉴런이 비슷한 갯수의 학습데이터와 맵핑이 되는 것이 좋으며 반대로 맵핑이 되지 않는 뉴런이 있다면 som 모델의 신경망 크기가 크다는 것는 것을 의미합니



plot(ss, type="count", main="Node Counts")
plot(ss, type="dist.neighbours", main = "SOM neighbour distances")

#plot() 함수의 type를 "dist.neighbours"로 설정하면 통상 통합거리메트릭스(U-matrix)를 그릴 수 있습니다. U-matirx는 각 뉴런의 이웃간 거리를 나타냅니다. 값이 높을 수록 그 뉴런은 이웃뉴런와 비유사(dissimilar)하다고 할 수 있습니다




plot(ss, type="codes")

#plot() 함수의 type를 codes로 설정하면 각 뉴런에 대한 학습 데이터의 가중치 기여율을 확인할 수 있습니다.7



