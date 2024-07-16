
#�ܼ� ȸ��
adv<-c(13,	8,	10,	15,	12,	15,	14,	15,	17,	19,	20,	21,	22,	21,	25)



adv
sales<-c(94,	70,	90,	100,	95,	100,	85,	95,	105,	105,	110,	105,	104	,105,	121)

length(sales)


plot(adv, sales)



#formula  ���Ӻ��� ~ ��������

#lm(formula)

linear_model<-lm(sales ~ adv)

# y=  2.186  * x + 62.929



summary(lm(sales ~ adv))


cor(adv, sales)^2



#������ ���ռ� Ȯ��
#1.������ ��������� �����Ѱ�? F ��跮�� p���� 0.05���� ������ ������ ȸ�ͽ���  ��������� ����
#2.ȸ�� ������� ���ǹ��Ѱ�? �ش� ����� t ��跮���� p���� Ȯ�� 
#3.���� ��� , 0���� 1������ ��, ���� ���� �������� ������ ȸ�ͽ��� �������� ����.


plot(lm(sales ~ adv))

#ȸ�� ������ ����(���������)
#1 ������(���������� ��ȭ�� ���� ���Ӻ����� ���� ũ��� ��ȭ)
#2.������(������ ���������� ���� ���õ� ���� ����)
#3.��л꼺(���������� ��� ���� ���� �������� �л��� ����)
#4.������(����ġ���� �����鳢�� ����� ����� ��)
#5.����(�������� ���Ժ����� �̷�� ��)


boxplot(linear_model$residuals)


#Residuals vs Fitted
#�׷������� x���� ȸ�͸����� ���� ������ y���̸�, y���� ������ ��Ÿ����.
#����ȸ�� ������ ������ ���Ժ����� �����ٴ� ���Լ��� �����ϹǷ�, �� �׷������� ������ ������ ���Ⱑ 0�� ������ ���¸� ������ ���� �̻����̴�. 
#Normal Q-Q plot�� ǥ��ȭ�� ������ Ȯ����, ���Լ� ������ �����Ѵٸ� 45�� ������ ������ �̷�� ���¸� ���� �Ѵ�.
#Scale-Location plot���� x���� ȸ�͸����� ���� ������ y���̸�, y ���� ǥ��ȭ�� ������ ��Ÿ����.
#ù��° �׷����� ���������� ���Ⱑ 0 �� ������ ���°� �����Ǵ� ���� �̻����̴�.
#�ش��������� �ָ� ������ ���� �ִٸ�, �� �������� ȸ�͸����� y���� �� �������� ������ ��Ÿ����. ���� �� ���� �̻�ġ�� ���ɼ��� �ִ�. 
#Residuals vs Leverage
#x���� ��������, y���� ǥ��ȭ�� ������
#���������� ����ġ�� �ٸ� ����ġ �������κ��� ������ ������ ��Ÿ���� ���������� �󸶳� �شܿ� ġ���� �ִ����� �����ش�.
#�׷����� ��ܰ� �ϴܿ��� ���� �Ÿ��� ������ ������ ǥ���Ǿ� �ִ�. ���� �Ÿ��� 0.5�̻��� ���� ������ �ۿ� �ִ� ����
#����ġ�� ũ�� ��� ����ġ�̴�.







#�ǻ� ���� ����

?rm
rm(list=ls())



data("iris")


n<-nrow(iris)

n


sample(c(1,2,3), 2)


c

1:n

?sample

train.idx<-sample(1:n, n*2/3)



train<-iris
head(train)
test<-iris[ -train.idx , ]



head(test)

nrow(train)

nrow(test)

install.packages("tree")
library(tree)


?tree



colnames(train)


# formula     ���Ӻ��� ~ �������� ( �������� �� .)

tree_model<-tree(Species ~ . , data = train)

summary(tree_model)


plot(tree_model)


text(tree_model)


?cv.tree()

?prune.misclass


plot(cv.tree(tree_model, FUN = prune.misclass))




#���� �ǻ� ���� Ʈ��
?prune.misclass()


prune.misclass(tree = tree_model, best =3)


best_tree_model<-prune.misclass(tree = tree_model, best =3)



best_tree_model



plot(best_tree_model)
text(best_tree_model)

#����ȸ��


#���� ȸ�� �������� ����:���� ������ ����
# ���⼭ y�� ��ȭ�� ȸ�͹��������� ǥ���ϰ� �����ϱ� ���� �ʿ��� ������������ ��� �����ؾ� �� ���ΰ��� ����
# ������ ������ ȸ�͸����� ������ �ִ� ���� ������ �� ���� ��Ģ�� ����
# 1. y�� ������ ��ĥ �� �ִ� ��� �������� x���� y�� ���� �����ϴµ� ������Ų��.
# 2. �����Ϳ� �������� x���� ���� �������� �����ϴµ� ���� ����� �䱸�ǹǷ�, ������ ���������� ���� ���� ���������� ���� 


# AIC(Akaike Information Criterion), BIC(Bayesian Information Criterion)�� �������� ���� ������ ȸ�� ������ ����
# �ַ� AIC ���
# �� ���� ���� ���� ������ ������ �������� �����Ѵ�.

#���1
#��� ������ ������ ȸ�ͺм�



#���2
#�������ù�(forward selection), �������Ź�(backward elimination), �ܰ躰 ���(stepwise method)




df<-read.csv(file.choose(), stringsAsFactors = F, na.strings = '?')
str(df)
summary(df)

colnames(df)

df<-na.omit(df)

str(df)

head(df[ , c(-9)])

df3<-df[ , c(-7,-8,-9)]
str(df3)

summary(lm( mpg ~  ., data = df2))


summary(lm( mpg ~  cylinders+displacement+horsepower+weight+acceleration+model.year+origin, data = df2))



lm_model<-lm( mpg ~  ., data = df2)

summary(lm_model)


#�ܰ躰 ���(stepwise method)
?step
#step(lm(���Ӻ��� ~ ��������, �����ͼ�Ʈ), scope=list(lower=~1,upper=~��������),direction=���� ���ù�� )
#scope�� �м��� �� ������ ������ ������ ���Ѵ�.
#���� ���� �ܰ�� lower���� 1�� �Է��ϸ� ������� �ǹ�, ���� ���� �ܰ踦 �����ϱ� ���ؼ��� ������������ ��� ���ָ� �ȴ�.
#direction�� ���� ���ù��(forward,backward,both)

colnames(df3)

step(lm( mpg ~  1,  data = df3), scope = list(lower=~1, upper=~cylinders+displacement+horsepower+weight+acceleration), direction = "both")



summary(lm( mpg ~ weight+ horsepower, data =df3 ))




summary(lm( mpg ~ weight+ horsepower+cylinders, data =df3 ))


