## code to prepare `price_indices` datasets goes here
library(readabs)
library(dplyr)

cpi_monthly <- read_abs("6484.0", tables = "1", retain_files = F) |> 
  separate_series(column_names = c("indicator", "cpi_group", "state")) |> 
  select(date, indicator, cpi_group, state, unit, value)

usethis::use_data(cpi_monthly, overwrite = TRUE)
