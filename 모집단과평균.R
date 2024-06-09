R.version
#4.4

install.packages("pkgbuild")

pkgbuild::has_build_tools(debug = TRUE)


#install.packages('prob')
#library(prob)


install.packages('combinat')

install.packages(c("timeDate", "timeSeries", "fBasics", "fOptions"))

install.packages("fAsianOptions", repos = "http://R-Forge.R-project.org")

#install.packages('fAsianOptions')

install.packages("D:/down/prob_1.0-1.tar.gz", repos = NULL, type = "source")
