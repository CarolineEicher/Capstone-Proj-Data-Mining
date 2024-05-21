library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "Hello Traveller!",
  sidebar = sidebar("Choose your Travel Interests"),
  "Travel Suggestions"
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)