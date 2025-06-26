## code to prepare `price_indices` datasets goes here
library(readabs)
library(dplyr)

cpi_monthly <- read_abs("6484.0", tables = "1", retain_files = F) |> 
  separate_series(column_names = c("indicator", "cpi_group", "state")) |> 
  select(date, indicator, cpi_group, state, unit, value)

wpi_quarterly <- read_abs("6345.0", tables = paste0(c(2:5, 7:9), "b"), retain_files = F) |> 
  separate_series(column_names = c("data_type", "indicator", "state", "sector", "industry")) |> 
  select(date, data_type, indicator, state, sector, industry, unit, value)


usethis::use_data(wpi_quarterly, compress = 'xz', overwrite = TRUE)
usethis::use_data(cpi_monthly, compress = 'xz', overwrite = TRUE)
