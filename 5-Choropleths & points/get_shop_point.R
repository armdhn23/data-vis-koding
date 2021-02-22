library(tidyverse)
library(osmdata)

available_features()

shopping <- available_tags("shop")

# titik lat dan long kota makassar
coordinate <- getbb("makassar")

# mengambil data lokasi toko
shop <- coordinate %>%
  opq()%>%
  add_osm_feature(key = "shop", value = c(shopping)) %>%
  osmdata_sf()

# merapikan data
shop_point <- data.frame(shop$osm_points[c('osm_id', 'name', 'addr.street', 'shop')])
shop_point$geometry <- as.character(shop_point$geometry)
shop_point <- shop_point %>% separate(geometry, c("long", "lat"), ", ")

shop_point$long <- str_remove_all(shop_point$long, "[c(]")

shop_point$lat <- str_remove_all(shop_point$lat, "[)]")

shop_point$long <- as.numeric(shop_point$long)
shop_point$lat  <- as.numeric(shop_point$lat )

# simpan
write.csv(shop_point, "shop_point_mks.csv")
