#/home/ashari/Documents/Project/Pelatihan Himpunan EDA

df <- read.csv(
    "data/fifa.csv"
)

arsenal <- df %>%
  filter(Club == "Arsenal")

arsenal <- arsenal[c("Club", "Finishing", "HeadingAccuracy", "Crossing", 
                "ShortPassing", "Dribbling", "SprintSpeed",
                "Jumping", "Stamina", "Strength")]

data_arsenal <- arsenal %>%
  summarise(Finishing = mean(Finishing),
            HeadingAccuracy = mean(HeadingAccuracy),
            Crossing = mean(Crossing),
            ShortPassing = mean(ShortPassing),
            Dribbling = mean(Dribbling),
            SprintSpeed = mean(SprintSpeed), 
            Jumping = mean(Jumping),
            Stamina = mean(Stamina),
            Strength = mean(Strength)
            
            )

rownames(data_arsenal) <- "Arsenal"

##chelsea

FC_Tokyo <- df %>%
  filter(Club == "FC Tokyo")

FC_Tokyo <- FC_Tokyo[c("Club", "Finishing", "HeadingAccuracy", "Crossing", 
                     "ShortPassing", "Dribbling", "SprintSpeed",
                     "Jumping", "Stamina", "Strength")]

data_FC_Tokyo <- FC_Tokyo %>%
  summarise(Finishing = mean(Finishing),
            HeadingAccuracy = mean(HeadingAccuracy),
            Crossing = mean(Crossing),
            ShortPassing = mean(ShortPassing),
            Dribbling = mean(Dribbling),
            SprintSpeed = mean(SprintSpeed), 
            Jumping = mean(Jumping),
            Stamina = mean(Stamina),
            Strength = mean(Strength)
            
  )

rownames(data_FC_Tokyo) <- "FC Tokyo"

### totenham

milan <- df %>%
  filter(Club == "Milan")

milan <- milan[c("Club", "Finishing", "HeadingAccuracy", "Crossing", 
                     "ShortPassing", "Dribbling", "SprintSpeed",
                     "Jumping", "Stamina", "Strength")]

data_milan <- milan %>%
  summarise(Finishing = mean(Finishing),
            HeadingAccuracy = mean(HeadingAccuracy),
            Crossing = mean(Crossing),
            ShortPassing = mean(ShortPassing),
            Dribbling = mean(Dribbling),
            SprintSpeed = mean(SprintSpeed), 
            Jumping = mean(Jumping),
            Stamina = mean(Stamina),
            Strength = mean(Strength)
            
  )

rownames(data_milan) <- "Milan"


max_min <- data.frame(
  Finishing = c(100, 0), HeadingAccuracy = c(100, 0), Crossing = c(100, 0),
  ShortPassing = c(100, 0), Dribbling = c(100, 0), SprintSpeed = c(100, 0),
  Jumping = c(100, 0), Stamina = c(100, 0), Strength = c(100, 0)
)
rownames(max_min) <- c("Max", "Min")

final_data <- rbind(max_min, data_arsenal, data_FC_Tokyo, data_milan)
final_data

arsenal_data <- rbind(max_min, data_arsenal)
# Plot the data for student 1
library(fmsb)
radarchart(final_data)


create_beautiful_radarchart <- function(data, color = "#00AFBB", 
                                        vlabels = colnames(data), vlcex = 0.7,
                                        caxislabels = NULL, title = NULL, ...){
  radarchart(
    data, axistype = 1,
    # Customize the polygon
    pcol = color, pfcol = scales::alpha(color, 0.5), plwd = 2, plty = 1,
    # Customize the grid
    cglcol = "grey", cglty = 1, cglwd = 0.8,
    # Customize the axis
    axislabcol = "grey", 
    # Variable labels
    vlcex = vlcex, vlabels = vlabels,
    caxislabels = caxislabels, title = title, ...
  )
}

# Reduce plot margin using par()
op <- par(mar = c(1, 2, 2, 2))
# Create the radar charts
create_beautiful_radarchart(
  data = arsenal_data, caxislabels = c(0, 25, 50, 75, 100),
  color = c("#eb3434", "#E7B800", "#FC4E07", "#34eb77", "#6e34eb"),
  title = "Arsenal"
)
# Add an horizontal legend
legend(
  x = "bottom", legend = rownames(data_arsenal[-c(1,2),]), horiz = TRUE,
  bty = "n", pch = 20 , col = c("#00AFBB", "#E7B800", "#FC4E07", "#34eb77", "#6e34eb"),
  text.col = "black", cex = 1, pt.cex = 1.5
)
par(op)

# Define colors and titles
colors <- c("#00AFBB", "#E7B800", "#FC4E07")
titles <- c("Milan", "FC Tokyo", "Arsenal")

# Reduce plot margin using par()
# Split the screen in 3 parts
op <- par(mar = c(1, 1, 1, 1))
par(mfrow = c(1,3))

# Create the radar chart
for(i in 3){
  create_beautiful_radarchart(
    data = final_data[c(1, 2, i+2), ], caxislabels = c(0, 25, 50, 75, 100),
    color = colors[i], title = titles[i]
  )
}
par(op)
