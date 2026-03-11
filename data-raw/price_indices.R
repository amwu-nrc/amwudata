## code to prepare `price_indices` datasets goes here
library(readabs)
library(dplyr)
library(tidyr)
library(tibble)

cpi_quarterly <- read_abs(cat_no = "6401.0", tables = "17", retain_files = F) |> 
  separate_series(column_names = c("data_type", "cpi_category", "region"),
                  remove_nas = T) |> 
  select(date, data_type, region, value, unit)

cpi_quarterly_group <- read_abs(cat_no = "6401.0", tables = "18", retain_files = F) |> 
  separate_series(column_names = c("data_type", "cpi_category", "region"),
                  remove_nas = T) |> 
  select(date, data_type, cpi_category, region, value, unit)

wpi_quarterly <- read_abs("6345.0", tables = paste0(c(2:5, 7:9), "b"), retain_files = F) |> 
  separate_series(column_names = c("data_type", "indicator", "state", "sector", "industry")) |> 
  select(date, data_type, indicator, state, sector, industry, unit, value) |>
  group_by(data_type, indicator, state, sector, industry) |> 
  mutate(reindex = 100*value/value[date == "2020-03-01"]) |> 
  ungroup() |> 
  distinct()
cli <- read_abs("6467.0", tables =  2, retain_files = F) |>
  separate_series(column_names = c("data_type", "household_type", "cpi_category"), 
                  remove_nas = TRUE) |> 
  select(date, data_type, household_type, cpi_category, value)

usethis::use_data(wpi_quarterly, compress = 'xz', overwrite = TRUE)
usethis::use_data(cpi_quarterly, compress = "xz", overwrite = TRUE)
usethis::use_data(cpi_quarterly_group, compress = "xz", overwrite = TRUE)
usethis::use_data(cli, compress = "xz", overwrite = TRUE)
