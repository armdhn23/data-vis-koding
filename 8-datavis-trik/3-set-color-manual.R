library(ggplot2)
library(dplyr)

data_cyl <- 
  mtcars %>%
  group_by(factor(cyl)) %>%
  summarise(n()) %>%
  rename("cyl" = `factor(cyl)`, counts = `n()`)

ggplot(data_cyl, aes(x=cyl, y = counts, fill=cyl )) +  
  geom_bar(stat = "identity")

plot <- ggplot(data_cyl, aes(x=cyl, y = counts, fill=cyl )) +  
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("#cbaacb", "#97c1a9", "#ff968a"))
plot


plot +
  ggtitle("Mtcars Data") +
  labs(x = "Cyl", y = "Count", fill = "Cyl") +
  theme(axis.text = element_text(size = 10),
        axis.ticks.x = element_blank(),
        plot.title = element_text(hjust = 0, size = 11, face = "bold" ),
        panel.background = element_rect(fill = "white"),
        legend.key = element_rect(fill = "white")) +
  geom_label(aes(label = counts), vjust = 0, show.legend = F) +
  ylim(0,16)

