library(tidyverse)
library(hrbrthemes)

jumlah_rt <- read.csv("jumlah pengguna air kemasan.csv")

jumlah_rt %>%
ggplot(aes(Tahun, Jumlah)) +
  geom_line(color="grey") +
  ylim(0, 20000) +
  geom_point(shape=21, color="black", fill="#69b3a2", size=4) +
  theme_ipsum() +
  ggtitle("Jumlah Rumah Tangga dengan Sumber Air Minum: Air Kemasan",
          subtitle = "Provinsi Sulawesi Barat")
  
