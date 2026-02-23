## code to prepare `price_indices` datasets goes here
library(readabs)
library(dplyr)
library(tidyr)
library(tibble)

cpi_groups <- tibble::tribble(
  ~group,                                           ~sub_group,                                      ~expenditure_class,
  "Food and non-alcoholic beverages",                          "Bread and cereal products",                                                 "Bread",
  "Food and non-alcoholic beverages",                          "Bread and cereal products",                                    "Cakes and biscuits",
  "Food and non-alcoholic beverages",                          "Bread and cereal products",                                     "Breakfast cereals",
  "Food and non-alcoholic beverages",                          "Bread and cereal products",                                 "Other cereal products",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                         "Beef and veal",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                                  "Pork",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                         "Lamb and goat",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                               "Poultry",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                           "Other meats",
  "Food and non-alcoholic beverages",                                  "Meat and seafoods",                                "Fish and other seafood",
  "Food and non-alcoholic beverages",                         "Dairy and related products",                                                  "Milk",
  "Food and non-alcoholic beverages",                         "Dairy and related products",                                                "Cheese",
  "Food and non-alcoholic beverages",                         "Dairy and related products",                    "Ice cream and other dairy products",
  "Food and non-alcoholic beverages",                               "Fruit and vegetables",                                                 "Fruit",
  "Food and non-alcoholic beverages",                               "Fruit and vegetables",                                            "Vegetables",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                                                  "Eggs",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                               "Jams, honey and spreads",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                         "Food additives and condiments",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                                         "Oils and fats",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                              "Snacks and confectionery",
  "Food and non-alcoholic beverages",                                "Food products n.e.c",                             "Other food products n.e.c.",
  "Food and non-alcoholic beverages",                            "Non-alcoholic beverages",                                 "Coffee, tea and cocoa",
  "Food and non-alcoholic beverages",                            "Non-alcoholic beverages",                        "Waters, soft drinks and juices",
  "Food and non-alcoholic beverages",                      "Melas out and take away foods",                                      "Restaurant meals",
  "Food and non-alcoholic beverages",                      "Melas out and take away foods",                              "Take away and fast foods",
  "Alcohol and tobacco",                                "Alcoholic beverages",                                               "Spirits",
  "Alcohol and tobacco",                                "Alcoholic beverages",                                                  "Wine",
  "Alcohol and tobacco",                                "Alcoholic beverages",                                                  "Beer",
  "Alcohol and tobacco",                                            "Tobacco",                                               "Tobacco",
  "Clothing and footwear",                                           "Garments",                                      "Garments for men",
  "Clothing and footwear",                                           "Garments",                                    "Garments for women",
  "Clothing and footwear",                                           "Garments",                     "Garments for infants and children",
  "Clothing and footwear",                                           "Footwear",                                      "Footwear for men",
  "Clothing and footwear",                                           "Footwear",                                    "Footwear for women",
  "Clothing and footwear",                                           "Footwear",                     "Footwear for infants and children",
  "Clothing and footwear",                  "Accessories and clothing services",                                           "Accessories",
  "Clothing and footwear",                  "Accessories and clothing services",    "Cleaning, repair and hire of clothing and footwear",
  "Housing",                                              "Rents",                                                 "Rents",
  "Housing",           "New dwelling purchase by owner-occupiers",              "New dwelling purchase by owner-occupiers",
  "Housing",                                      "Other housing",                "Maintenance and repair of the dwelling",
  "Housing",                                      "Other housing",                            "Property rates and charges",
  "Housing",                                          "Utilities",                                    "Water and sewerage",
  "Housing",                                          "Utilities",                                           "Electricity",
  "Housing",                                          "Utilities",                         "Gas and other household fuels",
  "Furnishings, household equipment and services",                           "Furniture and furnishing",                                             "Furniture",
  "Furnishings, household equipment and services",                           "Furniture and furnishing",                     "Carpets and other floor coverings",
  "Furnishings, household equipment and services",           "Household appliances, utensils and tools",              "Household appliances, utensils and tools",
  "Furnishings, household equipment and services",           "Household appliances, utensils and tools",                            "Major household appliances",
  "Furnishings, household equipment and services",           "Household appliances, utensils and tools",                   "Small electric household appliances",
  "Furnishings, household equipment and services",           "Household appliances, utensils and tools",           "Glassware, tableware and household utensils",
  "Furnishings, household equipment and services",           "Household appliances, utensils and tools",              "Tools and equipment for house and garden",
  "Furnishings, household equipment and services",                     "Non-durable household products",                     "Cleaning and maintenance products",
  "Furnishings, household equipment and services",                     "Non-durable household products",                                "Personal care products",
  "Furnishings, household equipment and services",                     "Non-durable household products",                  "Other non-durable household products",
  "Furnishings, household equipment and services",                    "Domestic and household services",                                            "Child care",
  "Furnishings, household equipment and services",                    "Domestic and household services",           "Hairdressing and personal grooming services",
  "Furnishings, household equipment and services",                    "Domestic and household services",                              "Other household services",
  "Health",         "Medical products, appliances and equipment",                               "Pharmaceutical products",
  "Health",         "Medical products, appliances and equipment",                  "Therapeutic appliances and equipment",
  "Health",              "Medical, dental and hospital services",                         "Medical and hospital services",
  "Health",              "Medical, dental and hospital services",                                       "Dental services",
  "Transport",                                   "Private motoring",                                        "Motor vehicles",
  "Transport",                                   "Private motoring",        "Spare parts and accessories for motor vehicles",
  "Transport",                                   "Private motoring",                                       "Automotive fuel",
  "Transport",                                   "Private motoring",              "Maintenance and repair of motor vehicles",
  "Transport",                                   "Private motoring",           "Other services in respect of motor vehicles",
  "Transport",                              "Urban transport fares",                                 "Urban transport fares",
  "Communication",                                      "Communication",                                       "Postal services",
  "Communication",                                      "Communication",              "Telecommunication equipment and services",
  "Recreation and culture", "Audio, visual and computing equipment and services",                 "Audio, visual and computing equipment",
  "Recreation and culture", "Audio, visual and computing equipment and services",        "Audio, visual and computing media and services",
  "Recreation and culture",                   "Newspapers, books and stationery",                                                 "Books",
  "Recreation and culture",                   "Newspapers, books and stationery",                  "Newspapers, magazines and stationery",
  "Recreation and culture",                   "Holiday travel and accommodation",             "Domestic holiday travel and accommodation",
  "Recreation and culture",                   "Holiday travel and accommodation",       "International holiday travel and accommodation",
  "Recreation and culture",                "Other recreation, sport and culture", "Equipment for sports, camping and open-air recreation",
  "Recreation and culture",                "Other recreation, sport and culture",                               "Games, toys and hobbies",
  "Recreation and culture",                "Other recreation, sport and culture",                             "Pets and related products",
  "Recreation and culture",                "Other recreation, sport and culture",                "Veterinary and other services for pets",
  "Recreation and culture",                "Other recreation, sport and culture",                                  "Sports participation",
  "Recreation and culture",                "Other recreation, sport and culture",    "Other recreational, sporting and cultural services",
  "Education",                                          "Education",                       "Preschool and primary education",
  "Education",                                          "Education",                                   "Secondary education",
  "Education",                                          "Education",                                    "Tertiary education",
  "Insurance and financial services",                                          "Insurance",                                             "Insurance",
  "Insurance and financial services",                                 "Financial services",          "Deposit and loan facilities (direct charges)",
  "Insurance and financial services",                                 "Financial services",                              "Other financial services"
)




