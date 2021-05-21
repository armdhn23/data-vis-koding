library(maps)
library(geosphere)
library(rgdal)
library(dplyr)

peta_ind <- readOGR("/home/ashari/Documents/Project/data-vis-koding/5-Choropleths & points/data/covid_shapes.geojson")

data_penerbangan <- read.csv("7-datavis/data/data penerbangan sultan hasanuddin.csv")
koordinat_bandara <- read.csv("7-datavis/data/koordinat bandara.csv")

koordinat_upg <- koordinat_bandara %>%
  filter(nama_bandara == "Sultan Hasanuddin")

data_penerbangan <- inner_join(data_penerbangan, koordinat_bandara,
                               by = c("Tujuan" = "nama_bandara"))

#create basemap
#plot(peta_ind)
plot(peta_ind,  fill=T, col="grey8", bg="grey15")
#overlay airports
points(data_penerbangan$longitude,data_penerbangan$latitude, pch=3, cex=0.1, col="chocolate1")

#
for (i in (1:dim(data_penerbangan)[1])) { 
  inter <- gcIntermediate(c(koordinat_upg$longitude[1], koordinat_upg$latitude[1]), 
                          c(data_penerbangan$longitude[i], data_penerbangan$latitude[i]), n=200)
  lines(inter, lwd=0.2, col="turquoise2")    
}
