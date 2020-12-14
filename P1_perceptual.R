P1_data <- read.delim("P1_perceptual_map.csv")

P1_product_perception <- read.delim("P1_product_perception.csv", stringsAsFactors = TRUE)


library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)




# blue, green, orange, purple, red, yellow
myColors <- c("#0000FF", "#00FF00", "#e67e22", "#8e44ad", "#FF0000", "#f1c40f")
names(myColors) <- levels(P1_product_perception$Company)
col_scale <- scale_color_manual(name = "Company", values = myColors)

g <- ggplot() + 
  geom_point(data = P1_product_perception, aes(x = Price, y = Weight, color = Company), size = 2) + col_scale + 
  geom_point(data = P1_ideal_points, aes(x = Price, y = Weight, shape = Segment), color = "black", size = 4)
ggplotly(g)


g1 <- ggplot() + 
  geom_point(data = P1_product_perception, aes(x = Price, y = Complex., color = Company), size = 2) + col_scale + 
  geom_point(data = P1_ideal_points, aes(x = Price, y = Complex., shape = Segment), color = "black", size = 4)
ggplotly(g1)
