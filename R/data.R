#' @title Counts of Australian Businesses, including Entries and Exists, June 2015 to June 2019
#'
#' @description
#' A dataset containing the number of businesses, by industry division, by SA2 statistical areas,
#' by employment size ranges
#'
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{date}
#' \item{division}{Industry division of operating business}
#' \item{sa2_main_2016}{9 digit statistical area code (2016 SA2)}
#' \item{sa2_name_2016}{Name of statistical area}
#' \item{indicator}{Employment ranges}
#' }
#'
#' @source \url{https://www.abs.gov.au/AUSSTATS/abs@.nsf/Lookup/8165.0Main+Features2June%202015%20to%20June%202019?OpenDocument}
#'
"business_counts_sa2"


#' @title ABS Employment by Industry
#'
#' @description
#' A dataset containing quarterly national and sub-national employment indicators
#' by industry of employment since February 1991.
#'
#' @format A dataframe with 11 variables:
#' \describe{
#' \item{date}{Date}
#' \item{year}{Year}
#' \item{month}{Month}
#' \item{indicator}{Indicator}
#' \itemize{
#' \item{Employed total}
#' \item{Underemployed total}
#' \item{Underemployment ratio (proportion of employed)}
#' \item{Employed full-time}
#' \item{Employed part-time}
#' }
#' \item{industry}{Industry of employment}
#' \item{gender}{Gender}
#' \item{age}{Age}
#' \item{state}{State}
#' \item{series_type}{Level of adjustment of original data: original (no adjustment), seasonally adjusted, or trend}
#' \item{value}{Value of employment indicator}
#' \item{unit}{Unit of measurement for indiciator}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/PrimaryMainFeatures/6291.0.55.001?OpenDocument}
"industry_employment"


#' @title Internet Vacancies Index
#'
#' @description
#' A dataset containing monthly nation and sub-national internet vacancies by
#' occupation since January 2006. Data is updated monthly, about one week
#' after the Labour Force Survey is released.
#'
#' @format A dataframe with 6 variables
#' \describe{
#' \item{date}{Date}
#' \item{state}{State}
#' \item{occupation_level}{ANZSCO Occupation Level}
#' \item{anzsco_code}{ANZSCO Occupation Code}
#' \item{anzsco_title}{ANZSCO Occupation Name}
#' \item{value}{Number of vacancies}
#' }
#'
#' @source \url{https://lmip.gov.au/default.aspx?LMIP/GainInsights/VacancyReport}
"internet_vacancy_index"

#' @title Internet Vacancies Index - Regional
#'
#' @description
#' A dataset containing monthly nation and sub-national internet vacancies by
#' occupation since January 2006. Data is updated monthly, about one week
#' after the Labour Force Survey is released.
#'
#' @format A dataframe with 7 variables
#' \describe{
#' \item{date}{Date}
#' \item{state}{State}
#' \item{occupation_level}{ANZSCO Occupation Level}
#' \item{anzsco_code}{ANZSCO Occupation Code}
#' \item{vacancy_region}{Vacancy Region}
#' \item{value}{Number of vacancies}
#' }
#'
#' @source \url{https://lmip.gov.au/default.aspx?LMIP/GainInsights/VacancyReport}
"internet_vacancy_regional"

#' @title JobSeeker data by SA2
#'
#' @description
#' Department of Social Services estimates of monthly jobseeker and
#' youth allowance payments since March 2020
#'
#' @format A data frame with 4 variables
#' \describe{
#' \item{sa2_code}{Statistical Area 2 Code. A mix of 2016 and 2021 boundaries}
#' \item{sa2_name}{Statistical Area 2 Name. A mix of 2016 and 2021 boundaries}
#' \item{date}{Date}
#' \item{indicator}{Jobseeker payment, Youth allowance other, Jobseeker growth, Youth allowance growth}
#' \item{value}{Value}
#' }
#'
#' @source \url{https://data.gov.au/data/dataset/jobseeker-payment-and-youth-allowance-recipients-monthly-profile}
"jobseeker_sa2"

