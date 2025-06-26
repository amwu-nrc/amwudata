## code to prepare `manufacturing` dataset goes here
library(readabs)
library(readxl)
library(tidyr)
library(dplyr)
library(stringr)
library(usethis)



aus_manufacturing <- read_abs_url(url = "https://www.abs.gov.au/statistics/industry/industry-overview/australian-industry/latest-release/81550tssdivc.xlsx")  |> 
  separate_wider_delim(cols = series, delim = " ; ", names_sep = "", too_few = "align_start") |> 
  mutate(across(contains("series"), trimws),
         across(contains("series"), ~trimws(str_remove_all(.x, ";"))),
         series3 = ifelse(is.na(series3), series2, series3),
         series1 = ifelse(series2 == "Off-June adjusted", paste(series1, series2), series1),
         series2 = ifelse(!series2 %in% c("NSW", "Vic.", "Qld", "SA", "WA", "Tas.", "NT", "ACT"), "Australia", series2),
         anzsic_subdivision_code = str_extract(series3, "\\d{2,4}"),
         anzsic_subdivision_code = ifelse(is.na(anzsic_subdivision_code), "C", anzsic_subdivision_code),
         anzsic_subdivision = trimws(str_replace(series3, "\\d{2,4}", "")),
         data = "australian_industry") |> 
  filter(!is.na(value)) |> 
  select(date, data, indicator = series1, state = series2, anzsic_subdivision, anzsic_subdivision_code, series_type, value, unit)


use_data(aus_manufacturing, overwrite = TRUE, compress = "xz")
