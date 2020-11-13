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
