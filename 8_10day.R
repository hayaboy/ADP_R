

data("Titanic")

str(Titanic)

?Titanic


#knn

install.packages("class")
library(class)


?class::knn()


data("iris")


attach(iris)

set.seed(100)

N<-nrow(iris)

sample(c(1,2,3), 2)

1:N

train_idx<-sample(1:N, size = N*(2/3) , replace = FALSE)

train_idx

str(iris)

iris_train<-iris[train_idx , -5]

iris_test<-iris[-train_idx , -5]

nrow(iris_train)
nrow(iris_test)


head(iris_train)

head(iris_test)




iris_train_label<-iris[train_idx , 5]

iris_test_label<-iris[-train_idx , 5]


iris_train_label
iris_test_label



length(iris_train_label)
length(iris_test_label)





class::knn()




md<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=5)

md1<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=3)
md2<-knn(train = iris_train, test = iris_test, cl = iris_train_label, k=7)


md

install.packages("gmodels")
library(gmodels)

?gmodels::CrossTable()





CrossTable(iris_test_label, md)




1-(3/(14+15+2+1+18))

CrossTable(iris_test_label, md1)
CrossTable(iris_test_label, md2)




##SVM

install.packages("e1071")
library(e1071)



?e1071::svm

data("iris")

iris

svm_model<-svm( Species ~ . , data = iris  )



svm_model



summary(svm_model)


x<-iris[, -5]

y<-iris[,5]

pred<-predict(svm_model, x)


table(pred, y)


1-(4/150)


colnames(iris)


plot(svm_model, iris,  Petal.Width ~ Petal.Length , slice = list(Sepal.Width=3,Sepal.Length=4))

plot(svm_model, iris,  Petal.Width ~ Petal.Length)






#����������Ʈ

library(randomForest)
data(iris)

set.seed(1000)
N<-nrow(iris)
#�н� ������ ���� 2/3, ���� ������ ���� 1/3�� ����


tr.idx<-sample(1:N, size = N*2/3)


iris.train<- iris[tr.idx , -5]
iris.test<- iris[-tr.idx , -5]

iris.train

trainLabels<- iris[tr.idx, 5]
testLabels<- iris[-tr.idx, 5]





train<-iris[tr.idx, ]

test<-iris[-tr.idx, ]


?randomForest

rf<-randomForest(Species ~ . , data=train, importance=T, mtry=4)


#mtry �� Number of variables 

rf

randomForest::varImpPlot()

?varImpPlot()

varImpPlot(rf)




#PCA

#��, ��,��, ��

#��� 
#����


#�ּ��� �м��� �������� ����Ʈ�� ���� �� �������ִ� ������ �ּ����� ã�� ���
#n���� ����ġ�� p���� ������ ������ �����͸� ������谡 ���� k���� ������ ������ �����ͷ� ���





iris

cor(iris[1:4])



?prcomp()


iris.pca<-prcomp(iris[1:4], center = T, scale. = T)

iris.pca

#PC1=0.5210659 *Sepal.Length -0.2693474*Sepal.Width +0.5804131*Petal.Length +0.5648565*Petal.Width

summary(iris.pca)

plot(iris.pca, type='l', main="�ּ���")



#princomp�� ���� �ּ��� �м�
data("USArrests")

USArrests


pc1<-princomp(USArrests, cor = T)

pc1


summary(pc1)


plot(pc1, type="l")


#�ּ��� �м� ���� ������ ������ ��հ� ǥ������ Ȯ��


pc1$center
pc1$scale

#������ �������� �� �ּ��� ������ �⿩�ϴ� ����ġ(���)�� loadings�� ���� Ȯ��


pc1$loadings

#��1�ּ��п��� �� �������� UrbanPop�� ������ ������ 3�� ���˼��� ����� �⿩�� �ϰ� ������
#����ġ ���Ϳ� ������ ������ �� x���� ���Ͽ� ���Ǵ� ���� �ּ��� �� Ȥ�� �ּ��� ������ $scores�� ���� Ȯ��


pc1$scores



plot(pc1$scores[,1], pc1$scores[,2], xlab="Z1", ylab="Z2")
abline(v=0, h=0, col="gray")



#�ּ��� �м� ����� ���� ���� �������� �� ������ ����ġ n ������ ����� ��ġ
#�� p�� ���� ������ ���踦 ���󿡼� �Ѳ����� �ľ��� �� �ִ� �ð�ȭ����� �ִµ� ��
#�� ��ĵ�(biplot) ����̶�� �Ѵ�.
biplot(pc1, cex=0.7)

