# load ggplot2
library(ggplot2)
library(hrbrthemes)

# mtcars dataset is natively available in R
# head(mtcars)

# A basic scatterplot with color depending on Species
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width,
                 shape=Species, color=Species)) + 
  geom_point(size=6, alpha=0.6) +
  theme_ipsum() +
  ggtitle("Scatter Plot Sepal Length & Width",
          subtitle = "By Species")

#### Hexbin

# Library
library(tidyverse)

# Data
a <- data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 10, 1.2) )
b <- data.frame( x=rnorm(20000, 14.5, 1.9), y=rnorm(20000, 14.5, 1.9) )
c <- data.frame( x=rnorm(20000, 9.5, 1.9), y=rnorm(20000, 15.5, 1.9) )
data <- rbind(a,b,c)


# Basic scatterplot
ggplot(data, aes(x=x, y=y) ) +
  geom_point() +
  theme_bw() +
  ggtitle("Scatter Plot",
          subtitle = "Large Dataset")

# Hexbin chart with default option
ggplot(data, aes(x=x, y=y) ) +
  geom_hex() +
  theme_bw() +
  ggtitle("Hexbin Chart",
          subtitle = "Large Dataset")

# Bin size control + color palette
ggplot(data, aes(x=x, y=y) ) +
  geom_hex(bins = 70) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

