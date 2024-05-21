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
    selectInput(
      "location_type",
      label = "Location Type",
      choices = list(
        "Attractions" = 1
      ),
      selected = 1
    ),
    selectInput(
      "travel_type",
      label = "Your Travel Group Type",
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
    we will show the must see places for you in your next travel destination based on 
    your fellow travellers ratings.",
    card_footer("Happy Travelling!")
    ),
  textOutput("selected_destination"),
  textOutput("selected_location_type"),
  textOutput("selected_travel_type")
)

# Define server logic ----
server <- function(input, output) {
  output$selected_destination <- renderText({
    "You have selected"
    input$destination
  })
  output$selected_location_type <- renderText({
    "You have selected"
    input$location_type
  })
  output$selected_travel_type <- renderText({
    "You have selected"
    input$travel_type
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
