# Exploraotry Data Analysis in R

## Introduction

Exploratory data analysis is an approach to analyzing data sets to summarize their main characteristics, often with visual methods. A statistical model can be used or not, but primarily EDA is for seeing what the data can tell us beyond the formal modeling or hypothesis testing task.

## Important Steps in EDA

1. **Data Collection:**     Obtain the data from a reliable source.
2. **Data shape, size and type:**   Check the shape, size and type of the data, how data looks like and how it is structured.
3. **Viewing the data:**    View the data to get a feel for the data and to see if there are any obvious errors.
4. **Summarizing Data:**    Summarize the data to get a feel for the data and to find any abnormalities.
5. **Finding annomalies in the data:**  Find annomalies in the data and deal with them.
6. **Data Normalization Check:**    Check if the data is normalized or not.
7. **Finding Missing Values:**  Find missing values in the data, if any. Also, check if the missing values are random or not.
8. **Dealing with Missing Values:**     Deal with missing values in the data. You can replace them with mean, median or mode, or you can remove them. Or Also you can use a machine learning algorithm to predict the missing values. THis is also called missing value imputation.
9. **Findig Outliers:**     Find outliers in the data with these methods: Boxplot, Scatterplot, Histogram, Z-score, IQR, etc.
10. **Dealing with Outliers:**   Deal with outliers in the data with IQR limits, Z-score limits, etc.
11. **Finding Patterns:**   Find patterns in the data with these methods: Scatterplot, Histogram, Boxplot, etc.
12. **Data Clearning or Preprocessing:**  Clean the data to make it ready for analysis. This includes removing duplicates, removing unwanted columns, etc.
13. **Descriptive statistics:** Calculate descriptive statistics of the data. This includes mean, median, mode, standard deviation, variance, etc.
14. **Data Transformation:**    Transform the data to make it ready for analysis. This includes log transformation, square root transformation, etc. This is also used for normalizing the data.
15. **Data Visualization:** Visualize the data to get a feel for the data and to find any abnormalities by making following plots: Histogram, Boxplot, Scatterplot, Barplot, etc.
16. **Correlation Analsysis:**  Analyze the correlation between variables in the data. This includes Pearson correlation, Spearman correlation, etc.
17. **Hypothesis Testing:** Test the hypothesis of the data. This includes t-test, z-test, ANOVA, post-Hoc tests etc.
18. **Inferential Statistics:** Perform inferential statistics on the data. This will help you to make predictions on the data.
19. **Dimentionallity reduction (Feature engineering):**    This is also called `Feature Engineering` Reduce the dimentionality of the data. This includes PCA, LDA, etc. This will help you to select only the necessary variables to be used further in the analysis.
20. **Share EDA report with the stakeholders**
21. **Feature Selection:**    Select the features to be used in the analysis. This includes Backward Elimination, Forward Selection, etc.
22. **Feature Scaling:**   Scale the features to be used in the analysis. This includes Standardization, Normalization, etc. 
23. **Machine Learning Model Building:**    Build a model on the data. This includes Linear Regression, Logistic Regression, Decision Tree, Random Forest, etc.
24. **Model Evaluation:**    Evaluate the model on the data. This includes Confusion Matrix, Accuracy, Precision, Recall, F1 Score, etc.
25. **Model Tuning:**    Tune the model on the data. This includes Grid Search, Random Search, etc.
26. **Model Deployment:**    Deploy the model on the data. This includes Flask, Django, etc.
27. **Model Monitoring:**    Monitor the model on the data. This includes A/B Testing, etc.
28. **Model Retraining:**    Retrain the model on the data. This includes AutoML, etc.
29. **Model Prediction:**    Predict the model on the data. This includes Flask, Django, etc.
30. **Model Re-Evaluation:**    Evaluate the model on the data. This includes Confusion Matrix, Accuracy, Precision, Recall, F1 Score, etc.
31. **Share the report with stakeholder**
32. **Act on the report finding**


## **1. Data Collection**

### Data Collection from a CSV file

