library(ggtext)
library(tidyverse)

data_cacat <- read_csv('6-datavis/data/jumlah_disabilitas.csv')
data_cacat$jenis_disabilitas <- as.factor(data_cacat$jenis_disabilitas)
data_cacat$jenis_kelamin <- as.factor(data_cacat$jenis_kelamin)

str(data_cacat)

cacat <- data_cacat %>%
  group_by(jenis_disabilitas, jenis_kelamin) %>%
  summarise(total = sum(jumlah, na.rm = T))

p1 <- ggplot(cacat) +
  geom_path(aes(total, jenis_disabilitas, group = jenis_disabilitas), 
            color = "grey50", size = 0.75) +
  geom_point(aes(total, jenis_disabilitas, color = jenis_kelamin), 
             size = 20) +
  geom_text(aes(total, jenis_disabilitas, label = total), size = 6, 
            color = "black", check_overlap = T, 
            family = "Produkt Medium") +
  scale_color_manual(values = c("#4A9EA8", "#E06843")) +
  labs(
    title = "<span>Jumlah Penyandang Disabilitas pada 
    <span style = 'color:#4A9EA8;'>Laki-laki</span>, dan 
    <span style = 'color:#E06843;'>Perempuan</span>",
    subtitle = "Jakarta Tahun 2017",
    caption = "Sumber: JakartaOpenData | Grafik: Ashari Ramadhan"
  ) +
  theme_minimal(base_family = "Futura Medium") +
  theme(
    legend.position = "none",
    plot.margin = margin(20, 20, 20, 20),
    axis.text.y = element_text(size = 16),
    axis.title = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(color = "grey70", size = 0.3),
    panel.grid.minor.x = element_line(color = "grey80", size = 0.15),
    plot.title = element_markdown(hjust = 0, size = 24, margin = margin(10, 0, 0, 0), family = "Canonical"),
    plot.subtitle = element_text(hjust = 0, size = 18, margin = margin(10, 0, 30, 0), family = "Canonical"),
    plot.caption = element_text(hjust = 0, size = 12, margin = margin(30, 0, 0, 0), family = "Produkt", color = "grey30")
  )
p1

ggsave("6-datavis/disabilitas.png", dpi = 320, width = 16, height = 12)
