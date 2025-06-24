source_files <- list.files("data-raw")
source_files <- paste0("data-raw/", source_files[grep(".R", source_files)])
#Exclude THIS file from being sourced - or else get stuck in a loop
source_files <- source_files[!grepl("data-raw/update_abs.R", source_files)]
#Exclude "included data" file from being sourced - do that separately
source_files <- source_files[!grepl("data-raw/included_data.R", source_files)]

#Update Data
Map(source, source_files)
#Document Data
devtools::document()
#Update included data
source("data-raw/included_data.R")

