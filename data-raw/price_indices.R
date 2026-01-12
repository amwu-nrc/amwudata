## code to prepare `price_indices` datasets goes here
library(readabs)
library(dplyr)
library(tidyr)
library(tibble)






wpi_quarterly <- read_abs("6345.0", tables = paste0(c(2:5, 7:9), "b"), retain_files = F) |> 
  separate_series(column_names = c("data_type", "indicator", "state", "sector", "industry")) |> 
  select(date, data_type, indicator, state, sector, industry, unit, value) |>
  group_by(data_type, indicator, state, sector, industry) |> 
  mutate(reindex = 100*value/value[date == "2020-03-01"]) |> 
  ungroup() 


usethis::use_data(wpi_quarterly, compress = 'xz', overwrite = TRUE)

