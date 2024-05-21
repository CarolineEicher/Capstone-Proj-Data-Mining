library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "Hello Traveller!",
  sidebar = sidebar("Choose your Travel Interests"),
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
