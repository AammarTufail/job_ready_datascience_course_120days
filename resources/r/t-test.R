# data import
df <- iris

# one sample t.test
t.test(df$Sepal.Length, mu = 6.5)

# two sample t-test
# independent t-test / unpaired-t_test
t.test(df$Sepal.Length, df$Petal.Length, paired = FALSE)

# paired t-test kab lagna

pre_treatment <- c(rnorm(2000, mean = 150, sd = 10))
post_treatment <- c(rnorm(2000, mean = 144, sd = 9))
# t_test ab lagna hy paired wala
t.test(pre_treatment, post_treatment, paired = TRUE)


library(tidyverse)
df <- iris
df <- df %>% 
  filter(Species %in% c("setosa", "versicolor")) 

t.test(df$Petal.Width ~ df$Species)



