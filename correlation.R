
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)
library(naniar)
install.packages("MASS")
library(MASS)
install.packages("correlation")
library(correlation)
install.packages("plot.matrix")
library(plot.matrix)
library(gt)

data |> 
   select(Total_Knowledge_Score,Total_Attitude_Score,Total_Practice_Score) |>
   correlation()|> 
   summary() |> 
   plot()
  




