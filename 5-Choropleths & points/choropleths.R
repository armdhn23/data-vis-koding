library(rgdal)
library(leaflet)

indo_geo <- readOGR("5-Choropleths & points/data/covid_shapes.geojson")

kemiskinan <- read_csv("5-Choropleths & points/data/persentase penduduk miskin.csv")

indo_geo@data <- inner_join(indo_geo@data, kemiskinan, by="provinsi")

bins <- c(0, 4, 8, 12, 16)
pal <- colorBin("YlOrRd", 
                domain = indo_geo@data$`persentase penduduk miskin`, 
                bins = bins)

labels <- sprintf(
  "<strong>%s</strong><br/> Penduduk Miskin %g persen",
  indo_geo@data$provinsi, indo_geo@data$`persentase penduduk miskin`
) %>% lapply(htmltools::HTML)

leaflet(indo_geo) %>%
  addTiles() %>%
  addPolygons(
    fillColor = ~pal(indo_geo@data$`persentase penduduk miskin`),
    weight = 2,
    opacity = 1,
    color = "black",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "red",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto")) %>%
  addLegend(pal = pal, values = ~indo_geo@data$`persentase penduduk miskin`, 
            opacity = 0.7, title = "Persentase Penduduk Miskin",
            position = "bottomright")


#
























#http://joshuamccrain.com/tutorials/maps/streets_tutorial.html