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
      "destination",
      label = "Destination",
      choices = list(
        "Formentera" = 1
        ),
      selected = 1
    ),
    checkboxGroupInput(
      "travel type",
      label = "Your Travel Group Type:",
      choices = list(
        "Couple" = 1, 
        "Family" = 2, 
        "Friends Getaway" = 3, 
        "Solo Traveller" = 4)
    )
  ),
  card(
    card_header("Welcome to the Traveller App"),
    "This app is designed to help you planing your next trip. Select your interests and 
    we will show the must see places for you in your next travel destination.",
    card_footer("Happy Travelling!")
    )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
