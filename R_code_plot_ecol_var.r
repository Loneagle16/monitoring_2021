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


