library(tidyverse)

df <- data.frame(
  nama = c("AA", "BB", "CC", "DD", "EE"),
  ijazah = c("S1", "S1", "SMA", "S2", "S3")
)

df

df %>%
  filter(ijazah == "S1")

df %>%
  filter(ijazah %in% c("S2", "S3"))

df <- data.frame(
  nama = c("AA", "BB", "CC", "DD", "EE"),
  nilai = c(90, 80, 50, 55, 71),
  ipk = c(3.56, 3.66, 2.89, 2.9, 3.04)
)
df

df %>%
  filter(nilai >= 55 & nilai <=75)

df %>%
  filter(nilai > 70 | ipk > 3.6)
