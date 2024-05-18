#Load packages
library(tidyverse)
library(readr)

#Load data
data_formentera <- read_csv("Data/data_formentera.csv")
View(data_formentera)

#What location were best rated by couples?
data_formentera |>
  filter(trip_type == "Couples") |>
  group_by(name) |>
  summarise(mean_rating = mean(rating)) |>
  arrange(desc(mean_rating)) |>
  head(5)

#What location was most rated by couples?
data_formentera |>
  filter(trip_type == "Couples") |>
  group_by(name) |>
  summarise(n = n()) |>
  arrange(desc(n)) |>
  head(5)
