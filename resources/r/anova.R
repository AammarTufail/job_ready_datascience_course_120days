#ANOVA 

## Dataset import
install.packages("palmerpenguins")
library(palmerpenguins)

df <- penguins
colnames(df)
# find unique values
unique(df$species)
unique(df$island)

#t.test laga k dikhayen
t.test(df$bill_length_mm~df$sex)
library(tidyverse)
ggplot(df, aes(sex, bill_length_mm, fill=sex))+geom_boxplot()

data <- df %>% 
  select(species, flipper_length_mm) %>% 
  drop_na()

#summary
summary(data)

data %>% 
  group_by(species) %>% 
  summarize(mean(flipper_length_mm))



ggplot(data) +
  aes(species, flipper_length_mm, col=species)+
  geom_jitter() + theme(legend.position = "none") 


# normal disrtribution

data %>% 
  group_by(species) %>% 
  summarize(shapiro_pvalue = shapiro.test(flipper_length_mm)$p.value)

s_w <- shapiro.test(data$flipper_length_mm)
summary(s_w)


# anova
#normal
res_aov <- aov(flipper_length_mm ~ species, data = data)

summary(res_aov)
hist(res_aov$residuals)
qqnorm(res_aov$residuals)

shapiro.test(res_aov$residuals)

#homogeneous
install.packages("car")
library(car)
leveneTest(flipper_length_mm ~ species, data= data)

install.packages("lattice")
library(lattice)
dotplot(flipper_length_mm ~species, data = data)


ggplot(data) +
  aes(species, flipper_length_mm, fill=species)+
  geom_boxplot()


# calculate mean and sd for plots and AOV figures

aggregate(flipper_length_mm ~ species, data=data,
          function(x) round(c(mean = mean(x), sd =sd(x)), 2))

# another way
df1<-  group_by(data, species) %>%
  summarise(
    mean = mean(flipper_length_mm, na.rm = TRUE),
    sd = sd(flipper_length_mm, na.rm = TRUE)
  )
df1
          
# ANOVA aik tareeqa
oneway.test(flipper_length_mm ~ species, data= data, var.equal = TRUE)
oneway.test(flipper_length_mm ~ species, data= data, var.equal = FALSE)
# ANOVA doosra tareeqa
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)

# postHoc Test
install.packages("multcomp", dependencies = TRUE)
library(multcomp)
#TukeyHSD
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
post_test <- glht(res_aov,
                  linfct = mcp(species = "Tukey")
                  )
summary(post_test)

plot(post_test)

plot(TukeyHSD(res_aov))

#Dunnet test
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
dun <- glht(res_aov,
                  linfct = mcp(species = "Dunnet"))
summary(dun)


# Two way ANOVA
library(ggthemes)
library(multcompView)
library(tidyverse)

df <- ToothGrowth
df$dose <- as.factor(df$dose)

# calculate two way anova

anova <- aov(len ~ supp*dose, data= df)
summary(anova)

# tukey hsd
tukey <- TukeyHSD(anova)
tukey

# lettering nikaltay
letters <- multcompLetters4(anova, tukey)
letters
# convert them into a df

letters <- data.frame(letters$`supp:dose`$Letters)
letters

# mean and Sd
df_mean <- df %>% 
  group_by(supp, dose) %>% 
  summarise(len_mean=mean(len), sd = sd(len)) %>% 
  arrange(desc(len_mean))

tibble(df_mean)

# letters
df_mean$letters <- letters$letters..supp.dose..Letters
df_mean


#draw
p <- ggplot(df_mean)+
  aes(dose, len_mean, group=supp, fill=supp) + 
  geom_bar(stat = 'identity', position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin=len_mean-sd, ymax=len_mean+sd), width =0.1,
                    position = position_dodge(0.9)) +
  geom_text(aes(label=letters, y=len_mean+sd), vjust = -0.2,
            position = position_dodge(0.9)) + 
  scale_fill_manual(values=c("blue", "red"))+
  labs(x="Dose", y="Length (mm)", 
       title="Tooth Growth Publication Ready Plot",
       fill= "Supplement");p
ggsave("Plot.pdf", p, width = 10, height = 8, units = "in")