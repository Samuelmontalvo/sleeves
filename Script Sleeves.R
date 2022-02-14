library(readxl)
Sleeves <- read_excel("Sleeves.xlsx", sheet = "Data_sheet")
View(Sleeves)
attach(Sleeves)
library(dplyr)

library(ggplot2)
Sleeves %>% ggplot(aes(Conditions, Lactate, color=Conditions ))+
  theme_classic() + geom_boxplot()

library(lmerTest)
library(lme4)
#General Linear Mixed models
lmModel = glmer(Lactate ~ Conditions + (1|ID),
               data=Sleeves, REML=TRUE)
summary(lmModel)
# mixed model
anova(lmModel)
#test of the random effects in the model
rand(lmModel)

library(kableExtra)
library(rstatix)
library(coin)
pwc <- Sleeves %>% wilcox_test(Lactate ~ Conditions, paired = T,
                  p.adjust.method	= "none")
pwc %>% kable()%>%
  kable_classic_2(full_width = F)

# Effect size Cohen's D with Hedge's g correction for small sample size
effect <- Sleeves  %>% wilcox_effsize(Lactate ~ Conditions,
                                    paired = TRUE)
effect %>% kable()%>%
  kable_classic_2(full_width = F)
