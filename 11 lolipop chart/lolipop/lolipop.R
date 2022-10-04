library(openxlsx)
library(ggplot2)
library(dplyr)

data_kota <- read.xlsx("data/kota-kenaikan-harga-rumah.xlsx")


p <- data_kota %>%
  arrange(kenaikan) %>%   
  mutate(nama_kota=factor(nama_kota, levels=nama_kota)) %>%  
  ggplot( aes(x=nama_kota, y=kenaikan)) +
  geom_segment( aes(xend=nama_kota, yend=0), color="orange") +
  geom_point( size=4, color="orange") +
  coord_flip() +
  ggtitle("Kenaikan Harga Rumah di beberapa kota") +
  ylim(-2,9) +
  xlab("") 
  
p +  
  theme(plot.background = element_rect(fill = "black"),
        panel.background = element_rect(fill = "black",
                                        colour = "darkblue",
                                        size = 0.5, linetype = "solid"),
        panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                        colour = "white"), 
        panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                        colour = "white"),
        axis.title.x=element_text(face="bold", color="white",size=15),
        axis.text.y = element_text(size=15, color = "white"),
        axis.text.x = element_text(size=15, color = "white"),
        plot.title = element_text(size=20, color = "white"))

