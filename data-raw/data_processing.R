


library(tidyverse)
library(openwashdata)
library(janitor)

# import data -------------------------------------------------------------

data_in <- read_csv("data-raw/wash-dev-mdb_20221223_data.csv")

data_out <- data_in |>
  clean_names() |>
  glimpse()



# export data -------------------------------------------------------------

## code to prepare `DATASET` dataset goes here

usethis::use_data(data_out, overwrite = TRUE)