```{r}
# Read the data from a CSV file
data <- read.csv("data.csv")
```

### Data Collection from a SQL database

```{r}
# Read the data from a SQL database
data <- read.sql("SELECT * FROM data")
```

### Data collection from excel file

```{r}
# Read the data from an excel file
data <- read.excel("data.xlsx")
```

### Data Collectiong from an API (if you need some data from an API)

```{r}
# Read the data from an API
data <- read.api("https://api.github.com/users")
```

### Data collection using datapasta package

```{r}
# Read the data from a website

# Install the datapasta package
install.packages("datapasta")

# Load the datapasta package
library(datapasta)

# Read the data from a website
data <- read.paste()
```

## **2. Data shape, size and type**

### Data shape

```{r}
# Check the shape of the data
dim(data)
```

### Data size

```{r}
# Check the size of the data
object.size(data)
```

### Data type

```{r}
# Check the type of the data
class(data)
# also with this
# Check the variable types of the data
sapply(data, class)
```

### Data structure

```{r}
# Check the structure of the data
str(data)
```

### Variable names

```{r}
# Check the variable names of the data
names(data)
```

### Column names

```{r}
# Check the column names of the data
colnames(data)
```



## **3. Viewing the data**

### View the data

```{r}
# View the data
head(data)
```

### View the data with more rows

```{r}
# View the data with more rows
head(data, 20)
```


## **4. Summarizing Data**

### Summarize the data

```{r}
# Summarize the data
summary(data)
```

### Summarize the data with dplyr package

```{r}
# Summarize the data with dplyr package

# Install the dplyr package
install.packages("dplyr")

# Load the dplyr package
library(dplyr)

# Summarize the data
data %>% 
  summarise_all(funs(mean, sd, min, max))
```

### dplyr and glimpse

```{r}
# Summarize the data with dplyr package
library(dplyr)
glimps(data)
```

## **5. Finding annomalies in the data**

### Find annomalies in the data

```{r}
# Find annomalies in the data
any(is.na(data)) # if there are any null values
```

### Find annomalies in the data with dplyr package

```{r}
# Find annomalies in the data with dplyr package
library(dplyr)
data %>% 
  summarise_all(funs(sum(is.na(.))))
```

## **6. Data Normalization Check**

### Visulize the data to find if it is normalized or not

```{r}
# Check if the data is normalized or not
hist(data$column_name)
```

### Shapiro Test to check if the data is normalized or not

```{r}
# Check if the data is normalized or not
shapiro.test(data$column_name)
```

### Kolmogorov-Smirnov Test to check if the data is normalized or not

```{r}
# Check if the data is normalized or not
ks.test(data$column_name, "pnorm")
```

### Anderson-Darling Test to check if the data is normalized or not

```{r}
# Check if the data is normalized or not
ad.test(data$column_name, "norm")
```
### Jarque-Bera Test to check if the data is normalized or not

```{r}
# Check if the data is normalized or not
jb.test(data$column_name)
```

### Lilliefors Test to check if the data is normalized or not

```{r}
# Check if the data is normalized or not
lillie.test(data$column_name)
```

### **Data Normalization**

### Normalize the data

```{r}
# standardize variables using the scale() function
data_scaled <- scale(data)

# normalize variables using the caret package
library(caret)
data_normalized <- preProcess(data, method = "range")

# create new variables using mathematical transformations
data$new_column <- data$column1 * data$column2
```



## **7. Finding missing values:**

### Find missing values in the data

```{r}
# Find missing values in the data
any(is.na(data)) # if there are any null values
```

### Find missing values in the data with dplyr package

```{r}
# Find missing values in the data with dplyr package
library(dplyr)
data %>% 
  summarise_all(funs(sum(is.na(.))))
```

## **8. Data Cleaning**

### Remove missing values from the data

```{r}
# Remove missing values from the data
data <- na.omit(data)
```

### Remove missing values from the data with dplyr package

```{r}
# Remove missing values from the data with dplyr package
library(dplyr)
data <- data %>% 
  filter(!is.na(column_name))
```

