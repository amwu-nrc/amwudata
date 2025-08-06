## code to prepare `occupation_employment` dataset goes here
## code to prepare `labour_force_industry` dataset goes here
library(readabs)
library(dplyr)
library(stringr)
library(usethis)
library(tidyr)
library(readxl)
library(strayr)

download_abs_data_cube("labour-force-australia-detailed",
                       cube = "EQ08",
                       path = "data-raw")

eq8 <- read_excel("data-raw/EQ08.xlsx",
                  sheet = "Data 1", skip = 3) |> 
  pivot_longer(cols = 5:6,
               names_to = "indicator",
               values_to = "value") |> 
  rename(date = "Mid-quarter month",
         sex = "Sex",
         state = "State and territory (STT): ASGS (2011)",
         anzsco_unit = "Occupation of main job: ANZSCO (2013) v1.2") |> 
  mutate(date = as.Date(date),
         anzsco_unit = str_sub(anzsco_unit, 6)) |> 
  replace_na(list(value = 0))

occupation_employment <- left_join(eq8, anzsco2013 |> distinct(anzsco_major, anzsco_submajor, anzsco_minor, anzsco_unit)) |> 
  distinct() |> 
  group_by(date, indicator, sex, state, anzsco_major, anzsco_submajor, anzsco_minor, anzsco_unit) |> 
  summarise(value = sum(value),
            .groups = "drop") |> 
  mutate(value = value * 1000,
         indicator = str_replace_all(indicator, "\\('000.+", ""),
         indicator = trimws(indicator))

file.remove("data-raw/EQ08.xlsx")

usethis::use_data(occupation_employment, compress = "xz", overwrite = TRUE)
