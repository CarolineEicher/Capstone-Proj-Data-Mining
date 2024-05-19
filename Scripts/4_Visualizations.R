#Load packages
library(tidyverse)
library(ggplot2)

#Load data
data_formentera <- read_csv("Data/data_formentera.csv")
View(data_formentera)

#Plot top attractions rated by couples
data_formentera |>
  filter(trip_type == "Couples") |>
  group_by(name) |>
  summarise(mean_rating = mean(rating)) |>
  arrange(desc(mean_rating)) |>
  head(5) |> 
  ggplot(aes(x = reorder(name, mean_rating), y = mean_rating)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(x = "Attraction",
       y = "Mean Rating") +
  theme_minimal()

#save the plot
ggsave("Visualizations/attractions_best-rated-by-couples.png")


#Plot attractions most rated by couples
data_formentera |>
  filter(trip_type == "Couples") |>
  group_by(name) |>
  summarise(n = n()) |>
  arrange(desc(n)) |>
  head(5) |> 
  ggplot(aes(x = reorder(name, n), y = n)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(x = "Attraction",
       y = "Number of Ratings") +
  theme_minimal()

#save the plot
ggsave("Visualizations/attractions_most-rated-by-couples.png")
