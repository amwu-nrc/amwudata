## code to prepare `hours_worked` dataset goes here
library(readabs)
library(dplyr)
library(tidyr)
library(usethis)

states <- c(
  "New South Wales",
  "Victoria",
  "Queensland",
  "South Australia",
  "Western Australia",
  "Tasmania",
  "Northern Territory",
  "Australian Capital Territory"
)
raw <- read_abs(cat_no = "6202.0", tables = c("19", "19a"), retain_files = FALSE)

hours_worked <- raw  |> 
  filter(table_no == "6202019" | table_no == "6202019a") |> 
  separate(series, 
           into = c("indicator", "sex", "state"), 
           sep = ";") |> 
  mutate(across(c("indicator", "sex"), ~ trimws(gsub(">", "", .))),
         state = ifelse(sex %in%  states, sex, "Australia"),
         sex = ifelse(sex %in% states, "Persons", sex))

usethis::use_data(hours_worked, overwrite = TRUE)
