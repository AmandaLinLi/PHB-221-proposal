# Basically, our research question could probably be: "What demographic and clinical factors are the strongest predictors of a patient's max heart rate during a stress test?"
# 
# Our 'Y' (outcome): thalach (max heart rate), which is a continuous number, so it's perfect for linear regression.
# 
# Our 'X's (predictors): We could use age, sex, resting blood pressure (trestbps), cholesterol (chol), and whether they get exercise-induced angina (exang).
# 
# I think it will be a quite straightforward analysis, a classic multiple linear regression project. And it covers key points of the course, which i guess will be helpful secure a good grade.
# 
#


# Load necessary libraries

read.csv("heart.csv") -> heart_data
library(dplyr)
library(ggplot2)


# Data preprocessing
df <- heart_data %>%
  select(Age,Sex,RestBP,Chol,ExAng, MaxHR) %>%
  mutate(Sex = factor(Sex, levels = c(0, 1), labels = c("female", "male")),
         ExAng = factor(ExAng, levels = c(0, 1), labels = c("no", "yes")))
# Initial exploration
summary(df)

ggplot(df, aes(x = MaxHR)) + geom_histogram(binwidth = 5, fill = "blue", color = "black") + theme_minimal()


# Below are some key workflows
# We'd get to explore the relationships between max heart rate and our predictors using scatter plots and correlation matrices.
ggplot(df, aes(x = Age, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()
ggplot(df, aes(x = RestBP, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()
ggplot(df, aes(x = Chol, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()

# We'd get to practice fitting the model using R and interpreting coefficients (you know, "for each additional year of age, the max heart rate decreases by X," etc.).
# 
# We'd have to handle something so-called "complex regressors" since sex and exang are categorical factors.
# 
# It's a perfect setup to test for interactions. For example, we could check if the effect of age on heart rate is different for men versus women.
# 
# We can run through the whole modeling process: do variable selection, use cross-validation to check our prediction error , and (most importantly) check all our model assumptions, like looking for heteroscedasticity.

