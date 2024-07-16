
height<-c(166,168,170,172,174)
install.packages("scales")
library(scales)
scales::rescale()

rescale(height)



#웨스트 록스베리 데이터를 학습데이터, 검증데이터, 평가데이터로 분할

set.seed(1)
#학습데이터를 60% 검증데이터를 40%



dim(WestRoxBury)[1]*0.6

train.rows<-sample(rownames(WestRoxBury), dim(WestRoxBury)[1]*0.6)


train.rows

train.rows<-WestRoxBury[train.rows, ]


head(train.rows)



valid.rows<-setdiff(rownames(WestRoxBury),train.rows )


valid.data<-WestRoxBury[valid.rows, ]


#training 50% validation 30% test 20%


dim(WestRoxBury)

5802*0.5  #2901
5802*0.3  #1741
5802*0.2  #1160
  
train.rows<-sample(rownames(WestRoxBury), dim(WestRoxBury)[1]*0.5)

valid.rows<-sample(setdiff(row.names(WestRoxBury), train.rows), dim(WestRoxBury)[1]*0.3)

test.rows<-setdiff(row.names(WestRoxBury), union(train.rows,valid.rows))


length(train.rows)

length(valid.rows)

length(test.rows)

train.data<-WestRoxBury[train.rows, ]
valid.data<-WestRoxBury[valid.rows, ]
test.data<-WestRoxBury[test.rows, ]

str(WestRoxBury)

