data <- read.csv("/Users/SIMONA/Documents/Datafest/updated.csv", header = TRUE, sep = ',')
data$nutrition[is.na(data$nutrition)] <- "Okay"
data$nutrition <- factor(data$nutrition, levels = c("Poor", "Okay", "Excellent"))

for (i in 1:length(data$sleephours)){
  if (data$sleephours[i] >= 0 & data$sleephours[i] < 3){
    data$sleephours[i] = "No sleep"
  }
  else if (data$sleephours[i] >= 3 & data$sleephours[i] < 6){
    data$sleephours[i] = "Deprived"
  }
  else if (data$sleephours[i] >= 6 & data$sleephours[i] < 9){
    data$sleephours[i] = "Adequate"
  }
  else if (data$sleephours[i] >= 9 & data$sleephours[i] < 14.5){
    data$sleephours[i] = "Plenty"
  }
  else (data$sleephours[i] = "Coma")
}

data$sleephours <- factor(data$sleephours, levels = c("No sleep", "Deprived", "Adequate", "Plenty", "Coma"))
set.seed(1)
sample_size <- floor(0.8*nrow(data))
train_ind <- sample(seq_len(nrow(data)), size = sample_size, replace = FALSE)
train <- data[train_ind,]
test <- data[-train_ind,]
model <- lm(fatigue~ irritability + sleephours + sleepquality + pain + nutrition, data = data)
summary(model)
anova(model)
plot(predict(model), model$fatigue[-train_ind,], xlab="Predicted", ylab="actual")

data$prediction <- predict(model)

write.csv(data,"/Users/SIMONA/Documents/Datafest/model.csv")