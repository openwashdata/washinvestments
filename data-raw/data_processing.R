# Description -------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Install package for detecting and deleting non-UTF8 entries -------------
#install.packages("remotes")
#remotes::install_github("shug0131/cctu")

# Load packages -----------------------------------------------------------
library(readxl)
library(tidyverse)
library(openwashdata)
library(janitor)
library(dplyr)
library(cctu)

# Read data -------------------------------------------------------------
data_in <- read_csv("data-raw/wash-dev-mdb_20221223_data.csv") |>
  as_tibble()

# Tidy data ---------------------------------------------------------------
# Adjust variables' names
washinvestments <- data_in |>
  clean_names()

# Modify variables' types
washinvestments <- washinvestments |>
  mutate(non_network_infrastructure = as.logical(non_network_infrastructure))

# Write data -------------------------------------------------------------
usethis::use_data(washinvestments, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
write_csv(washinvestments, here::here("inst", "extdata", "washinvestments.csv"))
# Remove non-UTF8 entries
cctu::detect_invalid_utf8(washinvestments)
washinvestments_utf8 <- cctu::remove_invalid_utf8(washinvestments)
openxlsx::write.xlsx(washinvestments_utf8, here::here("inst", "extdata", "washinvestments_utf8.xlsx"))
