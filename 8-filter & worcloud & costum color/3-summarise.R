set.seed(1)
df <- data.frame(
  nama = c("AA", "AA", "BB", "BB", "CC", "CC"),
  matkul = rep(c("Kalkulus", "Aljabar"),3),
  ipk = sample(50:97, 6)
)
df

df %>%
  group_by(matkul) %>%
  summarise(rata_rata = mean(ipk))
