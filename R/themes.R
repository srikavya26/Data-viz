# theme used for graphs in the textbook and course
library(dslabs)
ds_theme_set()
# themes from ggthemes
install.packages('ggthemes')
install.packages("ggrepel")

library(ggthemes)
p + theme_economist()    # style of the Economist magazine
# p + theme_fivethirtyeight()    # style of the FiveThirtyEight website
# load libraries
# Putting it all together to assemble the plot
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)
# define the intercept
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  .$rate

# make the plot, combining all elements
murders %>%
  ggplot(aes(population/10^6, total, label = abb)) +
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name = "Region") +
  theme_economist()

