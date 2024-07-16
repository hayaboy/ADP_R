install.packages("tree")
library(tree)

ls()

rm(list = ls())

set.seed(2000)

iris

N<-nrow(iris)


tr.idx<-sample(1:N, size = N*(2/3), replace = F)



train<-iris[tr.idx, ]


nrow(train)

test<-iris[-tr.idx, ]


nrow(test)

install.packages("tree")


dim(train)
dim(test)


train

test



?tree::tree()

colnames(train)

#formula    
#   종속 변수 ~ 독립변수 (.      +    )



tree_model<-tree(Species ~  .,  data = train )



plot(tree_model)
text(tree_model)

#최적 K를 구하는 방법


tree::cv.tree()

?cv.tree()

?prune.misclass

cv.tree(tree_model, FUN = prune.misclass )

plot(cv.tree(tree_model, FUN = prune.misclass))

best_tree_model<-prune.misclass(tree = tree_model, best =3)



best_tree_model

plot(best_tree_model)
text(best_tree_model)
