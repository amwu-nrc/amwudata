## code to prepare `labour_account` dataset goes here
library(purrr)
library(readabs)
library(dplyr)
library(lubridate)
library(tidyr)

urls <- get_available_files("labour-account-australia") |> 
  filter(label != "Industry summary table") |> 
  pull(file)

walk(.x = urls,
     .f = function(x) download_abs_data_cube("labour-account-australia",
                                             cube = x,
                                             path = "data-raw"))

labour_account <- read_abs_local(filenames = urls,
                                 path = "data-raw") |> 
  mutate(series = ifelse((grepl("Public sector", series) | grepl("Private sector", series)), 
                         gsub(x = series, pattern = "; P", replacement = "- P"), 
                         series))  |> 
  separate(series, 
           into = c("prefix", "indicator", "state", "industry"),
           sep = ";",
           extra = "drop") |> 
  mutate(across(where(is.character), trimws),
         industry = gsub("(.\\([A-S]\\))", x = industry, replacement = ""),
         year = year(date),
         month = month(date, abbr = FALSE, label = TRUE)) |> 
  filter(!grepl(" - Percentage changes", indicator),
         table_title != "Table 22 Revisions Table",
         !is.na(value))  |> 
  select("date", 
         "month", 
         "year", 
         "prefix", 
         "indicator", 
         "state", 
         "industry", 
         "series_type", 
         "value",
         "unit")

file.remove(paste0("data-raw/", urls))

use_data(labour_account, overwrite = TRUE, compress = "xz")
