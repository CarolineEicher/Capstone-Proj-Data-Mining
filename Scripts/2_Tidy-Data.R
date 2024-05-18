#Load packages
library(tidyverse)
library(readr)

#Load data
attractions_formentera <- read_csv("Data/attractions_formentera.csv")
View(attractions_formentera)

reviews_formentera <- read_csv("Data/reviews_formentera.csv")
View(reviews_formentera)

#Rename the columns
reviews_formentera_tidy <- reviews_formentera |> 
  rename(`review_id`= `all_reviews$id`) |> 
  rename(`location_id`= `all_reviews$location_id`) |>
  rename('published_date' = `all_reviews$published_date`) |>
  rename('rating' = `all_reviews$rating`) |>
  rename('text' = `all_reviews$text`) |>
  rename('title' = `all_reviews$title`) |>
  rename('trip_type' = `all_reviews$trip_type`)
 
View(reviews_formentera_tidy)

#Combine the data
data_formentera <- attractions_formentera |> 
  left_join(reviews_formentera_tidy, by = "location_id")

View(data_formentera)

#Remove NA
data_formentera <- data_formentera |>
  filter(!is.na(review_id))

#Save the data
write_csv(data_formentera, "Data/data_formentera.csv")
