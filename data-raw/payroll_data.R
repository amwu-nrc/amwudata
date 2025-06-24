## code to prepare `payroll_data` dataset goes here
library(readabs)
library(usethis)

payroll_index <- read_payrolls("industry_jobs", path = "data-raw")
payroll_index_industry <- read_payrolls("subindustry_jobs", path = "data-raw")
payroll_index_business <- read_payrolls("empsize_jobs", path = "data-raw")

file.remove(c("data-raw/6160055001_DO001.xlsx",
              "data-raw/6160055001_DO002.xlsx",
              "data-raw/6160055001_DO003.xlsx"))

use_data(payroll_index, overwrite = TRUE, compress = "xz")
use_data(payroll_index_industry, overwrite = TRUE, compress = "xz")
use_data(payroll_index_business, overwrite = TRUE, compress = "xz")
