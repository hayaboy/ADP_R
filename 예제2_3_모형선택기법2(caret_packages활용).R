install.packages('ModelMetrics') # caret 패키지를 활용한 최적 모형 선택
library(nnet); library(caret)
library(ModelMetrics)
set.seed(200) 

# 훈련자료와 검정자료 만들기
# createDataPartition 함수는 자료를지정한 확률로 분할 후 행 번호 반환

ind1=createDataPartition(iris$Species, p=.7, list=FALSE) 
train1=iris[ind1,]
test1=iris[-ind1,]

# 최적 모형을 찾기 위해 학습 시 필요한 인숫값의 목록 나열
my.grid <- expand.grid(.decay = c(0.3, 5e-4), 
                       .size = c(1, 2, 3)) 
# train() 함수를 통해 최적 모형 학습
fit1 <- train(Species~. , data=train1, 
              method = "nnet", maxit = 200,
              tuneGrid = my.grid, trace = F)
pred1 <- predict(fit1, newdata=test1)

conf1 <- confusionMatrix(pred1, test1$Species) # 정확도, 민감도, 특이도 등 산출
probs1 <- predict(fit1, newdata=test1, type='prob') # 결과를 확률로 반환
# ■ 모형 선택 기법 2 결과 확인
conf1
probs1