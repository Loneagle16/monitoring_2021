# R_code_energy.r

library(rasterdiv)
library(raster)

data(copNDVI)
plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)

clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

dev.off()

# crop
ext <- c(0,20,35,55) # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)

# Deforestation example
library(raster)
library(RStoolbox)

setwd("C:/lab/")

defor1 <- brick("defor1_.png")
plotRGB(defor1, r=1, g=2, b=3, strech="Lin") 
plotRGB(defor1, 2, 1, 3, strech="Lin") 

#exercise: import the defor2 image
defor2 <- brick("defor2_.png")
plotRGB(defor2, r=1, g=2, b=3, strech="Lin") 

# excercise: put the images one beside the other
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, strech="Lin") 
plotRGB(defor2, r=1, g=2, b=3, strech="Lin") 

dev.off()
# dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

# dvi2 after the cut 
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# difference biomass before and after cut
difdvi <- dvi1 - dvi2
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

hist(difdvi, col="red")

########## final part
# defor1
# defor2 
# dvi1
# dvi2
# difdv1
# histogram

par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, strech="Lin") 
plotRGB(defor2, r=1, g=2, b=3, strech="Lin")
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")





