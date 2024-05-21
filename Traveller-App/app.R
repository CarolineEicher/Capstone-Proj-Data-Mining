library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "Hello Traveller!",
  sidebar = sidebar(
    helpText(
      "Choose your Travel Interests"
      ),
    selectInput(
      "location",
      label = "Location:",
      choices = list(
        "Formentera" = 1
        ),
      selected = 1
    ),
    selectInput(
      "travel type",
      label = "Your Travel Type:",
      choices = list(
        "Couple" = 1, 
        "Family" = 2, 
        "Friends getaway" = 3, 
        "Solo traveller" = 4),
      selected = 1
    )
  ),
  card(
    card_header("Welcome to the Traveller App"),
    "This app is designed to help you find the best travel destinations for your interests based on your 
    fellow travellers experiences. Select your interests and we will show the best destinations for you!",
    card_footer("Happy Travelling!")
    )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
