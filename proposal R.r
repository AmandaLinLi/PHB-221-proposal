
# Basically, our research question is: 
# "What demographic and clinical factors are the strongest predictors of a patient's max heart rate during a stress test?"
# Why this topic is important?
# Understanding the determinants of max heart rate is crucial for assessing cardiovascular health and fitness levels.
# Max heart rate is a key indicator used in exercise physiology and cardiac risk stratification. By identifying the factors
# that influence max heart rate, healthcare providers can better tailor exercise prescriptions and monitor patients' cardiovascular health.

# Why this project is suitable for multiple linear regression analysis?
# 1. Continuous Outcome Variable: Max heart rate is a continuous variable, making it ideal for regression analysis.
# 2. Multiple Predictors: The dataset includes various demographic (age, sex) and clinical (resting blood pressure, cholesterol levels, exercise-induced angina) factors that can be used as predictors in a multiple linear regression model.
# 3. Interaction Effects: The project allows for the exploration of potential interaction effects between predictors, such as how age and sex may jointly influence max heart rate.

# Data source: the "heart.csv" dataset from Kaggle (https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)
# Dataset description: This dataset contains various medical attributes of patients, including age, sex, resting blood pressure, cholesterol levels, and max heart rate achieved during a stress test, among others.

# Why this dataset?
# 1. Relevance: Heart disease is a significant health issue worldwide, and understanding factors that influence heart rate can aid in risk assessment and management.
# 2. Data Quality: The dataset is well-structured and contains a mix of continuous and categorical variables, making it suitable for regression analysis.
# 3. Educational Value: This dataset provides an excellent opportunity to apply multiple linear regression techniques, including handling categorical variables, interaction terms, and model diagnostics.

# Our 'Y' (outcome): thalach (max heart rate, rename as "RestBP"), which is a continuous number, so it's perfect for linear regression.

# Our 'X's (predictors): Age, Sex (categorical);
# resting blood pressure (trestbps, rename as RestBP), 
# cholesterol (Chol), 
# and whether they get exercise-induced angina (exang, reanme as ExAng, categorical).


# It will be a quite straightforward analysis, a classic multiple linear regression project. And it covers key points of the course, which i guess will be helpful secure a good grade.



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

# Summary statistics for outcome variable
summary(df$MaxHR)
# Histogram of max heart rate
ggplot(df, aes(x = MaxHR)) + geom_histogram(binwidth = 5, fill = "blue", color = "black") + theme_minimal()

# Summary statistics for predictors
predictor_df <- df %>% select(-MaxHR)
summary(predictor_df)




# Below are some key workflows
# We'd get to explore the relationships between max heart rate and our predictors using scatter plots and correlation matrices.
ggplot(df, aes(x = Age, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()
ggplot(df, aes(x = RestBP, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()
ggplot(df, aes(x = Chol, y = MaxHR)) + geom_point() + geom_smooth(method = "lm") + theme_minimal()

# We'd get to practice fitting the model using R and interpreting coefficients (you know, "for each additional year of age, the max heart rate decreases by X," etc.).

# We'd have to handle something so-called "complex regressors" since sex and exang are categorical factors.

# It's a perfect setup to test for interactions. For example, we could check if the effect of age on heart rate is different for men versus women.

# We can run through the whole modeling process: do variable selection, use cross-validation to check our prediction error , and (most importantly) check all our model assumptions, like looking for heteroscedasticity.

