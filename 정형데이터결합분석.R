#정형데이터 추출하기


install.packages("openNLP")
install
install.packages("magrittr")
install.packages("http://datacube.wu.ac.at/src/contrib/openNLPmodels.en_1.5-1.tar.gz", repos=NULL, type="source")


?install.packages


getwd()
setwd("C:/Ex/R")
testText<-readLines("input.txt")
print(testText)
is(testText)
testText<-as.String(testText)
is(testText)


testText
wordAnn <- Maxent_Word_Token_Annotator() 
sentAnn <- Maxent_Sent_Token_Annotator()
personAnn <- Maxent_Entity_Annotator(kind = "person")
locationAnn <- Maxent_Entity_Annotator(kind = "location")
organizationAnn <- Maxent_Entity_Annotator(kind = "organization")



pipeline<-list(sentAnn,wordAnn,personAnn,locationAnn,organizationAnn)

testAnnotations<-annotate(testText,pipeline)



is(testAnnotations)




testDoc<-AnnotatedPlainTextDocument(testText,testAnnotations)




is(testDoc)
class(testDoc)
str(testDoc)


entities<-function(doc,kind){
  
  s<- doc$content
  a<-annotations(doc)[[1]]
  
  if(hasArg(kind)){
    k<-sapply(a$features,'[[',"kind")
    s[a[k==kind]]
  }
  else{
    
    s[a[a$type=="entity"]]
  }
  
}


entities(testDoc, kind="person")




entities(testDoc , kind = "location")


entities(testDoc , kind = "organization")

write.table(entities(testDoc,kind = "person"), "C:/Ex/mydata.csv", sep = ",")