### Remove missing values from the data with caret package

```{r}
# Remove missing values from the data with caret package
library(caret)
data <- na.omit(data)
```

### Impute missing values with mean

```{r}
# Impute missing values with mean
data$column_name[is.na(data$column_name)] <- mean(data$column_name, na.rm = TRUE)
```

### Impute missing values with median

```{r}
# Impute missing values with median
data$column_name[is.na(data$column_name)] <- median(data$column_name, na.rm = TRUE)
```

### Impute missing values with mode

```{r}
# Impute missing values with mode
data$column_name[is.na(data$column_name)] <- mode(data$column_name, na.rm = TRUE)
```

### Impute missing values with dplyr package

```{r}
# Impute missing values with dplyr package
library(dplyr)
data <- data %>% 
  mutate(column_name = ifelse(is.na(column_name), mean(column_name, na.rm = TRUE), column_name))
```

### Impute missing values with mice package

```{r}
# Impute missing values with mice package
library(mice)
data <- mice(data, m = 5, maxit = 50, meth = "pmm") #m is the number of imputations and maxit is the maximum number of iterations, pmm is predictive mean matching
```

### Impute missing values with MACHINE LEARNING

```{r}
# Impute missing values with MACHINE LEARNING
library(caret)
data <- data %>% 
  mutate(column_name = ifelse(is.na(column_name), predict(model, newdata = data), column_name)) # model is the model that you have trained
```

### Impute missing values with iterative imputer

```{r}
# Impute missing values with iterative imputer
library(imputeTS)
data <- imputeTS(data, method = "iterative") 
# method can be "iterative", "spline", "knn", "pmm", "ar", "snaive", "naive", "drift", "mean", "median", "zeroes", "random", "regression", "pmm", "spline", "knn", "ar", "snaive", "naive", "drift", "mean", "median", "zeroes", "random", "regression"
```

### Code snippet for Handling Missing Value

```{r}
# check for missing values
any(is.na(data))

# remove rows with missing values
data_clean <- na.omit(data)

# impute missing values using mean imputation
data_impute <- replace_na(data, list(column_name = mean(data$column_name, na.rm = TRUE)))

# create a separate category for missing values
data$column_name[is.na(data$column_name)] <- "Missing"
```

## **9. Finding and Handling Outliers**

### Find outliers in the data

```{r}
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
```

### Identify outliers using machine learning algorithms:


```{r}
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
```

### Transform outliers using the square root transformation

```{r}
# Transform outliers using the square root transformation
data$sqrt_column_name <- sqrt(data$column_name)
```

### Transform outliers using the cube root transformation

```{r}
# Transform outliers using the cube root transformation
data$cbrt_column_name <- cbrt(data$column_name)
```

### Transform outliers using the log transformation

```{r}
# Transform outliers using the log transformation
data$log_column_name <- log(data$column_name)
```

### Transform outliers using the log10 transformation

```{r}
# Transform outliers using the log10 transformation
data$log10_column_name <- log10(data$column_name)
```

### Transform outliers using the log1p transformation

```{r}
# Transform outliers using the log1p transformation
data$log1p_column_name <- log1p(data$column_name)
```

### Transform outliers using the log2 transformation

```{r}
# Transform outliers using the log2 transformation
data$log2_column_name <- log2(data$column_name)
```

### Transform outliers using the exp transformation

```{r}
# Transform outliers using the exp transformation
data$exp_column_name <- exp(data$column_name)
```

### Transform outliers using the expm1 transformation

```{r}
# Transform outliers using the expm1 transformation
data$expm1_column_name <- expm1(data$column_name)
```

### Transform outliers using the exp10 transformation

```{r}
# Transform outliers using the exp10 transformation
data$exp10_column_name <- exp10(data$column_name)
```

### Transform outliers using the exp2 transformation

```{r}
# Transform outliers using the exp2 transformation
data$exp2_column_name <- exp2(data$column_name)
```

### Transform outliers using the Box-Cox transformation

