## code to prepare `small_area_labour_market` dataset goes here
library(rvest)
library(usethis)
library(readr)
library(dplyr)
library(purrr)

url <- "https://www.dewr.gov.au/employment-research/small-area-labour-markets#downloads"

path_to_file <- read_html(url) |> 
  html_elements(xpath = "/html/body/div[2]/div/div/div[2]/div/main/section/div/div[3]/div/article/div/div[3]/div[9]/div/div/p[4]/a") |> 
  html_attr("href")

url <- paste0("https://www.dewr.gov.au", path_to_file)

path_to_file <- read_html(url) |> 
  html_elements(xpath = "/html/body/div[2]/div/div/div[2]/div/main/section/div/div[3]/div/article/div/div[2]/div[1]/div[2]/ul/li[1]/a") |> 
  html_attr("href")

path_to_file <- paste0("https://www.dewr.gov.au", path_to_file)



small_area_labour_market <- function(path_to_file) {
  small_area_labour_market <- read_csv(path_to_file,
                                       skip = 1,
                                       show_col_types = F,
                                       na = "-") |> 
    mutate(across(where(is.numeric), as.character)) |> 
    rename(indicator = "Data Item",
           sa2_name = "Statistical Area Level 2 (SA2) (2021 ASGS)",
           sa2_code = "SA2 Code (2021 ASGS)") |> 
    pivot_longer(cols = -c("indicator",
                           "sa2_name",
                           "sa2_code"),
                 names_to = "date",
                 values_to = "value") |> 
    mutate(value =  as.numeric(gsub(",", "", value)),
           date = as.Date(paste0(.data$date, "-01"), format = "%b-%y-%d")) |> 
    select(date, sa2_code, sa2_name, indicator, value)
  
  use_data(small_area_labour_market, compress = "xz", overwrite = TRUE)
}

tryCatch(small_area_labour_market(path_to_file),
         error = function(e) {
           message("Unable to read file. It probably could not be downloaded.")
           print(e)
         })