#' ABS Labour Account
#'
#' Experimental ABS labour force data
#'
#' @format A data frame with 10 variables
#' \describe{
#' \item{date}{Date}
#' \item{month}{Month}
#' \item{year}{Year}
#' \item{prefix}{Prefix on the indicator - safe to ignore}
#' \item{indicator}{Labour account indicator}
#' \item{state}{State}
#' \item{industry}{Industry}
#' \item{series_type}{Series type}
#' \item{value}{Value}
#' \item{unit}{Unit of value}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6150.0.55.003}
"labour_account"

#' ABS Labour Force Survey
#'
#' Detailed monthly and quarterly Labour Force Survey data, including hours, regions, families, job search, 
#' job duration, casual, industry and occupation. 
#' 
#' @format A data frame with 10 variables:
#' \describe{
#' \item{data}{Data name}
#' \item{date}{date of survey}
#' \item{sex}{sex of individual surveyed: persons, male, or female}
#' \item{age}{age of individual surveyed}
#' \item{state}{state or territory (including Australia)}
#' \item{series_type}{level of adjustment of original data: original (no adjustment), seasonally adjusted, or trend}
#' \item{unit}{unit of measurement for indicator}
#' \item{indicator}{labour force indicator}
#' \item{value}{value of labour force indicator}
#' }
#'
#' @source Tables 12, 12a, 22, 23, 23a \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6202.0}
"labour_force"

#' ABS Labour Force Survey - 12 month series
#'
#' A dataset containing monthly national and sub-national labour force
#' indicators for the previous 12 months.
#'
#' @format A data frame with 10 variables:
#' \describe{
#' \item{date}{date of survey}
#' \item{sex}{sex of individual surveyed: persons, male, or female}
#' \item{state}{state or territory (including Australia)}
#' \item{series_type}{level of adjustment of original data: original (no adjustment), seasonally adjusted, or trend}
#' \item{unit}{unit of measurement for indicator}
#' \item{indicator}{labour force indicator}
#' \item{value}{value of labour force indicator}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6202.0}
"labour_force_briefing"

#' ABS Weekly Payroll Index
#'
#' ABS Weekly Payroll data since 4th January 2020.
#'
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{Date}
#' \item{industry}{Industry}
#' \item{age}{Age group}
#' \item{state}{State}
#' \item{value}{Value}
#' \item{series}{Series}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6160.0.55.001}
"payroll_index"

#' ABS Weekly Payroll Index - Business Size
#'
#' ABS Weekly Payroll data since 4th January 2020.
#'
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{Date}
#' \item{emp_size}{Size of Business (Employment)}
#' \item{age}{Age group}
#' \item{state}{State}
#' \item{value}{Value}
#' \item{series}{Series}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6160.0.55.001}
"payroll_index_business"

#' ABS Weekly Payroll Index - Industry
#'
#' ABS Weekly Payroll data since 4th January 2020.
#'
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{Date}
#' \item{industry}{Industry}
#' \item{industry_subdivision}{Industry Subdivision}
#' \item{value}{Value}
#' \item{series}{Series}
#' }
#'
#' @source \url{https://www.abs.gov.au/ausstats/abs@.nsf/mf/6160.0.55.001}
"payroll_index_industry"

#' DESE Small (SA2) Area Labour Market 
#'
#' The Department of Education, Skills and Employment quarterly regional
#' estimates of unemployment and the unemployment rate at the Statistical
#' Area Level 2 (SA2)
#'
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{indicator}{One of Labour force total, Unemployment rate, Unemployed total}
#' \item{sa2_name_2016}{Name of the SA2 region}
#' \item{sa2_main_2016}{9 digit code representing the SA2 region}
#' \item{date}{Quarterly since December 2010}
#' \item{value}{Value of the indicator}
#' \item{state_name_2016}{State name}
#' }
#'
#' @source \url{https://www.employment.gov.au/small-area-labour-markets-publication-0}
"small_area_labour_market"


#' South Australia Historic Net Debt
"south_australia_net_debt"

#' ABS National Accounts 
"national_accounts"

