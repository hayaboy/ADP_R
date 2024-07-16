install.packages("autoencoder")
library(autoencoder)

data(iris)
iris.x<-iris[,1:4]

set.seed(2018)

fit <- autoencode(as.matrix(iris.x),
                  nl=3,                 # 층의 개수 (디폴트 3: 입력층, 은닉층, 출력층)
                  N.hidden=2,          # 은닉노드의 개수
                  unit.type="logistic",   # 은닉층의 활성함수
                  rho=0.3,             # 희박성 매개변수 
                  lambda=1e-5,        # 가중치 감소 매개변수
                  beta=1e-5,           # 희박성 벌칙항 매개변수
                  epsilon=0.1,   # 정규분포 로부터 난수를 발생하여 가중치의 초기값으로 사용 
                  optim.method=c("BFGS"), #목적함수의 최소값을 찾기 위한 최적화 방법 설정
                  rescale.flag=T       #표준화 또는 척도화 여부 결정
)

pred <- predict(fit, as.matrix(iris.x), hidden.output = T)
new <- cbind(pred$X.output, iris[,5])
feature1 <- pred$X.output[,1]
feature2 <- pred$X.output[,2]

plot(feature1, feature2, col=new[,3], pch=new[,3])
legend("topleft", c("setosa", "versicolor","virginica"), col=1:3, pch=1:3)
