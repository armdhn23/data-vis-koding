library(leaflet)
library(tidyverse)

shop_point <- read_csv("5-Choropleths & points/data/shop_point_mks.csv")

supermarket <- shop_point %>%
  drop_na(name) %>%
  filter(shop == "supermarket")

leaflet(supermarket) %>% 
  addTiles() %>% addMarkers(
    lng = ~long,
    lat = ~lat,
    #popup = ~paste('Name:', name),
    label = ~name,
    clusterOptions = markerClusterOptions(
      maxClusterRadius = 70
    )
  )


leaflet(shop_point) %>% addTiles() %>% addHexbin()
