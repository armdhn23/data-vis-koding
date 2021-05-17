library(ggrepel)
library(tidyverse)
library(ggtext)

data_medsos <- data.frame(medsos = rep(c("Whatsapp", "Facebook", "Instagram", 
                                       "Tiktok", "Twitter"),2),
                          tahun = factor(c(rep(2019,5), rep(2020, 5))),
                          durasi = c(25.9, 15.9, 16.8, 3.2, 7.6,
                                     30.8, 17, 17, 13.8, 8.1),
                          warna = c(rep("no", 3), "yes", rep("no",4), "yes", "no"))
data_medsos

graph <- 
ggplot(data = data_medsos, aes(x = tahun, y = durasi, group = medsos, fill=warna)) +
  geom_line(aes(color = warna), size = 2) +
  geom_point(aes(color = warna, alpha = 1), size = 4) +
  geom_text_repel(data = data_medsos %>% filter(tahun == "2019"), 
            aes(label = paste0(medsos, " - ", durasi, " jam")) , 
            hjust = 1.35, 
            fontface = "bold", 
            size = 4, color = "white") +
  geom_text_repel(data = data_medsos %>% filter(tahun == "2020"), 
            aes(label = paste0(medsos, " - ", durasi, " jam")) , 
            hjust = -.35, 
            fontface = "bold", 
            size = 4, color = "white") +
  geom_vline(xintercept = 1, linetype="dashed", size=.1, color = "white") + 
  geom_vline(xintercept=2, linetype="dashed", size=.1, color="white") +
  scale_color_manual(labels = c("Up", "Down"), 
                     values = c("no"="#696969", "yes"="#FF0000"))   # color of lines
graph
graph <- graph +
  labs(
    title = "Perubahan  <span style = 'color:#FF0000;'>Durasi</span> Bermedsos Orang Indonesia",
    subtitle = "Durasi bermedsos (jam/bulan) mengalami kenaikan, paling signifikan pada Tiktok. 
         \n Apa karena  <span style = 'color:#FF0000;'>Pandemi?</span>",
    caption = "Sumber: Katadata Indonesia"
  ) +
 ylab("Durasi (Jam per bulan)") +
  geom_text(label="Tahun 2019", x=1, y=1.1*32, hjust=1.2, size=5, color="white") +  # title
  geom_text(label="Tahun 2020", x=2, y=1.1*32, hjust=-0.1, size=5, color="white") + # title
  ylim(0, 35)

graph +
  theme(legend.position = "none", 
        panel.grid.major.x = element_blank(), panel.grid.minor.x  = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_text(color = "white"),
        axis.ticks = element_blank(), #
        plot.title = element_markdown(size=14, face = "bold", hjust = 0.5, color = "white"),
        plot.subtitle =  element_markdown(hjust = 0.5, color = "white"),
        plot.caption = element_text(color="white"),
        plot.background = element_rect("black"),
        panel.background = element_rect(fill = "black", color  =  NA),
        axis.text.x = element_blank()
  ) +

ggsave("6-datavis/durasi_medsos.png", dpi = 320, width = 6.5, height = 6.5)

