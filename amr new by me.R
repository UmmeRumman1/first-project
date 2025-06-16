
library(tidyverse)
library(janitor)
library(gt)
library(gtsummary)
library(readxl)


data <- read_excel("data/AMR_KAP_Coded.xlsx", sheet = 2) |> clean_names()


data |> 
  select(1:11) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("table/Table1.docx") 


info_vars <- c(
  "information_provided_by_pharmaceutical_companies_leaflet",
  "information_from_prescribers",
  "information_from_dispensers",
  "information_from_nurses",
  "information_given_by_a_colleague",
  "information_from_university_courses",
  "internet",
  "social_media",
  "others_55"
)


table2 <- data |> 
  select(all_of(info_vars)) |> 
  summarise(across(everything(), ~ sum(. == 1 | . == "Yes", na.rm = TRUE))) |> 
  pivot_longer(cols = everything(), names_to = "Source", values_to = "Count") |> 
  mutate(
    Percent = round((Count / nrow(data)) * 100, 1),
    `N (%)` = paste0(Count, " (", Percent, "%)")
  ) |> 
  select(Source, `N (%)`) |> 
  mutate(Source = str_replace_all(Source, "_", " ") |> str_to_sentence())


table2 |> 
  gt() |> 
  gtsave("table/Table2.docx")
  
