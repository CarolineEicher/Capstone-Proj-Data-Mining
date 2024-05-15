#Load the necessary packages
library(tidyverse)
library(httr)

# Load the API key
api_key <- readr::read_csv("API_key.csv")$API_key

# Get the location IDs
url_search <- "https://api.content.tripadvisor.com/api/v1/location/search"

queryString <- list(
  searchQuery = "formentera"
  category = "attractions",
  language = "en"
)

response <- VERB("GET", url, query = queryString, content_type("application/octet-stream"), accept("application/json"))

content(response, "text")