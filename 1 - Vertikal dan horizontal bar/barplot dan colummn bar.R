# https://www.halodoc.com/artikel/selain-virus-corona-ini-wabah-mematikan-lainnya-dalam-sejarah
#https://www.worldometers.info/coronavirus/?utm_campaign=homeAdvegas1?

#impor library
library(ggplot2)
library(png)
library(ggimage)

#data
wabah <- read.csv('1 - Vertikal dan horizontal bar/data/angka kematian wabah.csv')
wabah$angka_kematian_juta <- wabah$angka_kematian/1000000
wabah$img_position <- wabah$angka_kematian_juta + 5
wabah$image <- "1 - Bar dan Column Bar/img/virus.png"

#plot
ggplot(wabah, aes(nama_wabah, angka_kematian_juta, fill=nama_wabah)) + 
  geom_bar(stat = 'identity') +
  scale_fill_manual(values = c("#fdf542", "#ff0000", "#f9530b", "#fbd808")) +
  geom_image(aes(image = image, y = img_position), size = 0.12) +
  ggtitle("Wabah Mematikan", subtitle = "Perbandingan Angka Kematian") +
  xlab("Nama Virus") +
  ylab("Angka Kematian (satuan Juta)") +
  ylim(0, 60) + theme_classic() +
  theme(legend.position = "none")

#Icons made by Smashicons from @flaticon

#########
library(tidyverse)

#data
akb <- read.csv('1 - Vertikal dan horizontal bar/data/angka kematian bayi.csv')
akb$kuantil_kekayaan <- factor(akb$kuantil_kekayaan,
                               levels = c('Terbawah', 'Menengah bawah',
                                          'Menengah', 'Menengah atas',
                                          'Teratas'))
# grafik
akb %>%
  mutate(name = fct_reorder(kuantil_kekayaan, desc(akb))) %>%
  ggplot( aes(x=kuantil_kekayaan, y=akb)) +
  geom_bar(stat="identity", fill="#fa961b", alpha=.6, width=.4) +
  geom_text(
    aes(label = akb, y = akb - 1),
    position = position_dodge(0.9),
    vjust = 0.5
  ) +
  coord_flip() +
  xlab("Kuantil Kekayaan") +
  ylab("Angka Kematian Bayi") +
  ggtitle("Angka Kematian Bayi ",
          subtitle ="Berdasarkan Kuantil Kekayaan") +
  theme_bw()
