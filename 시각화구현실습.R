
library(ggplot2)


?ggplot

ggplot(data = iris,)


ggplot()


str(diamonds)


?diamonds


attach(diamonds)

k<-ggplot(diamonds, aes(carat, ..density..)) + geom_histogram(binwidth = 0.2)


k + facet_grid(. ~ cut)


install.packages("r2d3")
library(r2d3)

r2d3::domain()



??domain

