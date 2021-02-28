library(tidyverse)
library(osmdata)


available_features()

stasiun_kereta <- available_tags("public_transport")
#station
terminal_bus <- available_tags("amenity")
#bus_station
# titik lat dan long kota makassar
coordinate <- getbb("makassar")

# mengambil data lokasi toko
station <- coordinate %>%
  opq()%>%
  add_osm_feature(key = "public_transport", value = "station") %>%
  osmdata_sf()

street_primary <- coordinate %>%
  opq() %>%
  add_osm_feature(key = "highway", value = c("primary")) %>%
  osmdata_sf()

street_secondary <- coordinate %>%
  opq() %>%
  add_osm_feature(key = "highway", value = c("secondary")) %>%
  osmdata_sf()

streets <- coordinate %>%
  opq() %>%
  add_osm_feature(key = "highway", value = c("primary", "secondary", "tertiary")) %>%
  osmdata_sf()

ggplot() +
  geom_sf(data = street_primary$osm_lines,
          inherit.aes = FALSE,
          colour = "red",
          alpha = .5,
          size = 2) +
  geom_sf(data = street_secondary$osm_lines,
          inherit.aes = FALSE,
          colour = "blue",
          alpha = .5,
          size = 2) +
  geom_sf(data = station$osm_points,
          inherit.aes = FALSE,
          colour = "yellow",
          fill = "yellow",
          size = 2,
          shape = 21) +
  labs(x = "", y = "")

leaflet(streets$osm_lines) %>% 
  addTiles() %>% 
  addPolylines()
  addMarkers(
    lng = ~long,
    lat = ~lat,
    #popup = ~paste('Name:', name),
    label = ~name,
    clusterOptions = markerClusterOptions(
      maxClusterRadius = 70
    )
  )

#query
mercadona <- osmdata_sf(q)

#final map
ggplot(mercadona$osm_points)+
  geom_sf(colour = "#08519c",
          fill = "#08306b",
          alpha = .5,
          size = 1,
          shape = 21)+
  theme_void()
