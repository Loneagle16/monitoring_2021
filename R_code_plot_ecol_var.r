# comment

# R code for plotting the relationship among ecological variables

# install.packages is used to install packages
install.packages("sp")
library(sp)

# data is used to recall datasets
data(meuse)

# look inside the set!
meuse

View(meuse)

head(meuse)



# exercise: mean of all of the variables?
# cadmium crazy mean extraction 
# (11.7+8.6+6.5+2.6+2.8+3.0)/6

summary(meuse)

# exercise: plot zinc (y) against cadmium (x)
# error
plot(cadmium, zinc)

# $

plot(meuse$cadmium, meuse$zinc)

attach(meuse)
plot(cadmium, zinc)

plot(cadmium, lead)

# how to impress your supervisor
# Scatterplot Matrices
pairs(meuse)

# Question
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc 

# Exercise
# Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)

pairs(meuse)

head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6 

pairs(meuse[,3:6])

# let's use the name of the columns 
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tilde done with Alt + 126

# let's prettify the graph
# exercise: just use cadmium, lead and zinc
pairs(~ cadmium + lead + zinc, data=meuse)

# exercise: change the color
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="blue")

# exercise: change the symbol to filled triangles: pch
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="blue", pch=17)

head(meuse)

# exercise: increase the size of triangles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="blue", pch=17, cex=3)


