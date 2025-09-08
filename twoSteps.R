library(nlme)

# Loading simulated data
dt <- read.csv("jointProject-data.csv", header=T) # MONOLIX format
dt.BMI<- dt[dt$ytype==1,] # longitudinal data
dt.bin<- dt[dt$ytype==2,] # binary data

# Fitting BMI longitudinal data
# Fit model M1
fitM.1 <- lme(y ~ age + ageS, random = ~ 1 + age | id, data = dt.BMI,method="ML")
# Fit model M2
fitM.2 <- lme(y ~ age + ageS, random = ~ 1 + age + ageS | id, data = dt.BMI,method="ML")

# Extract Random Effects Model M1 
b0 <- ranef(fitM.1)[,1]+fixed.effects(fitM.1)[1]
b1 <- ranef(fitM.1)[,2]+fixed.effects(fitM.1)[2]
b2 <- rep(fixed.effects(fitM.2)[3],length(ranef(fitM.2)[,2]))

# Extract Random Effects Model M1 
b0.1 <- ranef(fitM.2)[,1]+fixed.effects(fitM.2)[1]
b1.1 <- ranef(fitM.2)[,2]+fixed.effects(fitM.2)[2]
b2.1 <- ranef(fitM.2)[,3]+fixed.effects(fitM.2)[3]


dtM1<-data.frame(id=dt.bin$id,y=dt.bin$y,GA=dt.bin$ancestria,b0=b0,b1=b1,b2=b2)

dtM2<-data.frame(id=dt.bin$id,y=dt.bin$y,GA=dt.bin$ancestria,b0=b0.1,b1=b1.1,b2=b2.1)

# Fitting binary data
fit_glm.M1<-glm(y ~ GA + b0 + b1, family=binomial, data=dtM1)
fit_glm.M2<-glm(y ~ GA + b0 + b1 + b2, family=binomial, data=dtM2)

summary(fitM.1)
8505.114
summary(fitM.2)
8384.07

summary(fit_glm.M1)
summary(fit_glm.M2)

