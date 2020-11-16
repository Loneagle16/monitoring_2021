# R spatial 

library(sp)

data(meuse)

head(meuse)

coordinates(meuse) = ~x+y

plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="concentration of zinc")

# Exercise: plot the concentration of cooper
spplot(meuse, "copper", main="concentration of copper")

# Exercise: see copper and zinc
spplot(meuse, c("copper", "zinc"))

# Rather than using colors, let's make use of bubbles
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead")

# change the colour
bubble(meuse, "lead", col="blue")

library(ggplot2)

# ecological dataframe
# biofuels
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
biofuels
# oxydative enzimes 
oxydative <- c(1200, 1300, 21000, 34000, 50000)
oxydative

# dataframe
d <- data.frame(biofuels, oxydative)
d

ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()

ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "blue")

# lines 
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line()

# points + lines
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "blue") + geom_line()

# polygons
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()

# IMPORT DATA FROM AN EXTERNAL SOURCE
# setwd("path/lab")

# setdw for Windows
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid






