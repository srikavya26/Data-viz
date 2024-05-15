#Barplot 
murders |> ggplot(aes(region)) + geom_bar()
data(murders)
tab <- murders |> 
  count(region) |> 
  mutate(proportion = n/sum(n))
tab
tab |> ggplot(aes(region, proportion)) + geom_bar(stat = "identity")

#histogram

heights |> 
  filter(sex == "Female") |> 
  ggplot(aes(height)) +
  geom_histogram(binwidth = 1, fill = "darksalmon", col = "black") +
  xlab("Female heights in inches") + 
  ggtitle("Histogram")

#Density Plot 
heights |> 
  filter(sex == "Female") |>
  ggplot(aes(height)) +
  geom_density(fill="darkslategray2")

#Images 
x <- expand.grid(x = 1:12, y = 1:10) |> 
  mutate(z = 1:120) 
x |> ggplot(aes(x, y, fill = z)) + 
  geom_raster()
# change the color,  scale_fill_gradientn layer.
x |> ggplot(aes(x, y, fill = z)) + 
  geom_raster() + 
  scale_fill_gradientn(colors =  terrain.colors(10))

# QuickPlot
qplot(x, bins=15, color = I("black"), xlab = "Population")