cpi_expenditure_class <- cpi_groups |> 
  distinct(expenditure_class, group)

cpi_sub_group <- cpi_groups |> 
  distinct(expenditure_class, sub_group)


cpi_quarterly_raw <- read_abs("6401.0", tables = c(17), retain_files = F) |> 
  separate_series(column_names = c("indicator", "expenditure_class", "state"), remove_nas = TRUE) 


cpi_quarterly_group <- cpi_quarterly_raw |>
  filter(expenditure_class %in% c(cpi_groups$group, "All groups CPI")) |>
  select(date, indicator, group = expenditure_class, state, value, unit) |>
  distinct() |> 
  mutate(cpi_expenditure_class = paste0(group, " (Total)"),
         sub_group = paste0(group, " (Total)"))

cpi_quarterly_sub_group <- cpi_quarterly_raw |>
  filter(expenditure_class %in% c(cpi_groups$sub_group, "All groups CPI")) |>
  select(date, indicator, sub_group = expenditure_class, state, value, unit) |>
  distinct() |> 
  mutate(cpi_expenditure_class = paste0(sub_group, " (Total)")) |> 
  left_join(cpi_groups, by = c("sub_group"))

cpi_quarterly_expenditure_class <- cpi_quarterly_raw |> 
  filter(expenditure_class %in% c(cpi_groups$expenditure_class, "All groups CPI")) |> 
  select(date, indicator, cpi_expenditure_class = expenditure_class, state, value, unit) |> 
  distinct()

cpi_quarterly <- cpi_quarterly_expenditure_class |> 
  left_join(cpi_groups, by = c("cpi_expenditure_class" = "expenditure_class")) |> 
  replace_na(list(group = "All groups CPI", sub_group = "All groups CPI")) |> 
  bind_rows(cpi_quarterly_group,
            cpi_quarterly_sub_group) |> 
  distinct() |> 
  filter(indicator == "Index Numbers") |> 
  group_by(cpi_expenditure_class, state) |> 
  mutate(reindex = 100*value/value[date == "2020-03-01"]) |> 
  ungroup() 

wpi_quarterly <- read_abs("6345.0", tables = paste0(c(2:5, 7:9), "b"), retain_files = F) |> 
  separate_series(column_names = c("data_type", "indicator", "state", "sector", "industry")) |> 
  select(date, data_type, indicator, state, sector, industry, unit, value) |>
  group_by(data_type, indicator, state, sector, industry) |> 
  mutate(reindex = 100*value/value[date == "2020-03-01"]) |> 
  ungroup() 


usethis::use_data(wpi_quarterly, compress = 'xz', overwrite = TRUE)
usethis::use_data(cpi_quarterly, compress = "xz", overwrite = TRUE)
