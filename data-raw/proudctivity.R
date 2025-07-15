## code to prepare `proudctivity` dataset goes here
library(readabs)
library(dplyr)
library(ggplot2)

raw <- read_abs("5206.0", tables = c(1, 5, 7), path  = "data-raw",check_local = T, retain_files = T)

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

raw_hours <- read_abs("6291.0.55.001", tables = 13, path = "data-raw", check_local = TRUE, retain_files = T)

hours_worked <- raw_hours |> 
  filter(series %in% c("Employee ;  Employed total ;",
                       "Owner manager of incorporated enterprise with employees ;  Employed total ;",
                       "Owner manager of incorporated enterprise without employees ;  Employed total ;"),
         series_type == "Original",
         !is.na(value)) |> 
  pivot_wider(names_from = series,
              values_from = value, 
              id_cols = -c(sheet_no, series_id)) |> 
  rename(employee_hours = "Employee ;  Employed total ;",
         omiee = "Owner manager of incorporated enterprise with employees ;  Employed total ;",
         omiew = "Owner manager of incorporated enterprise without employees ;  Employed total ;") |> 
  mutate(total_hours_worked = employee_hours + omiee + omiew) |> 
  select(date, employee_hours)


usethis::use_data(proudctivity, overwrite = TRUE)
