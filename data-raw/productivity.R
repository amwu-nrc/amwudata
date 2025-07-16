## code to prepare `proudctivity` dataset goes here
library(readabs)
library(zoo)
library(dplyr)
library(lubridate)
library(tidyr)

raw <- read_abs("5206.0", tables = c(1, 5, 7), retain_files = FALSE)

productivity <- raw |> 
  filter(series == "GDP per hour worked: Index ;",
         series_type == "Seasonally Adjusted",
         !is.na(value)) |> 
  select(date, gdp_per_hour_index = value)


compensation <- raw |> 
  filter(series %in%  c("Compensation of employees - Wages and salaries ;",
                        "Compensation of employees - Employers' social contributions ;"),
         series_type == "Seasonally Adjusted",
         !is.na(value)) |> 
  pivot_wider(names_from = series,
              values_from = value,
              id_cols = -series_id) |> 
  rename(wages_and_salaries = "Compensation of employees - Wages and salaries ;",
         employer_contribution = "Compensation of employees - Employers' social contributions ;") |> 
  mutate(total_compensation = wages_and_salaries + employer_contribution) |> 
  select(date, total_compensation, wages_and_salaries, employer_contribution)

gdp_deflator <- raw |> 
  filter(table_no == "5206005_expenditure_implicit_price_deflators",
         series == "GROSS DOMESTIC PRODUCT ;") |> 
  select(date, gdp_deflator = value)

raw_hours <- read_abs("6291.0.55.001", tables = 13, retain_files = FALSE)

hours_worked <- raw_hours |> 
  filter(series %in% c("Employee ;  Number of hours actually worked in all jobs ;",
                       "Owner manager of incorporated enterprise with employees ;  Number of hours actually worked in all jobs ;",
                       "Owner manager of incorporated enterprise without employees ;  Number of hours actually worked in all jobs ;"),
         series_type == "Original",
         !is.na(value)) |> 
  pivot_wider(names_from = series,
              values_from = value, 
              id_cols = -c(sheet_no, series_id)) |> 
  rename(employee_hours = "Employee ;  Number of hours actually worked in all jobs ;",
         omiee = "Owner manager of incorporated enterprise with employees ;  Number of hours actually worked in all jobs ;",
         omiew = "Owner manager of incorporated enterprise without employees ;  Number of hours actually worked in all jobs ;") |> 
  mutate(total_hours_worked = employee_hours + omiee + omiew,
         total_hours_worked_4ma = rollmeanr(total_hours_worked, fill = NA, k = 4),
         hours_worked_index = 100*ifelse(is.na(total_hours_worked_4ma), 
                                     total_hours_worked/total_hours_worked_4ma[date=="1991-11-01"],
                                     total_hours_worked_4ma/total_hours_worked_4ma[date=="1991-11-01"])) |> 
  select(date, total_hours_worked, total_hours_worked_4ma, hours_worked_index) 

productivity <- compensation |> 
  inner_join(gdp_deflator) |> 
  filter(date >= "1991-03-01") |> 
  mutate(real_compensation = total_compensation/gdp_deflator*gdp_deflator[date=="1991-03-01"]) |> 
  inner_join(hours_worked |> mutate(date = date + months(1))) |> 
  mutate(real_compensation_per_hour = (real_compensation/hours_worked_index)*hours_worked_index[date=="1991-12-01"],
         real_compensation_per_hour_index = 100*real_compensation_per_hour/real_compensation_per_hour[date=="1991-12-01"]) |> 
  inner_join(productivity) |> 
  mutate(gdp_per_hour_index = 100*gdp_per_hour_index/gdp_per_hour_index[date=="1991-12-01"])


usethis::use_data(productivity, overwrite = TRUE)
