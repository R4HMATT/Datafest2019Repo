data <- read.csv("/Users/SIMONA/Documents/Datafest/updated.csv", header = TRUE, sep = ',')
data$illness[data$illness == 'Slightly Off'] <- "Yes"
data$nutrition[is.na(data$nutrition)] <- "Okay"
data$illness <- factor(data$illness, levels = c("No", "Yes"))
data$nutrition <- factor(data$nutrition, levels = c("Poor", "Okay", "Excellent"))
data$acutechronicratio[data$acutechronicratio >= 1.2] = "High"
data$acutechronicratio[data$acutechronicratio <= 0.8] = "Low"
data$acutechronicratio[data$acutechronicratio < 1.2 & data$acutechronicratio > 0.8] = "Medium"
data$acutechronicratio = factor(data$acutechronicratio, levels = c("Low", "Medium", "High"))
data$sleephours[is.na(data$sleephours)] <- 6
for (i in data$sleephours){
  if (data$sleephours[i] >= 0 & data$sleephours[i] < 3){
    sleephours[i] = "No sleep"
  }
  else if (sleephours[i] >= 3 & sleephours[i] < 6){
    sleephours[i] = "Deprived"
  }
  else if (sleephours[i] >= 6 & sleephours[i] < 9){
    sleephours[i] = "Adequate"
  }
  else if (sleephours[i] >= 9 & sleephours[i] < 14.5){
    sleephours[i] = "Plenty"
  }
  else {
    sleephours[i] = "Coma"
  }
}
data$sleephours[data$sleephours >= 0 & data$sleephours <= 3] = "No sleep"
data$sleephours[data$sleephours > 3 & data$sleephours <= 6] = "Deprived"
data$sleephours[data$sleephours > 6 & data$sleephours <= 9] = "Adequate"
data$sleephours[data$sleephours > 9 & data$sleephours <= 14.5] = "Plenty"
data$sleephours[data$sleephours > 14.5 & data$sleephours <= 22.5] = "Coma"
data$sleephours <- factor(data$sleephours, levels = c("No sleep", "Deprived", "Adequate", "Plenty", "Coma"))
# data <- data %>% 
#   mutate(nutrition = relevel(nutrition, ref = "Okay"))
str(data)
