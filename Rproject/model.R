moddata <- data.frame(read.csv("/Users/ethansarmiento/Desktop/datafest/model.csv") )
moddata$X <- NULL
acutechronicratio <- data$acutechronicratio; irritability <- data$irritability; sleephours <- data$pain
illness <- data$illness; menstruation <- data$menstruation; nutrition <- data$nutrition; sleepquality <- data$sleepquality
fatigue <- data$fatigue
mod <- lm(fatigue ~ acutechronicratio + irritability + sleephours + sleepquality+ illness + menstruation +nutrition, data=moddata)
anova(mod)
vif(mod)
write.dta(moddata, ("/Users/ethansarmiento/Desktop/datafest/model.dta"))