library(highcharter)
library(tidyverse)

nilai_ekspor_data <- read.csv("9/data/nilai_ekspor.csv")

nilai_ekspor_data%>%
  hchart(type = "treemap", hcaes(x = negara_tujuan, value = nilai_ekspor, 
                                 color = nilai_ekspor)) %>%
  hc_title(text = "Nilai Ekspor Menurut Negara Tujuan Utama (Nilai FOB: juta US$)
           Tahun 2020")
