
library(ggtext)
library(showtext)
library(tidyverse)


data_point <- read.csv("11 lolipop chart/data/jumlah_penduduk_sulteng.csv")



d1 <- data_point %>% 
  mutate(artists_thds = plyr::round_any(total, 2e3) / 2e3) %>% 
  arrange(desc(artists_thds)) %>% 
  mutate(nb_cols = artists_thds %/% 5,
         to_add = artists_thds %% 5,
         ymin = seq(86, 2, -7),
         ymax = seq(90, 4, -7))

tbl_list_1 <- list()
tbl_list_2 <- list()

for (i in 1:nrow(d1)) {
  
  if (d1$to_add[i] != 0) {
    
    tbl_list_1[[i]] <- tibble(
      provinsi = d1$provinsi[i],
      x = c(rep(seq(1, d1$nb_cols[i], 1), each = 5), rep(d1$nb_cols[i] + 1, times = d1$to_add[i])),
      y = c(rep(seq(d1$ymin[i], d1$ymax[i], 1), times = d1$nb_cols[i]),
            seq(d1$ymax[i], (d1$ymax[i] - (d1$to_add[i] - 1)), -1))
    )
  }
  
  if (d1$to_add[i] == 0) {
    
    tbl_list_2[[i]] <- tibble(
      provinsi = d1$provinsi[i],
      x = rep(seq(1, d1$nb_cols[i], 1), each = 5),
      y = rep(seq(d1$ymin[i], d1$ymax[i], 1), times = d1$nb_cols[i])
    )
  }
  
}

final_tbl <- as_tibble(rbind(data.table::rbindlist(tbl_list_1), data.table::rbindlist(tbl_list_2)))



p <- ggplot() +
  geom_point(data = final_tbl, aes(x = x, y = y),
             colour = "#2a3132", size = 0.75) +
  geom_text(data = d1, aes(x = -5, y = (ymin + ymax) / 2,
                           label = provinsi, family = "recursive"),
            hjust = 1, size = 15, colour = "#2a3132") +
  geom_text(data = d1, aes(x = nb_cols + 3, y = (ymin + ymax) / 2,
                           label = formatC(total, format = "f", big.mark = ",", digits = 0),
                           family = "recursive"),
            hjust = 0, size = 15, colour = "#2a3132") +
  labs(title = "Jumlah Penduduk Kab/Kota Prov.Sulteng",
       subtitle = "Setiap titik merepresentasikan **2,000 penduduk**",
       caption = "Inspirasi: Jonathan Kitt (Twitter) | Sumber Data: SP2020 - BPS Sulteng | #Semangat!") +
  xlim(-60, 110) +
  theme_void() +
  theme(panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"),
        plot.title = element_markdown(family = "roboto slab", size = 100, colour = "#336b87",
                                      margin = margin(20, 0, 10, 50)),
        plot.subtitle = element_markdown(family = "roboto slab", size = 50, colour = "#336b87",
                                         margin = margin(0, 0, 20, 50)),
        plot.caption = element_markdown(size = 25, colour = "#336b87", hjust = 0.5,
                                        margin = margin(20, 0, 10, 0)))

p
# Save plot ----

ggsave("2022_09_27_us_artists.png", p, dpi = 320, width = 10, height = 6)