```{r}
# Transform outliers using the Box-Cox transformation
data$boxcox_column_name <- BoxCox(data$column_name)
```

### Transform outliers using the Yeo-Johnson transformation

```{r}
# Transform outliers using the Yeo-Johnson transformation
data$yeojohnson_column_name <- YeoJohnson(data$column_name)
```

### Transform outliers using the arcsin transformation

```{r}
# Transform outliers using the arcsin transformation
data$arcsin_column_name <- asin(data$column_name)
```

### Transform outliers using the arccos transformation

```{r}
# Transform outliers using the arccos transformation
data$arccos_column_name <- acos(data$column_name)
```

### Transform outliers using the arctan transformation

```{r}
# Transform outliers using the arctan transformation
data$arctan_column_name <- atan(data$column_name)
```

### Transform outliers using the sinh transformation

```{r}
# Transform outliers using the sinh transformation
data$sinh_column_name <- sinh(data$column_name)
```

### Transform outliers using the cosh transformation

```{r}
# Transform outliers using the cosh transformation
data$cosh_column_name <- cosh(data$column_name)
```

### Transform outliers using the tanh transformation

```{r}
# Transform outliers using the tanh transformation
data$tanh_column_name <- tanh(data$column_name)
```

### Transform outliers using the arcsinh transformation

```{r}
# Transform outliers using the arcsinh transformation
data$arcsinh_column_name <- asinh(data$column_name)
```

### Transform outliers using the arccosh transformation

```{r}
# Transform outliers using the arccosh transformation
data$arccosh_column_name <- acosh(data$column_name)
```


## **10. Explore Individual variables**

### Explore the distribution of a variable

```{r}
# Explore the distribution of a variable
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
```

```{r}
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
```

## **11. Explore vaiable relationship**

### Explore the relationship between two variables

```{r}
# explore the relationship between two variables using a scatter plot with regression line
ggplot(data, aes(x = column1, y = column2)) + geom_point() + geom_smooth(method = "lm")

# explore the relationship between multiple variables using a pairs plot
pairs(data)

# Update plot
pairs(data, pch = 21, bg = c("red", "blue")[unclass(data$column_name)], cex = 0.5, gap = 0)
```

## **12. Identify patterns and trends**

### Identify patterns and trends in a time series

```{r}
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
```

or

```{r}
# explore time series trends using a line plot
library(lubridate)
data$date_column <- ymd(data$date_column)
ggplot(data, aes(x = date_column, y = column_name)) + geom_line()

# explore seasonality using a time series decomposition plot
library(forecast)
data_ts <- ts(data$column_name, frequency = 12)
data_ts_decomp <- decompose(data_ts)
plot(data_ts_decomp)
```

## **13. Data Exploration via interactive tables and plots**

### Explore data interactively using DT

```{r}
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
```

### Explore data interactively using plotly

```{r}
# explore data interactively using plotly
library(plotly)
plot_ly(data, x = ~column1, y = ~column2, type = "scatter", mode = "markers", color = ~column3)

# use ggplotly to create interactive versions of ggplot2 plots
library(plotly)
ggplotly(ggplot(data, aes(x = column1, y = column2)) + geom_point())

# create interactive heatmaps using the heatmaply package
library(heatmaply)
heatmaply(corr_matrix, main = "Correlation Matrix")
```


## **15. Hypothesis testing**

### Hypothesis testing

```{r}
# perform a t-test
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

# perfom a contingency table
library(psych)
chisq.test(table(data$column1, data$column2))

# perfom a anova test (one way anova)
aov(column1 ~ column2, data = data)

# two way anova
aov(column1 ~ column2 + column3, data = data)

# perform post-hoc tests - Tukey HSS
library(agricolae)
TukeyHSD(aov(column1 ~ column2, data = data))
```



## **14. Create a dashboard**

### Create a dashboard using Shiny

```{r}
# create a dashboard using Shiny
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
```



## **13. Communicate Findings**

### Communicate findings

```{r}
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
```

## **14. Create a report**

### Create a report

