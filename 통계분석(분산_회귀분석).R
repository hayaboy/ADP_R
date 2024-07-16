
rm(list = ls())


fifa<-read.csv(file.choose())

str(fifa)

sum(is.na(fifa))

is(fifa$Height)

fifa$Height<-as.character(fifa$Height)

is(fifa$Height)

head(fifa$Height)

library(stringr)
stringr::str_split_fixed()

?regexpr()


head(fifa$Height)

regexpr("'",fifa$Height)-1

fifa$Height_cm<-as.numeric(substr(fifa$Height,1,regexpr("'",fifa$Height)-1))*30+as.numeric(substr(fifa$Height,regexpr("'",fifa$Height)+1, nchar(fifa$Height)))*2.5


?within


(x <- data.frame(val=c(1, 2, 3, 4, NA, 5, NA)))

x <- within(x, { val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)})
x


?character
test<-character(0)
test


fifa<-within(fifa,
             {
               Position_Class=character(0)
               Position_Class[ Position %in% c("LS", "ST", "RS", "LW", "LF", "CF", "RF", "RW") ]="Forward"
               Position_Class[ Position %in% c("LAM", "CAM", "RAM", "LM", "LCM", "CM", "RCM", "RM") ]="Midfielder"
               Position_Class[ Position %in% c("LWB", "LDM", "CDM", "RDM", "RWB", "LB", "LCB", "CB", "RCB", "RB") ]="Defender"
               Position_Class[ Position == "GK" ]="GoalKeeper"
             })


fifa$Position_Class<-factor(fifa$Position_Class, levels=c("Forward", "Midfielder", "Defender", "GoalKeeper"),
                            labels=c("Forward", "Midfielder", "Defender", "GoalKeeper"))



str(fifa)


fifa$Value

fifa$Position_Class


fifa_result<-aov(Value~Position_Class, data=fifa)

summary(fifa_result)

TukeyHSD(aov(Value~Position_Class, data=fifa))


fifa_twoway_anova <- aov(Value ~ Preferred_Foot + Position_Class + 
                           Preferred_Foot:Position_Class, data=fifa)
summary(fifa_twoway_anova)

str(fifa)
step(lm(Value~1, data=fifa), scope=list(lower=~1, 
                                        upper=~Age + Overall + Wage + Height_cm + Weight_lb), direction="both")
?step
