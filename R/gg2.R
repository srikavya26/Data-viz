## ggplot2 uses a grammar of graphics to break plots into building blocks that have intuitive syntax, making it easy to create relatively complex and aesthetically pleasing plots with relatively simple and readable code.
## ggplot2 is designed to work exclusively with tidy data (rows are observations and columns are variables
library(ggplot2)
library(dslabs)
data(murders)
ggplot(data = murders)
murders %>% ggplot()
p <- ggplot(data = murders)
class(p)
print(p)    # this is equivalent to simply typing p
p
library(tidyverse)
library(dslabs)
data(murders)
# Aesthetic mappings describe how properties of the data connect with features of the graph (axis position, color, size, etc.) 
# add points layer to predefined ggplot object
# geom_point() creates a scatterplot and requires x and y aesthetic mappings. 
# Define aesthetic mappings with the aes() function.
p <- ggplot(data = murders)
p + geom_point(aes(population/10^6, total))

# add text layer to scatterplot
# geom_text() and geom_label() add text to a scatterplot and require x, y, and label aesthetic mappings.
p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))

# no error from this call
p_test <- p + geom_text(aes(population/10^6, total, label = abb))

# error - "abb" is not a globally defined variable and cannot be found outside of aes
p_test <- p + geom_text(aes(population/10^6, total), label = abb)
# change the size of the points
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb))
# move text labels slightly to the right
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)
# simplify code by adding global aesthetic
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))
p + geom_point(size = 3) +
  geom_text(nudge_x = 1.5)
# local aesthetics override global aesthetics
p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello there!"))
p + geom_point(size = 3) +
  annotate("text", x = 10, y = 800, label = "Hello there!", size = 4)

