# Libraries
library(tidyverse)
library(viridis)
library(patchwork)
library(hrbrthemes)
library(circlize)
library(networkD3)
library(ggtext)


####### world

plastics <- read_csv('6-datavis/data/plastics.csv')
plastics %>%
  filter(year == 2020) %>%
  group_by(parent_company) %>%
  summarise(total = sum(grand_total, na.rm = T)) %>%
  arrange(desc(total))

company <- c("The Coca-Cola Company", "Universal Robina Corporation",
             "Unilever", "Nestle", "Colgate-Palmolive", "Pepsico")

country_count <- plastics %>%
  filter(parent_company %in% company,
         country != "EMPTY", year == 2020) %>%
  group_by(country) %>%
  summarise(total = sum(grand_total, na.rm = T)) %>%
  arrange(desc(total))

country_ <- c(country_count[1:15, 1])

# data
data_plastic <- plastics %>%
  select(country, parent_company, grand_total) %>%
  filter(parent_company %in% company,
         country %in% country_$country)

colnames(data_plastic) <- c("target", "source", "value")

# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(name=c(as.character(data_plastic$source), as.character(data_plastic$target)) %>% unique())

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
data_plastic$IDsource=match(data_plastic$source, nodes$name)-1 
data_plastic$IDtarget=match(data_plastic$target, nodes$name)-1

# prepare colour scale
ColourScal ='d3.scaleOrdinal() .range(["#FDE725FF","#B4DE2CFF","#6DCD59FF","#35B779FF","#1F9E89FF","#26828EFF","#31688EFF","#3E4A89FF","#482878FF","#440154FF"])'

# Make the Network
sankeyNetwork(Links = data_plastic, Nodes = nodes,
              Source = "IDsource", Target = "IDtarget",
              Value = "value", NodeID = "name", 
              sinksRight=FALSE, nodeWidth=40, fontSize=13, nodePadding=20)

##ggplot

plastic_data <- gather_set_data(data_plastic, 1:2)
g <-
ggplot(plastic_data, aes(x, id = id, split = y, value = value)) +
  geom_parallel_sets(aes(fill=source), alpha = 0.6, axis.width = 0.1) +
  scale_fill_brewer(palette = "RdYlGn") +
  geom_parallel_sets_axes(axis.width = 0.1) +
  geom_parallel_sets_labels(color = NA, angle = 0, hjust = 0,
                            family = "Montserrat", size = 2.5)

gg <- ggplot_build(g)
gg

g +
  geom_richtext(data = filter(gg[["data"]][[3]], 
                              !str_detect(label, paste(plastic_data$source, collapse = "|"))),
                aes(x, y, label = str_to_upper(label)),
                inherit.aes = FALSE,
                hjust = 0, 
                stat = "unique",
                label.color = NA,
                fill = "black",
                nudge_x = 0.06,
                color = "white", 
                family = "Montserrat") +
  geom_richtext(data = filter(gg[["data"]][[3]], 
                              str_detect(label, paste(plastic_data$source, collapse = "|"))),
                aes(x, y, label = label),
                inherit.aes = FALSE,
                hjust = 1, 
                stat = "unique",
                # label.color = "grey80",
                label.color = NA,
                fill = "black",
                nudge_x = -0.06,
                color = "white",
                family = "Montserrat") +
  labs(title = "SAMPAH PLASTIK",
       subtitle = "BERASAL DAN BERAKHIR DIMANA?",
       caption = "Sumber: Break Free From Plastic Brand Audit 2020 | Visualisasi: Ashari Ramadhan",
       fill = "Perusahaan") +
  theme_void(base_family = "Barlow") +
  theme(axis.title = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "none",
        plot.title = element_markdown(family = "Barlow SemiBold", color = "black", size = 32),
        plot.subtitle = element_text(size = 24),
        plot.caption = element_markdown(hjust = 0),
        plot.background = element_rect(color = NA, fill = "grey98"),
        plot.margin = margin(t = 12, l = 8, r = 8, b = 8))

ggsave(file.path("6-datavis", "breakfreefromplastic_companies_countries.png"), type = "cairo", dpi = 200, width = 10.5, height = 8.8)
