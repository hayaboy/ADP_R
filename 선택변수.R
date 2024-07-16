# 단계별 선택방법

# backward stepwise regression(backward selection(elimination))

library(mlbench)
data(BostonHousing2)

states
full.model<-lm(Murder~., data=states)
summary(full.model)

full.model1<-lm(Murder~Population+Illiteracy, data=states)

summary(full.model1)

full.model2<-lm(Murder~Population+Illiteracy+Income, data=states)
summary(full.model2)

# AIC(Akaike's an Information Criterion)
AIC(full.model, full.model1, full.model2)

reduced.model<-step(full.model, direction="backward")
summary(reduced.model)


# Forward stepwise regression

min.model<-lm(Murder~1, data=states)
fwd.model<-step(min.model, scope=(Murder~Population+Illiteracy+Income+Frost),direction="forward")
summary(fwd.model)


# Stepwize regression
both.model<-step(full.model, direction="both")
summary(both.model)

# all subset regression
library(leaps)
leap<-regsubsets(Murder~Population+Illiteracy+Income+Frost, data=states, nbest=2)
plot(leap, scale="adjr2")
plot(leap, scale="bic")

















