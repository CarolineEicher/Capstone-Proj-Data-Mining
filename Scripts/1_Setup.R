#Load the necessary packages
library(tidyverse)
library(httr)
library(jsonlite)

# Load the API key
api <- readr::read_csv("API_key.csv")$API_key

# Set up storage for all locations
all_locations <- tibble()

# Get the locations
url_search <- "https://api.content.tripadvisor.com/api/v1/location/search"

queryString <- list(
  key = api,
  searchQuery = "formentera",
  category = "attractions",
  language = "en",
  limit = 50
)

response <- VERB("GET", url_search, query = queryString, content_type("application/octet-stream"), accept("application/json"))

if(status_code(response) == 200) {
  search_data <- content(response, "text") %>% 
    fromJSON()
  
  locations <- search_data$data
  
  all_locations <- bind_rows(all_locations, locations)
} else {
  print(paste("Failed to get locations. Status code:", status_code(response)))
}

# Filter the locations for Formentera
locations_formentera <- all_locations |> 
  filter(all_locations$address_obj$state == "Formentera")
