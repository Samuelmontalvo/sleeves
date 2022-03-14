library(readxl)
SleevesEMG <- read_excel("C:/Users/Public Health/Desktop/SleevesEMG.xlsx", 
                         sheet = "EMG")
View(SleevesEMG)
attach(SleevesEMG)

as.factor(Condition)


library(ggplot2)
ggplot(SleevesEMG,aes(Condition, F_diff)) + geom_() + theme_classic()


