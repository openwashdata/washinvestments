


library(tidyverse)
library(openwashdata)
library(janitor)

# import data -------------------------------------------------------------

data_in <- read_csv("data-raw/wash-dev-mdb_20221223_data.csv")

washinvestments <- data_in |>
  clean_names() |>
  glimpse()

washinvestments |>
  count(region)

washinvestments |>
  count(multi_country)


# export data -------------------------------------------------------------

## code to prepare `DATASET` dataset goes here

usethis::use_data(washinvestments, overwrite = TRUE)
