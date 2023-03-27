#EDA on basics dataset-----
#libraries----
library(ggplot2) 
library(tidyverse)

# Load dataset and store in an objetc
data("diamonds")
# df <- diamonds ctrl + shift + c
# remove(df)

#View dataset dataset and feel it
View(diamonds) # view teh datset
?diamonds #check the meta-data of the dataset
str(diamonds) #check the structure of data
summary(diamonds) #summarize the data builtin function
glimpse(diamonds) #overview of the data 
# summarize with dplyr packages
diamonds %>% 
  group_by(cut) %>%
  summarise(mean(price), sd(price), min(price), max(price))

# check the shape of the data
dim(diamonds)
object.size(diamonds) #object size
#data types
class(diamonds)
names(diamonds) #hows names inside data
colnames(diamonds) #also with this names
#view the data
View(diamonds)
head(diamonds) #top 6 rows
head(diamonds, 10) # top 10 rows
tail(diamonds) #bottom 6 rows

# Find annomalies or missing values in the data----
any(is.na(diamonds)) # if there are any null values

#impute missing values in the data if any -----
# Remove missing values from the data
data <- na.omit(diamonds)
# Remove missing values from the data with dplyr package
library(dplyr)
data <- diamonds %>% 
  filter(!is.na(column_name))
# Remove missing values from the data with caret package
library(caret)
data <- na.omit(data)
# Impute missing values with mean
data$column_name[is.na(data$column_name)] <- mean(data$column_name, na.rm = TRUE)
# Impute missing values with median
data$column_name[is.na(data$column_name)] <- median(data$column_name, na.rm = TRUE)
# Impute missing values with mode
data$column_name[is.na(data$column_name)] <- mode(data$column_name, na.rm = TRUE)
library(dplyr)
data <- data %>% 
  mutate(column_name = ifelse(is.na(column_name), mean(column_name, na.rm = TRUE), column_name))
# Impute missing values with mice package
library(mice)
data <- mice(data, m = 5, maxit = 50, meth = "pmm") #m is the number of imputations and maxit is the maximum number of iterations, pmm is predictive mean matching
# Impute missing values with MACHINE LEARNING
library(caret)
data <- data %>% 
  mutate(column_name = ifelse(is.na(column_name), predict(model, newdata = data), column_name)) # model is the model that you have trained
# Impute missing values with iterative imputer
library(imputeTS)
data <- imputeTS(data, method = "iterative") 
# method can be "iterative", "spline", "knn", "pmm", "ar", "snaive", "naive", "drift", "mean", "median", "zeroes", "random", "regression", "pmm", "spline", "knn", "ar", "snaive", "naive", "drift", "mean", "median", "zeroes", "random", "regression"

#Finding and handling outliers----
# Find outliers in the data
# identify outliers using boxplots
boxplot(data$column_name)

# remove outliers using the IQR method
q1 <- quantile(data$column_name, 0.25)
q3 <- quantile(data$column_name, 0.75)
iqr <- q3 - q1
data_clean <- data[!(data$column_name < (q1 - 1.5 * iqr) | data$column_name > (q3 + 1.5 * iqr)), ]

# transform outliers using the log transformation
data$log_column_name <- log(data$column_name)

# use clustering algorithms to identify outliers
library(cluster)
kmeans_model <- kmeans(data, centers = 3)
outlier_index <- which(kmeans_model$cluster == 1)

# use anomaly detection algorithms to identify outliers
library(anomalize)
anomalies <- time_decompose(data, method = "iqr", alpha = 0.05) %>% anomalize(remainder, method = "gesd", alpha = 0.05)

# use decision trees to identify outliers
library(rpart)
library(rpart.plot)
tree_model <- rpart(column_name ~ ., data = data)
rpart.plot(tree_model, extra = 1, under = TRUE, faclen = 0)
# Transform outliers using the square root transformation
data$sqrt_column_name <- sqrt(data$column_name)
# Transform outliers using the cube root transformation
data$cbrt_column_name <- cbrt(data$column_name)
# Transform outliers using the log transformation
data$log_column_name <- log(data$column_name)
# Transform outliers using the log1p transformation
data$log1p_column_name <- log1p(data$column_name)
# Transform outliers using the log2 transformation
data$log2_column_name <- log2(data$column_name)


# Check if the data is normalized or not----
hist(diamonds$price)
# test to check
# Check if the data is normalized or not
shapiro.test(diamonds$price)
# Check if the data is normalized or not
ks.test(diamonds$price, "pnorm")
?ks.test
#Anderson-Darling Test to check if the data is normalized or not
# Check if the data is normalized or not
# install and load the darling package
#install (if not already installed) and load nortest library
install.packages('nortest')
library(nortest)
# perform the Andreas Darling test
ad.test(diamonds$price)

# Data Normalization Normalize the data----
# standardize variables using the scale() function
df_new <- diamonds #make a new dataset to normalize
df_new$price <- scale(df_new$price) # this will scale the values in a range
range(df_new$price) # here you can see the range
# normalize variables using the caret package
install.packages("caret")
library(caret)
data_normalized <- preProcess(df_new, method = c("center", "scale"))
View(data_normalized)
data_normalized
summary(data_normalized)

# create new variables using mathematical transformations-----
data$new_column <- data$column1 * data$column2 # only if needed


## Explore the distribution of a variable----
# plot the distribution of a variable
hist(data$column_name)

