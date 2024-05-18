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

locations_formentera <- tibble(name = all_locations$name, 
       location_id = all_locations$location_id, 
       address = all_locations$address_obj$address_string,
       street = all_locations$address_obj$street1,
       city = all_locations$address_obj$city,
       state = all_locations$address_obj$state,
       country = all_locations$address_obj$country,
       postal_code = all_locations$address_obj$postal_code)

# Filter the locations for Formentera
locations_formentera <- locations_formentera |>  
  filter(state == "Formentera")


#Save the data to a CSV file
  write_csv(locations_formentera, "Data/attractions_formentera.csv")
  
  
  
#Get the reviews for each location
all_reviews <- tibble()

for(i in 1:nrow(locations_formentera)) {
  location_id <- locations_formentera$location_id[i]
  
  url_reviews <- paste0("https://api.content.tripadvisor.com/api/v1/location/", location_id, "/reviews")
  
  queryString <- list(
    key = api,
    language = "en"
  )
  
  response <- VERB("GET", url_reviews, query = queryString, content_type("application/octet-stream"), accept("application/json"))
  
  if(status_code(response) == 200) {
    review_data <- content(response, "text") %>% 
      fromJSON()
    
    reviews <- review_data$data
    
    all_reviews <- bind_rows(all_reviews, reviews)
  } else {
    print(paste("Failed to get reviews for location", location_id, ". Status code:", status_code(response)))
  }
}
  
  
  