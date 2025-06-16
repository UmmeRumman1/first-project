
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)
library(naniar)
install.packages("MASS")
library(MASS)

library(gt)



data <- read_excel("data/AMR_KAP_Coded.xlsx", sheet = 2) |> 
glimpse(data)

data$Knowledge_Level<- as.factor(data$Knowledge_Level)
data$Attitude_Level <- as.factor(data$Attitude_Level)
data$Practice_Level <- as.factor(data$Practice_Level)

data$`Parent’s sex`<-as.factor(data$`Parent’s sex`)
data$`Parent’s age (years)`<-as.factor(data$`Parent’s age (years)`)
data$`Parent’s education level`<-as.factor(data$`Parent’s education level`)
data$`Employment status`<-as.factor(data$`Employment status`)
data$`Family type`<-as.factor(data$`Family type`)
data$`Your average household income per month (BDT)`<-as.factor(data$`Your average household income per month (BDT)`)







glimpse(data)


summary(data)




data <- read_excel("AMR_KAP_Coded.xlsx") |>  clean_names()



data |> 
  select(1:6,Knowledge_Level) |> 
  tbl_uvregression(
    method=lm,
    y=Knowledge_Level
  ) |> 
  bold_p(t=0.05) |> 
  tbl_summary()
  as_gt() |> 
  gtsave("table/tabuvreg.docx")

  






