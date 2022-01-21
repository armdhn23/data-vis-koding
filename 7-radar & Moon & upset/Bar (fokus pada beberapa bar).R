library(ggplot2)
library(dplyr)

data_emisi <- data.frame(
  sektor = c("Energi", "IPPU", "Pertanian", 
             "Limbah", "FOLU", "Kebakaran Hutan"), 
  jumlah_emisi = c(558.890, 	55.395, 	121.686, 	
                   120.191, 	282.098, 	12.513)
)


data_emisi %>%
  mutate(warna = ifelse(sektor == "Energi", "A", "B")) %>%
  ggplot(aes(sektor, jumlah_emisi, fill = warna)) +
  geom_bar(stat = "identity") +
  xlab("Jumlah Emisi (ribu ton CO2e)") +
  ylab("Sektor") +
  scale_fill_manual(values = c("red", "grey30")) +
  theme_classic() +
  theme(
    legend.position = "blank",
    panel.background = element_rect(fill = "black", color  =  NA),
    panel.border = element_rect(fill = NA, color = "white"),  
    panel.grid.major = element_line(color = "grey35"),  
    panel.grid.minor = element_line(color = "grey20"),  
    plot.background = element_rect(color = "black", fill = "black")
  )

data_emisi %>%
  mutate(warna = ifelse(sektor %in% c("Limbah", "FOLU"), "A", "B")) %>%
  ggplot(aes(sektor, jumlah_emisi, fill = warna)) +
  geom_bar(stat = "identity") +
  xlab("Jumlah Emisi (ribu ton CO2e)") +
  ylab("Sektor") +
  scale_fill_manual(values = c("red", "grey30")) +
  theme_classic() +
  theme(
    legend.position = "blank",
    panel.background = element_rect(fill = "black", color  =  NA),
    panel.border = element_rect(fill = NA, color = "white"),  
    panel.grid.major = element_line(color = "grey35"),  
    panel.grid.minor = element_line(color = "grey20"),  
    plot.background = element_rect(color = "black", fill = "black")
  )

data_emisi %>%
  mutate(warna = ifelse(jumlah_emisi > 200, "A", "B")) %>%
  ggplot(aes(sektor, jumlah_emisi, fill = warna)) +
  geom_bar(stat = "identity") +
  xlab("Jumlah Emisi (ribu ton CO2e)") +
  ylab("Sektor") +
  scale_fill_manual(values = c("red", "grey30")) +
  theme(
    legend.position = "blank",
    panel.background = element_rect(fill = "black", color  =  NA),
    panel.border = element_rect(fill = NA, color = "white"),  
    panel.grid.major = element_line(color = "grey35"),  
    panel.grid.minor = element_line(color = "grey20"),  
    plot.background = element_rect(color = "black", fill = "black")
  )

