# Description -------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages -----------------------------------------------------------
library(readxl)
library(tidyverse)
library(janitor)
library(dplyr)

# Read data -------------------------------------------------------------
data_in <- read_csv("data-raw/wash-dev-mdb_20221223_data.csv") |>
  as_tibble()

# Tidy data ---------------------------------------------------------------
# Adjust variables' names
washinvestments <- data_in |>
  clean_names()

# Fix the text encoding
# The raw CSV mixes two encodings: most accented text is Windows-1252 (for
# example "Lomé", typographic dashes and apostrophes), but a few values are
# already valid UTF-8. Convert only the values that are not valid UTF-8, from
# Windows-1252 to UTF-8, and keep the valid ones as they are.
to_utf8 <- function(x) {
  invalid <- !is.na(x) & !validUTF8(x)
  x[invalid] <- iconv(x[invalid], from = "windows-1252", to = "UTF-8")
  x
}
washinvestments <- washinvestments |>
  mutate(across(where(is.character), to_utf8))
stopifnot(all(unlist(lapply(
  Filter(is.character, washinvestments),
  function(x) validUTF8(x[!is.na(x)])
))))

# Fix a spelling error in the region names ("Nothern Europe")
washinvestments <- washinvestments |>
  mutate(region = if_else(region == "Nothern Europe", "Northern Europe", region))

# Remove exact duplicate rows (one record, 53284-001, appears twice with
# identical values in every column)
washinvestments <- washinvestments |>
  distinct()

# Modify variables' types
washinvestments <- washinvestments |>
  mutate(non_network_infrastructure = as.logical(non_network_infrastructure))

# Write data -------------------------------------------------------------
# The CSV and the XLSX export are written from the same object.
usethis::use_data(washinvestments, overwrite = TRUE, version = 2)
fs::dir_create(here::here("inst", "extdata"))
write_csv(washinvestments, here::here("inst", "extdata", "washinvestments.csv"))
openxlsx::write.xlsx(
  washinvestments,
  here::here("inst", "extdata", "washinvestments.xlsx")
)
