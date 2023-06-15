1. Load the ChickWeight dataset:
R
data(ChickWeight)


2. Order the data frame by "weight" in ascending order, grouped by "diet", and extract the last 6 records:
R
ordered_data <- ChickWeight[order(ChickWeight$weight), ]
last_six_records <- tail(ordered_data, 6)


3. Perform the melting function based on "Chick", "Time", and "Diet" as ID variables:
R
library(reshape2)
melted_data <- melt(ChickWeight, id.vars = c("Chick", "Time", "Diet"))


4a. Perform the cast function to display the mean value of weight grouped by Diet:
R
mean_weight <- dcast(melted_data, Diet ~ variable, fun.aggregate = mean)


4b. Perform the cast function to display the mode of weight grouped by Diet:
R
library(dplyr)
mode_weight <- melted_data %>%
  group_by(Diet, variable) %>%
  summarise(mode_weight = names(table(value))[which.max(table(value))])


5a. Create a box plot for "weight" grouped by "Diet":
R
boxplot(weight ~ Diet, data = ChickWeight, main = "Box Plot of Weight Grouped by Diet")


5b. Create a histogram for "weight" belonging to Diet-1 category:
R
hist(ChickWeight$weight[ChickWeight$Diet == 1], main = "Histogram of Weight for Diet-1", xlab = "Weight")


5c. Create a scatter plot for "weight" vs "Time" grouped by Diet:
R
library(ggplot2)
ggplot(ChickWeight, aes(x = Time, y = weight, color = factor(Diet))) +
  geom_point() +
  labs(title = "Scatter Plot of Weight vs Time Grouped by Diet", x = "Time", y = "Weight")


6a. Create a multiple regression model to predict weight using "Time" and "Diet" as predictor variables:
R
model <- lm(weight ~ Time + Diet, data = ChickWeight)


6b. Predict weight for Time = 10 and Diet = 1:
R
new_data <- data.frame(Time = 10, Diet = 1)
predicted_weight <- predict(model, newdata = new_data)


6c. Find the error in the model for the same prediction:
R
actual_weight <- ChickWeight$weight[ChickWeight$Time == 10 & ChickWeight$Diet == 1]
error <- actual_weight - predicted_weight


Make sure to adjust the code based on your specific R environment and requirements.
