# Load packages ----
library(shiny)
library(bslib)
library(tidyverse)
library(ggplot2)

#Load data ----
data_formentera <- read_csv("./Data/data_formentera.csv")

# Define UI ----
ui <- page_sidebar(
  title = "Hello Traveller!",
  sidebar = sidebar(
    helpText(
      "Choose your Travel Interests"
      ),
    selectInput(
      "destination",
      label = "Destination",
      choices = list(
        "Formentera"
        ),
      selected = "Formentera"
    ),
    selectInput(
      "location_type",
      label = "Location Type",
      choices = list(
        "Attractions"
      ),
      selected = "Attractions"
    ),
    selectInput(
      "travel_type",
      label = "Your Travel Group Type",
      choices = list(
        "Couples", 
        "Family", 
        "Friends getaway", 
        "Solo travel"),
      selected = "Couples"
    )
  ),
  card(
    card_header("Welcome to the Traveller App"),
    "This app is designed to help you planing your next trip. Select your interests and 
    we will show the must see places for you in your next travel destination based on 
    your fellow travellers ratings.",
    card_footer("Happy Travelling!")
    ),
  card(plotOutput("selected_travel_interests"))
)

# Define server logic ----
server <- function(input, output) {
  output$selected_travel_type <- renderPlot({
    data <- switch(input$travel_type,
                   "Couples" = data_formentera |>
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
                     theme_minimal(),
                   "Family" = data_formentera |>
                     filter(trip_type == "Family") |>
                     group_by(name) |>
                     summarise(mean_rating = mean(rating)) |>
                     arrange(desc(mean_rating)) |>
                     head(5) |> 
                     ggplot(aes(x = reorder(name, mean_rating), y = mean_rating)) +
                     geom_bar(stat = "identity", fill = "skyblue") +
                     coord_flip() +
                     labs(x = "Attraction",
                          y = "Mean Rating") +
                     theme_minimal(),
                   "Friends getaway" = data_formentera |>
                     filter(trip_type == "Friends getaway") |>
                     group_by(name) |>
                     summarise(mean_rating = mean(rating)) |>
                     arrange(desc(mean_rating)) |>
                     head(5) |> 
                     ggplot(aes(x = reorder(name, mean_rating), y = mean_rating)) +
                     geom_bar(stat = "identity", fill = "skyblue") +
                     coord_flip() +
                     labs(x = "Attraction",
                          y = "Mean Rating") +
                     theme_minimal(),
                   "Solo travel" = data_formentera |>
                     filter(trip_type == "Solo travel") |>
                     group_by(name) |>
                     summarise(mean_rating = mean(rating)) |>
                     arrange(desc(mean_rating)) |>
                     head(5) |> 
                     ggplot(aes(x = reorder(name, mean_rating), y = mean_rating)) +
                     geom_bar(stat = "identity", fill = "skyblue") +
                     coord_flip() +
                     labs(x = "Attraction",
                          y = "Mean Rating") +
                     theme_minimal())
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
