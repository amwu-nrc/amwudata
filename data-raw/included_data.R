## code to prepare `included_data` dataset goes here
library(tibble)
library(purrr)

included_data <- tribble(
  ~data_name, ~description, ~last_updated,
  'aus_manufacturing', 'Annual estimates of key economic and financial performance of the Manufacturing industry in Australia, including income, expenses, profit and capital expenditure', NA_character_,
  'business_counts_sa2', "Counts of actively trading businesses, by industry, business size, and SA2 region.", NA_character_,
  "cpi_quarterly", "The quarterly CPI measures household inflation and includes statistics about price changes for categories of household expenditure", NA_character_,
  "wpi_quarterly", "The WPI measures changes in the price of labour, unaffected by compositional shifts in the labour force, hours worked or employee characteristics", NA_character_,
  'hours_worked', "Monthly hours worked in all jobs", NA_character_,
  "household_spending", "Experimental estimates of household spending", NA_character_,
  "industry_employment", "Employment by ANZSIC group (3-digit)", NA_character_,
  "industry_underemployment", "Underemployment data by ANZSIC industry (1-digit)", NA_character_,
  "internet_vacancy_index", "Number of online job advertisments by occupation", NA_character_,
  "internet_vacancy_regional", "Number of online job advertisments by occupation and internet vacancy region", NA_character_,
  "jobseeker_sa2", "Number of individuals recieving a jobseeker payment or youth allowance payment by SA2 region", NA_character_,
  "labour_account", "Quarterly time series data across Jobs, Persons, Hours and Payments", NA_character_,
  "labour_force", "Headline estimates of employment, unemployment, underemployment, participation and hours worked from the monthly Labour Force Survey", NA_character_,
  "labour_force_briefing", "A subset of the previous 5 years of the labour force survey", NA_character_,
  "payroll_index", "Weekly payroll job indexes, sourced from Single Touch Payroll data", NA_character_,
  "payroll_index_business", "Weekly payroll job indexes, sourced from Single Touch Payroll data", NA_character_,
  "payroll_index_industry", "Weekly payroll job indexes, sourced from Single Touch Payroll data", NA_character_,
  "small_area_labour_market", "Labour market developments by SA2 region", NA_character_,

)

get_max_date <- function(data_name) {
  data_path <- paste0("data/", data_name, ".rda")
  d <- get(load(data_path))
  safe_max <- safely(.f = max)
  safe_max(d$date)
}

dates <- included_data$data_name |> 
  map(get_max_date) |> 
  transpose() |> 
  pluck("result") |> 
  list_c()

included_data <- included_data |> 
  mutate(last_updated = dates)

write.table(included_data, file = "data-raw/included_data.txt")
