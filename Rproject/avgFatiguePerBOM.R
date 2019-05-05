data <- read.csv("./../updated.csv", header = TRUE, sep = '\t')

data$nutrition[is.na(data$nutrition)] <- "Okay"
data$nutrition <- factor(data$nutrition, levels = c("Okay", "Poor", "Excellent"))
data$sleephours <- cut(data$sleephours, c(0, 3, 6, 9, 14.5, Inf))
levels(data$sleephours) <- c("No Sleep", "Deprived", "Adequate", "Plenty", "Coma")
data$sleephours <- relevel(data$sleephours, ref = "Adequate")
levels(data$sleephours)
str(data)
model <- lm(fatigue~ irritability + sleephours + sleepquality + pain + nutrition, data = data)
summary(model)
anova(model)
data$prediction <- predict(model)
data$residuals <- model$residuals
par(mfrow = c(2,2))
plot(model)
write.csv(data,"./model.csv")

install.packages("tidyverse")
library(tidyverse)

data
data = data %>% rename("PlayerID"="playerid", "Date" = "date")


bom <- read.csv("./../bestofmyselfnormalized.csv", header = TRUE, sep = ',')

bom = bom %>% select(-X)

fatigue <- read.csv("./../standardized_fatigue_scores_v2.csv", header = TRUE, sep = ',')

predictedFatigBOM = data %>% inner_join(bom, by = c("Date", "PlayerID"))

fatigue


bom = bom %>% rename("PlayerID"="playerid", "Date" = "date")

predictedFatigBOM %>% group_by(BOM) %>% 
  summarize(value = sum(prediction), num = n(), avgFatigue = value/num)





