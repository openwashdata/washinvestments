# Description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages -----------------------------------------------------------

library(readxl)
library(tidyverse)
library(openwashdata)
library(janitor)
library(dplyr)

# Read data -------------------------------------------------------------

data_in <- read_csv("data-raw/wash-dev-mdb_20221223_data.csv") |>
  as_tibble()

washinvestments <- data_in |>
  clean_names()

# Tidy data ---------------------------------------------------------------

# Modify variables' types

washinvestments <- washinvestments |>
  mutate(non_network_infrastructure = as.logical(non_network_infrastructure))

# Write data -------------------------------------------------------------

usethis::use_data(washinvestments, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
write_csv(washinvestments, here::here("inst", "extdata", "washinvestments.csv"))
openxlsx::write.xlsx(washinvestments, here::here("inst", "extdata", "washinvestments.xlsx"))
