library(ggupset)
library(tidyverse)

df = tidy_movies %>%
  distinct(title, year, length, .keep_all = T)

ggplot(df, aes(x=Genres)) +
  geom_bar(fill = "#3773b8") + 
  ylim(0, 1300) +
  geom_text(stat = "count", aes(label=after_stat(count)), vjust = -1, size = 3) +
  scale_x_upset(n_intersections = 12)