```{r}
# create a report using R Markdown
library(rmarkdown)
render("report.Rmd")
```

## **15. Create a presentation**

### Create a presentation

```{r}
# create a presentation using R Markdown
library(rmarkdown)
render("presentation.Rmd")
```

# Example for EDA analysi


```{r}
# 1. Load the data
# Load the diamonds dataset from the ggplot2 package
library(ggplot2)
data(diamonds)

# 2. Understand the data
# Get the dimensions of the data
dim(diamonds)

# Get the variable names and types
names(diamonds)
str(diamonds)

# Get summary statistics for the data
summary(diamonds)

# 3. Handling Missing Values
# Check for missing values
any(is.na(diamonds))
# No missing values found

4. Handling Outliers
# Identify outliers using boxplots
boxplot(diamonds$price)

# Remove outliers using the IQR method
q1 <- quantile(diamonds$price, 0.25)
q3 <- quantile(diamonds$price, 0.75)
iqr <- q3 - q1
diamonds_clean <- diamonds[!(diamonds$price < (q1 - 1.5 * iqr) | diamonds$price > (q3 + 1.5 * iqr)), ]

# 5 Explore individual variables
# Explore the distribution of a variable using a histogram
hist(diamonds$price)

# Explore the relationship between two variables using a scatter plot
plot(diamonds$carat, diamonds$price)

# Calculate the correlation between two variables
cor(diamonds$carat, diamonds$price)

# 6. Explore variable relationships:
# Explore the relationship between multiple variables using a pairs plot
pairs(diamonds[, c("carat", "price", "depth", "table")])

# Explore the relationship between multiple variables using a correlation matrix
library(corrplot)
corrplot(cor(diamonds[, c("carat", "price", "depth", "table")]), method = "color")

# Explore the relationship between multiple variables using a heatmap
library(reshape2)
corr_matrix <- cor(diamonds[, c("carat", "price", "depth", "table")])

library(ggplot2)

ggplot(data = melt(corr_matrix)) + 
  geom_tile(aes(x = Var1, y = Var2, fill = value)) + 
    scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, limit = c(-1, 1), space = "Lab", name = "Correlation") + 
      theme_minimal() + 
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
          coord_fixed()+ 
            labs(title = "Correlation Matrix") + 
              theme(plot.title = element_text(hjust = 0.5)) + 
                theme(plot.title = element_text(size = 20))+ 
                  theme(plot.title = element_text(face = "bold"))+ 
                    theme(plot.title = element_text(color = "red"))+ 
                      theme(plot.title = element_text(family = "Times New Roman"))+ 
                        theme(plot.title = element_text(lineheight = 1.5))+ 
                          theme(plot.title = element_text(margin = margin(0, 0, 10, 0)))


# 7. Identify Patterns and Trends
# Explore time series trends using a line plot
library(lubridate)
diamonds$date <- ymd("2008-01-01") + days(1:nrow(diamonds))
ggplot(diamonds, aes(x = date, y = price)) + geom_line()

# Explore seasonality using a time series decomposition plot
library(forecast)
diamonds_ts <- ts(diamonds$price, frequency = 365)
diamonds_ts_decomp <- decompose(diamonds_ts)
plot(diamonds_ts_decomp)

# 8. Communicate Findings
# Create a summary table of key findings
library(dplyr)
summary_table <- diamonds %>% 
  summarise(mean_price = mean(price), sd_price = sd(price), median_price = median(price))

# Create a bar chart to show the distribution of a categorical variable
ggplot(diamonds, aes(x = cut)) + geom_bar()

# Create a heatmap to show the correlation between multiple variables
corr_matrix <- cor(diamonds[, c("carat", "price", "depth", "table")])
ggplot(data = melt(corr_matrix)) + 
  geom_tile(aes(x = Var1, y = Var2, fill = value))

# 9. Create a report
# Create a report using R Markdown
library(rmarkdown)
render("report.Rmd")

# 10. Create a presentation
# Create a presentation using R Markdown
library(rmarkdown)
render("presentation.Rmd")
```









