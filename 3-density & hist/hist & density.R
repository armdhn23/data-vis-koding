library(tidyverse)
library(hrbrthemes)

# dummy dataset one variabel
data_1 <- data.frame(
 value = rnorm(1000, mean=4)
)

# Represent it
ggplot(data_1, aes(x=value)) +
  geom_histogram( color="#e9ecef", fill="#ffb449") +
  theme_ipsum() 


# dummy dataset two variabel
data_2 <- data.frame(
  type = c( rep("variable 1", 1000), rep("variable 2", 1000) ),
  value = c( rnorm(1000), rnorm(1000, mean=4) )
)

# Represent it
ggplot(data_2, aes(x=value, fill=type)) +
  geom_histogram(color="#e9ecef", alpha=0.8) +
  scale_fill_manual(values=c("#d46c4e", "#ffb449")) +
  theme_ipsum() +
  labs(fill="")


### density

#library
library(tidyverse)
library(hrbrthemes)

# dummy dataset one variabel
data_1 <- data.frame(
  value = rnorm(1000, mean=4)
)

ggplot(data_1, aes(x=value)) +
  geom_density( color="#e9ecef",  fill="#ffb449") +
  theme_ipsum()

#library
library(tidyverse)
library(hrbrthemes)

# dummy dataset two variabel
data_2 <- data.frame(
  type = c(rep("variable 1", 1000), rep("variable 2", 1000)),
  value = c(rnorm(1000), rnorm(1000, mean=4))
)
ggplot(data_2, aes(x=value, fill=type)) +
  geom_density(color="#e9ecef", alpha=0.8) +
  scale_fill_manual(values=c("#d46c4e", "#ffb449")) +
  theme_ipsum() +
  labs(fill="")