#' Australian Manufacturing
#' 
#' Annual estimates of key economic and financial performance
#' of industries in Australia, including income, expenses,
#' profit and capital expenditure. Manufacturing industry only, 
#' previous three financial years. 
#' 
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{date}
#' \item{data}{data name}
#' \item{indicator}{Indicator}
#' \item{state}{State}
#' \item{anzsic_subdivision}{anzsic_subdivision}
#' \item{anzsic_subdivision_code}{anzsic_subdivision_code}
#' \item{series_type}{series type}
#' \item{value}{value}
#' \item{unit}{unit}
#' }
"aus_manufacturing"


#' Hours worked
"hours_worked"


#' Underemployment by industry
"industry_underemployment"

#' Underemployment by occupation
"occupation_underemployment"

#' Experimental household spending
"household_spending"

#' Monthly Consumer Price Index Indicator
#' The monthly CPI indicator is a measure of inflation and includes statistics about prices for 
#' categories of households expenditures. This dataset includes index numbers and percentage changes
#' for Australia for all CPI groups since September 2017.
#' 
#' @format A dataframe with 6 variables:
#' \describe{
#' \item{date}{Date}
#' \item{indicator}{Indicator}
#' \item{cpi_group}{CPI Group}
#' \item{state}{State. Australia is a weighted average of 8 capital cities.}
#' \item{unit}{Data unit}
#' \item{value}{Value}
#' }
#' @source Table 1 \url{https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/monthly-consumer-price-index-indicator/latest-release}
"cpi_monthly"

#' Quarterly Consumper Price Index Indicator
#' The quarterly CPI measures household inflation and includes statistics about
#' price changes for categories of household expenditure. This dataset includes index numbers
#' for capital cities and Australia, for CPI expenditure classes.
#' 
#' @format A dataframe with 9 variables:
#' \describe{
#' \item{date}{Date}
#' \item{indicator}{Index Numbers}
#' \item{cpi_expenditure_class}{CPI Expenditure Class}
#' \item{state}{Capital City}
#' \item{value}{Indexed CPI}
#' \item{unit}{Unit}
#' \item{group}{CPI Group}
#' \item{sub_group}{CPI Subgroup}
#' \item{reindex}{Value reindexed}
#' }
"cpi_quarterly"

#' Quarterly Wage Price Index 
#' The WPI measures changes in the price of labour, unaffected by compositional shifts in the labour force, hours worked or
#' employee characteristics. This dataset includes quarterly index numbers and percentage changes
#' for all states including Australia, private and public sector, and industry of employment. 
#' 
#' @format A dataframe with 8 variables:
#' \describe{
#' \item{date}{Date}
#' \item{data_type}{The type of data. One of Quarterly Index, Percentage Change from Previous Quarter, Percentage Change from Corresponding Quarter of Previous Year}
#' \item{indicator}{Indicator}
#' \item{state}{State}
#' \item{sector}{Private and Public, Private, Public}
#' \item{industry}{Industry}
#' \item{unit}{Data unit}
#' \item{value}{Value}
#' }
#' @source Tables 2bto9b \url{https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/wage-price-index-australia/latest-release}
"wpi_quarterly"

#' Productivity
#' Productivity related data, including real compensation per hour worked
#' @format A dataframe with 12 variables:
#' \describe{
#' \item{date}{Date}
#' \item{total_compensation}{wages and salaries and employed social contributions}
#' \item{wages_and_salaries}{wages and salaries}
#' \item{employer_contribution}{employer social contributions}
#' \item{gdp_deflator}{gdp deflator}
#' \item{real_compensation}{total compensation, deflated with gdp}
#' \item{total_hours_worked}{total hours worked of employees, and owner managers of incorporated enterprises}
#' \item{total_hours_worked_4ma}{4 quarter moving average of total hours worked}
#' \item{hours_worked_index}{total hours worked, indexed to March 1991}
#' \item{real_compensation_per_hour}{Compensation per hour worked, deflated with gdp}
#' \item{real_compensation_per_hour_index}{Real compensation per hour indexed to December 1991}
#' \item{gdp_per_hour_index}{GDP per hour indexed to December 1991}
#' }
#' @source Table 1,5,7 \url{https://www.abs.gov.au/statistics/economy/national-accounts/australian-national-accounts-national-income-expenditure-and-product/mar-2025}
"productivity"