# plot the distribution of a variable
ggplot(data, aes(x = column_name)) + 
  geom_histogram()

# plot the distribution of a variable
ggplot(data, aes(x = column_name)) + 
  geom_density()

# plot the distribution of a variable
ggplot(data, aes(x = column_name)) + 
  geom_density() + 
  geom_rug()
# explore the distribution of a variable using a histogram
hist(data$column_name)

# explore the distribution of a variable using a density plot
library(ggplot2)
ggplot(data, aes(x = column_name)) + geom_density()

# explore the relationship between two variables using a scatter plot
plot(data$column1, data$column2)

# calculate the correlation between two variables
cor(data$column1, data$column2)

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point()

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm")

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm", se = FALSE)

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + geom_smooth(method = "loess", se = FALSE)

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + geom_smooth(method = "loess", se = FALSE) + geom_smooth(method = "gam", se = FALSE)

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + geom_smooth(method = "loess", se = FALSE) + geom_smooth(method = "gam", se = FALSE) + geom_smooth(method = "glm", se = FALSE)

# explore the relationship between two variables using a scatter plot
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + geom_smooth(method = "loess", se = FALSE) + geom_smooth(method = "gam", se = FALSE) + geom_smooth(method = "glm", se = FALSE) + geom_smooth(method = "gls", se = FALSE)

### Explore the relationship between two variables----
# explore the relationship between two variables using a scatter plot with regression line
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm")

# explore the relationship between multiple variables using a pairs plot
pairs(data)

# Update plot
pairs(data, pch = 21, bg = c("red", "blue")[unclass(data$column_name)], cex = 0.5, gap = 0)

## Identify patterns and trends in a time series----
# identify patterns and trends in a time series
library(fpp2)
autoplot(AirPassengers)

# identify patterns and trends in a time series
library(fpp2)
autoplot(AirPassengers) + 
  autolayer(stl(AirPassengers, s.window = "periodic"))

# identify patterns and trends in a time series
library(fpp2)
autoplot(AirPassengers) + 
  autolayer(stl(AirPassengers, s.window = "periodic")) + 
  autolayer(forecast(stl(AirPassengers, s.window = "periodic")))

# explore time series trends using a line plot
library(lubridate)
data$date_column <- ymd(data$date_column)
ggplot(data, aes(x = date_column, y = column_name)) + geom_line()

# explore seasonality using a time series decomposition plot
library(forecast)
data_ts <- ts(data$column_name, frequency = 12)
data_ts_decomp <- decompose(data_ts)
plot(data_ts_decomp)

# Explore data interactively using DT----
# explore data interactively using DT
library(DT)
datatable(data)

# explore data interactively using DT
library(DT)
datatable(data, options = list(pageLength = 5))

# explore data interactively using DT
library(DT)
datatable(data, options = list(pageLength = 5), extensions = "Buttons", 
          selection = "none", filter = "top", 
          options = list(dom = 'Bfrtip', buttons = c('copy', 'csv', 'excel', 'pdf', 'print')))

### explore data interactively using plotly----
library(plotly)
plot_ly(data, x = ~column1, y = ~column2, type = "scatter", mode = "markers", color = ~column3)

# use ggplotly to create interactive versions of ggplot2 plots
library(plotly)
ggplotly(ggplot(data, aes(x = column1, y = column2)) + geom_point())

# create interactive heatmaps using the heatmaply package
library(heatmaply)
heatmaply(corr_matrix, main = "Correlation Matrix")

### Hypothesis Testing # perform a t-test----
t.test(data$column1, data$column2)

# perform a t-test
t.test(data$column1, data$column2, var.equal = TRUE)

# perform a t-test
t.test(data$column1, data$column2, var.equal = TRUE, paired = TRUE)

# perform a t-test
t.test(data$column1, data$column2, var.equal = TRUE, paired = TRUE, alternative = "greater")

# perfom a chi-squared test
chisq.test(data$column1, data$column2)

# perfom a z-test
z.test(data$column1, data$column2, alternative = "two.sided", mu = 0, sigma = 1)

# perform a contingency table
library(psych)
chisq.test(table(data$column1, data$column2))

# perform an anova test (one way anova)
aov(column1 ~ column2, data = data)

# two way anova
aov(column1 ~ column2 + column3, data = data)

# perform post-hoc tests - Tukey HSS
library(agricolae)
TukeyHSD(aov(column1 ~ column2, data = data))

###----# create a dashboard using Shiny----
library(shiny)
ui <- fluidPage(
  titlePanel("Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "X Variable", names(data)),
      selectInput("y", "Y Variable", names(data))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(data, aes_string(x = input$x, y = input$y)) + geom_point()
  })
}

shinyApp(ui = ui, server = server)


# Communicate findings with data plots as you wish
# create a summary table of key findings
library(dplyr)
summary_table <- data %>% 
  summarise(mean_column_name = mean(column_name), sd_column_name = sd(column_name), median_column_name = median(column_name))

# create a bar chart to show the distribution of a categorical variable
ggplot(data, aes(x = factor(column_name))) + geom_bar()

# create a heatmap to show the correlation between multiple variables
corr_matrix <- cor(data[, c("column1", "column2", "column3")])
library(ggplot2)
ggplot(data = melt(corr_matrix)) + 
  geom_tile(aes(x = Var1, y = Var2, fill = value)) + 
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, limit = c(-1, 1), space = "Lab", name = "Correlation") + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  coord_fixed()






