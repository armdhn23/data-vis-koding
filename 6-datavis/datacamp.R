library(tidyverse)

sets <- read_rds("data/sets.rds")
parts <- readRDS("data/parts.rds")
part_categories <- readRDS("data/part_categories.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")
inventories <- readRDS("data/inventories.rds")
colors <- read_rds("data/colors.rds")

# Use the suffix argument to replace .x and .y suffixes
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix = c("_part", "_category")) %>%
  count(name_category, sort=TRUE)

# Combine the parts and inventory_parts tables
parts %>%
  inner_join(inventory_parts, by = "part_num" )

#combine more table
sets %>%
  # Add inventories using an inner join 
  inner_join(inventories, by="set_num") %>%
  # Add inventory_parts using an inner join 
  inner_join(inventory_parts, by = c("id" ="inventory_id"))

# Add an inner join for the colors table
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color"))

# Count the number of colors and sort
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color")) %>%
  count(name_color, sort=T) 
