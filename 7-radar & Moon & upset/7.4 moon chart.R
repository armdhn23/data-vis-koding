library(tidyverse)
library(gggibbous)

data1 <- data.frame(
  kel = c("lk", "pr"),
  pct = c(1-0.2667, 0.2667)
)

data_legend <- data.frame(
  Gender = c("Laki-laki", "Perempuan"),
  xx = c(1, 1),
  yy = c(1,1)
)

to_plot <-
data1 %>%
  pivot_wider(
    names_from = kel,
    values_from = pct
  ) %>%
  mutate(
    label = "26% Perempuan \n Terlibat di Parlemen \n Sulteng Tahun 2020"
  )

plot <- 
to_plot %>%
  ggplot(aes(x = 1, y = 1)) +
  geom_moon(aes(ratio = lk, right = FALSE), size = 100, fill = "#683332") +
  geom_moon(aes(ratio = pr), size = 100, fill = "red") +
  geom_text(
    aes(y = 1, label = label),
    family = "Public Sans",
    colour = "gray90",
    size = 3.5
  ) +
  theme(
    plot.background = element_rect(fill = "black", colour = NA),
    panel.background = element_rect(fill = "black", colour = NA),
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank()
  )

plot +
  geom_point(data = data_legend,
             aes(colour=Gender, shape = NA)) +
  scale_color_manual(values = c("#683332", "red")) +
  theme(legend.title = element_text(size=12, color = "white"), 
        legend.text = element_text(size=10, color = "white"),
        legend.background = element_rect(fill='black'),
        legend.key=element_rect(fill='black')) + 
  guides(colour = guide_legend(override.aes = list(size=2, stroke=1.5))) 



p2 <- p + geom_point(data = xx.sub1.df, aes(size="xx.sub1", shape = NA), colour = "grey50")